import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lemmy_api_client/v3.dart';
import 'package:provider/provider.dart';

import '../../hooks/logged_in_action.dart';
import '../../stores/accounts_store.dart';
import '../../util/async_store_listener.dart';
import '../../util/extensions/api.dart';
import '../../util/icons.dart';
import '../../util/observer_consumers.dart';
import '../../util/share.dart';
import '../../widgets/post/post.dart';
import '../../widgets/post/post_more_menu.dart';
import '../../widgets/post/post_store.dart';
import '../../widgets/post/save_post_button.dart';
import '../../widgets/reveal_after_scroll.dart';
import '../../widgets/write_comment.dart';
import 'comment_section.dart';
import 'full_post_store.dart';

class FullPostPage extends StatelessWidget {
  final String? instanceHost;
  final int? id;
  final PostView? postView;
  final PostStore? postStore;

  const FullPostPage({required int this.id, required String this.instanceHost})
      : postView = null,
        postStore = null;
  const FullPostPage.fromPostView(PostView this.postView)
      : id = null,
        instanceHost = null,
        postStore = null;
  const FullPostPage.fromPostStore(PostStore this.postStore)
      : id = null,
        instanceHost = null,
        postView = null;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        if (postStore != null) {
          return FullPostStore.fromPostStore(postStore!);
        } else if (postView != null) {
          return FullPostStore.fromPostView(postView!);
        } else {
          return FullPostStore(instanceHost: instanceHost!, postId: id!);
        }
      },
      builder: (context, store) => AsyncStoreListener(
        asyncStore: context.read<FullPostStore>().fullPostState,
        child: AsyncStoreListener<BlockedCommunity>(
          asyncStore: context.read<FullPostStore>().communityBlockingState,
          successMessageBuilder: (context, asyncStore) {
            final name =
                asyncStore.data.communityView.community.originPreferredName;
            return '${asyncStore.data.blocked ? 'Blocked' : 'Unblocked'} $name';
          },
          child: const _FullPostPage(),
        ),
      ),
    );
  }
}

/// Displays a post with its comment section
class _FullPostPage extends HookWidget {
  const _FullPostPage();

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useMemoized(() {
      final store = context.read<FullPostStore>();
      final token = context
          .read<AccountsStore>()
          .defaultUserDataFor(store.instanceHost)
          ?.jwt;
      store.refresh(token);
    }, []);

    final loggedInAction =
        useLoggedInAction(context.read<FullPostStore>().instanceHost);

    return ObserverBuilder<FullPostStore>(
      builder: (context, store) {
        Future<void> refresh() async {
          unawaited(HapticFeedback.mediumImpact());
          await store.refresh(context
              .read<AccountsStore>()
              .defaultUserDataFor(store.instanceHost)
              ?.jwt);
        }

        if (store.postView == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: (store.fullPostState.isLoading)
                  ? const CircularProgressIndicator.adaptive()
                  : FailedToLoad(
                      message: 'Post failed to load', refresh: refresh),
            ),
          );
        }

        // VARIABLES

        final post = store.postView!;

        sharePost() => share(post.post.apId, context: context);

        comment() async {
          final newComment = await Navigator.of(context).push(
            WriteComment.toPostRoute(post.post),
          );

          if (newComment != null) {
            store.addComment(newComment);
          }
        }

        return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: RevealAfterScroll(
                scrollController: scrollController,
                after: 65,
                child: Text(
                  post.community.originPreferredName,
                  overflow: TextOverflow.fade,
                ),
              ),
              actions: [
                IconButton(icon: Icon(shareIcon), onPressed: sharePost),
                Provider<PostStore>(
                  create: (context) => store.postStore!,
                  child: const SavePostButton(),
                ),
                IconButton(
                  icon: Icon(moreIcon),
                  onPressed: () => showPostMoreMenu(
                    context: context,
                    postStore: store.postStore!,
                    fullPostStore: store,
                  ),
                ),
              ],
            ),
            floatingActionButton: post.post.locked
                ? null
                : FloatingActionButton(
                    onPressed: loggedInAction((_) => comment()),
                    child: const Icon(Icons.comment),
                  ),
            body: RefreshIndicator(
              onRefresh: refresh,
              child: ListView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 15),
                  PostTile.fromPostStore(store.postStore!),
                  const CommentSection(),
                ],
              ),
            ));
      },
    );
  }
}

class FailedToLoad extends StatelessWidget {
  final String message;
  final VoidCallback refresh;

  const FailedToLoad({required this.refresh, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        const SizedBox(height: 5),
        ElevatedButton.icon(
          onPressed: refresh,
          icon: const Icon(Icons.refresh),
          label: const Text('try again'),
        )
      ],
    );
  }
}
