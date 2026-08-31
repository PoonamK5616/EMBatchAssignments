# Instagram Feed Flutter App

A small Flutter social-feed application built as part of the EMBatchAssignments project. It presents an Instagram-inspired feed with local post images, post actions, like counters, and a services/contact page accessible from the phone icon in the app bar.

The app is intentionally self-contained: it does not require a backend, account, network connection, or external API to display the feed.

## Features

### Instagram-style feed

- Displays three local posts using `assets/images/post1.png`, `post2.png`, and `post3.png`.
- Shows a profile placeholder, username, post subtitle, follow button, post image, action row, like count, caption, and a large like button for each post.
- Keeps the post images contained inside a consistent, responsive tile so the complete image remains visible.
- Uses Material 3 styling with a white background and Material icons.

### Interactive controls

- Each post has an independent like state and like counter.
- Tapping a like control toggles the heart and increments or decrements that post's count.
- The phone icon in the top app bar opens the services page.
- The services page lists UI/UX design, app development, web development, and support services.

The comment, share, save, follow, notification, and direct-message controls are currently visual placeholders. They are ready to be connected to behavior in a future iteration.

## Screens

### Home feed

The app starts on `HomePage`. Scroll vertically to view all three posts. Each post has its own like counter, so liking one post does not change the others.

### Services/contact page

Tap the phone icon in the top-right app bar to navigate to `ContactPage`. This page currently presents the available services as reusable `ServiceCard` widgets.

## Requirements

Install the following before running the project:

- Flutter SDK with Dart SDK support
- A platform toolchain for the target platform:
	- Android Studio and an Android emulator or device for Android
	- Xcode and an iOS Simulator or device for iOS
	- Chrome for web
	- The relevant desktop tooling for macOS, Windows, or Linux
- A configured Flutter device or emulator

The project currently declares Dart SDK compatibility as `^3.13.0`. Check the installed versions with:

```bash
flutter --version
dart --version
flutter doctor
```

Resolve any issues reported by `flutter doctor` before running the application.

## Run Locally

Clone the repository and move into the project directory:

```bash
git clone <repository-url>
cd EMBatchAssignments
```

Fetch Flutter dependencies:

```bash
flutter pub get
```

List available devices and start the app:

```bash
flutter devices
flutter run
```

To run on a specific device, use its device identifier:

```bash
flutter run -d <device-id>
```

Common examples include:

```bash
flutter run -d chrome
flutter run -d macos
```

## Development Workflow

Run the analyzer after making changes:

```bash
flutter analyze
```

Run the test suite:

```bash
flutter test
```

Format Dart files with:

```bash
dart format lib test
```

While `flutter run` is active, press `r` in the terminal for hot reload or `R` for hot restart.

## Project Structure

```text
EMBatchAssignments/
├── assets/
│   └── images/
│       ├── post1.png
│       ├── post2.png
│       └── post3.png
├── lib/
│   ├── contact_page.dart   # Services/contact screen and ServiceCard
│   ├── home_page.dart      # Instagram-style feed and like state
│   └── main.dart            # Application entry point and theme
├── test/
│   └── widget_test.dart     # Flutter widget tests
├── analysis_options.yaml    # Dart analyzer and lint configuration
├── pubspec.yaml             # Dependencies and asset registration
└── README.md
```

## Dependencies

The project uses a small dependency set:

- `flutter`: Flutter framework and Material widgets
- `cupertino_icons`: Cupertino icon support
- `video_player`: available for future media support
- `flutter_test`: widget and unit testing tools
- `flutter_lints`: recommended Dart and Flutter lint rules

All image assets are registered through the `assets/images/` entry in `pubspec.yaml`. If you add or rename an image, update that directory and use the matching asset path in the Dart code.

## Branches

The README is intended to live on the main branch and remain useful for feature branches. To work from the latest main branch:

```bash
git checkout main
git pull origin main
flutter pub get
```

Create a feature branch before making new changes:

```bash
git checkout -b feature/<short-description>
```

Before opening a pull request, run `flutter analyze` and `flutter test`, then verify the feed and phone navigation on the target device.

## Building

Build for the platform you want to distribute to:

```bash
flutter build apk       # Android APK
flutter build appbundle # Android Play Store bundle
flutter build ios       # iOS build; requires macOS and Xcode
flutter build web       # Web build
```

For release builds, configure signing, application identifiers, versioning, and platform-specific deployment settings according to the target platform.

## Troubleshooting

### Dependencies are missing

Run:

```bash
flutter clean
flutter pub get
```

Then start the app again with `flutter run`.

### Images do not appear

Confirm that the files exist under `assets/images/`, that the paths in `lib/home_page.dart` match the filenames exactly, and that `flutter pub get` has been run after changing `pubspec.yaml`.

### No device is available

Run `flutter devices`, start an emulator or simulator, connect a physical device, or use Chrome with `flutter run -d chrome`.

## Useful Documentation

- [Flutter documentation](https://docs.flutter.dev/)
- [Flutter installation guide](https://docs.flutter.dev/get-started/install)
- [Flutter cookbook](https://docs.flutter.dev/cookbook)
- [Dart language documentation](https://dart.dev/guides)
