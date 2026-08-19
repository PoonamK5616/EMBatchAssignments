# Flutter Like Counter App

## Description
This is a simple Flutter application built for a university assignment. It demonstrates core Flutter concepts including state management using `StatefulWidget`, UI composition, and interactive elements. 

The app features a social media style "Like" button. When clicked, it updates the state using `setState()` to increment the like count and immediately reflects the changes on the UI.

## Technologies & Widgets Used
- **Language**: Dart
- **Framework**: Flutter
- **Widgets**: `MaterialApp`, `Scaffold`, `AppBar`, `Padding`, `Column`, `Row`, `Text`, `Icon`, `SizedBox`, `ElevatedButton`.

## Widget Tree Architecture
Here is the structural blueprint of the UI:

```text
main()
 └── runApp()
      └── MaterialApp
           └── LikeCounterApp (StatefulWidget)
                └── Scaffold
                     ├── AppBar
                     └── Padding (body)
                          └── Column (Centered)
                               ├── Text ("Do you like this post?")
                               ├── SizedBox
                               ├── Row (Centered)
                               │    ├── Icon (Heart)
                               │    ├── SizedBox
                               │    └── Text (Likes Count)
                               ├── SizedBox
                               └── ElevatedButton ("Like Post")
```

## How to Run
1. Ensure you have the Flutter SDK installed and an emulator running (or a connected physical device).
2. Clone or download this repository.
3. Run `flutter pub get` in the terminal to fetch dependencies.
4. Run `flutter run` to launch the app.
