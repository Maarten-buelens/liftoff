## Unreleased
- Change post's vote count loading animation to be circular

## v0.9.14 - 2023-06-26
- Add TOTP Login Support
- Corrected URL for comments
- Removed QUERY_ALL_PACKAGES

## v0.9.13 - 2023-06-25
- Fixed broken API for mark as read functionality
- Added mark all as read 
- Slide to dismiss post #59

## v0.9.12 - 2023-06-24
- Merged in iOS support
- Added clickthrough for NSFW content, and associated setting.
- Added option to hide Everything feed as this was v confusing to new users.
- Improved messaging when interacting with content delivered via non-signed instances.
- Added 'via' information on posts to help with above.
- Limit total size of rich text field in post bodies as v large images
could fill pages.
- Replaced DELETE account (from instance) button with a Remove account (from app) button to prevent
risk of death threats :-)
- Limited width of main body components for a more reasonable feel on iPad.
- Minor UI tweaks
- Hide Top Nav bar while scrolling on home/posts tab (#43)
- Added settings icon to home tab nav bar (#25)
- Added double tap to exit (#24)



## v0.9.11 - 2023-06-24
- Updated api client to better support 0.18.x
- Fixes login stalling on 0.18.x instances

## v0.9.8 - 2023-06-23
- Updated app icon 

## v0.9.7 - 2023-06-23
- Fixed comments not loading when there is a pinned comment on the post
- added initial ios support

## v0.9.6 - 2023-06-22
- Fixed issue with compact mode not showing full post items
- Fixed issue with adding v0.18.x instances

## v0.9.5 - 2023-06-22
- Fixed comment nesting bug due to old API schema Issue
- Added compact post view
- Added settings option for post border radius
- Added settings option for post shadow
- Added thumbmail for media posts in compact view

## v0.9.4 - 2023-06-21
- Support for Lemmy v0.17.x
- Upgraded SDK and kotlin
- Various API changes due to app being stale for 4 months
- Reconfigured build pipeline to support new app name
- App renamed to Liftoff

## v0.9.1 - 2023-06-21
- Zach learns how to make mistakes

### Added

- Create post community picker now has autocomplete
- You can now add an instance from the three dots menu on the instance page
- Editor for writing comments, posts, and profile bio now has a toolbar with shortcuts to all the common markdown things

## v0.8.0 - 2022-01-14

### Added

- Support for Lemmy v0.15.0

### Changed

- "Time ago" strings, dates, and compact numbers are now localized

## v0.7.0 - 2021-11-04

### Added

- Blocking of users and communities (from post and from comment)
- Reporting posts and comments
- Android theme-aware splash screen (thanks to [@mimi89999](https://github.com/mimi89999))
- Logging: local logs about some actions/errors. Can be accessed from **settings > about liftoff > logs**

### Fixed

- Fixed a bug where post would go out of sync with full version of the post
- Fixed a bug where making a comment selectable would not always result in making the comment selectable
- Full post will now open no matter where you press on the post card
- Fixed overflows in various places

### Changed

- User banner photo now fits better on user profile

## v0.6.0 - 2021-09-06

### Added

- Support for Lemmy v0.12.0
- Show cake day on a user's profile and next to their name in a comment

## v0.5.0 - 2021-04-29

### Added

- Editing posts
- Editing comments
- Show avatars setting toggle
- Show scores setting toggle
- Default sort type setting
- Default listing type setting
- Import Lemmy settings: long press an account in account settings then choose the import option
- Support lemmy v0.11.0

### Fixed

- Added deduplication in infinite scrolls
- Fixed bug where creating post would crash after uploading a picture

## v0.4.2 - 2021-04-12

### Changed

- Disable commenting on locked posts
- Enhanced keyboard experience
  - appropriate keyboard types are opened
  - correct capitalization
  - added text input hints for things like password managers
- Account actions in settings are more obvious to access: long press an account/instance to see possible actions such as setting as default or removal

### Added

- When writing a comment, the parent text is now selectable
- Text of a post is now selectable
- Tapping outside of a text input hides the keyboard

### Fixed

- Actually fixed the thing that v0.4.1 supposedly fixed

## v0.4.1 - 2021-04-06

### Fixed

- Some actions would pass the wrong user id around causing infinite spinners, this is now fixed

## v0.4.0 - 2021-04-05

### Added

- Share buttons on windows/linux now copy the data to the clipboard
- Initial translations have been incorporated into liftoff. It is not yet possible to contribute translation strings

### Changed

- Transitioned to Lemmy API v3

### Fixed

- Quote blocks in posts and comments are now much prettier
- Code blocks now have monospace font. As they should
- Switching accounts in the profile tab now correctly reacts to the change
- You can no longer add the same instance twice just by changing capitalization (thanks to @ryg-git)

## v0.3.0 - 2021-02-25

WARNING: due to some internal changes your local settings will be reset (logged out of accounts, removed instances, theme back to default)

### Added

- Added inbox page, that can be accessed by tapping bell in the home tab
- Added page with saved posts/comments. It can be accessed from the profile tab under the bookmark icon
- Added ability to send private messages
- Added modlog page. Can be visited in the context of an instance or community from the about tab
- You can now create posts from the community page

### Changed

- Titles on some pages, have an appear effect when scrolling down
- Long pressing comments now has a ripple effect
- Nerd stuff now contains more nerd stuff
- Communities that a user follows will no longer appear on a user's profile in most scenarios

### Fixed

- Time of posts is now displayed properly. Unless you live in UTC zone, then you won't notice a difference
- Fixed a bug where links would not work on Android 11

## v0.2.3 - 2021-02-09

Liftoff is now available on the [play store](https://play.google.com/store/apps/details?id=com.liftoffapp.liftoff) and [f-droid](https://f-droid.org/packages/com.liftoffapp.liftoff)

### Changed

- Posts with large amount of text are now truncated in infinite scroll views
- Changed image viewer dismissal to be more fun. The image now also moves on the x axis, changes scale and rotates a bit for more user enjoyment

### Fixed

- Fixed issue where the "About liftoff" tile would not appear on Windows/Linux
- Added a bigger bottom margin in the comment section to prevent the floating action button from covering the last comment

## v0.2.2 - 2021-02-03

Minimum Lemmy version supported: `v0.9.4`

### Added

- Online users count is now correctly displayed
- APKs are now signed

### Fixed

- Fixed a bug where replying to a comment would instead reply to the parent of that comment
- Fixed a bug where comments would be displayed as a grey block
- Fixed a bug where adding/removing accounts could cause the home/communities/search tabs to crash
- Fixed a bug where up/down voting twice cause the comment/post to crash

## v0.2.1 - 2021-02-03

[YANKED]

## v0.2.0 - 2021-01-27

### Breaking changes

- Liftoff now works exclusively with Lemmy API v2

### Added

- You can now manage account-specific settings, such as username, avatar, etc.

### Fixed

- Fixed a bug where in some circumstances removal of an instance would fail

## v0.1.1 - 2021-01-17

### Added

#### Pages

- Instance page
- Community page
- Post page
- User profile page
- Home tab
- Communities tab
- Search tab
- Profile tab
- Settings

#### Actions

- Create comment
- Create post
- Upvote/Downvote
- Save comments/posts
- Follow/Unfollow communities

#### Other

- Light/dark/AMOLED themes
- Manage multiple accounts/instances

### Notable things that don't work / are not implemented yet

- No notifications page
- No way to browse saved posts/comments
- Themes are not yet finalized so they might not look great in some situations
- Other than pictures, there is absolutely no caching

Remember: there's always option to open instance/community/post/comment in web browser from the app if there is a missing feature
