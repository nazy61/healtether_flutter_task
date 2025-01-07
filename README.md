# HealTether Flutter Task

## Overview

This Flutter application fetches user data from a remote API and displays it in a list. It implements basic state management and handles loading, data, and error states.

## Features

- Fetches user data from the API: https://jsonplaceholder.typicode.com/users
- Displays user names, emails, and avatars in a ListView.
- Handles loading, error, and data states using Provider/Riverpod.
- Pull-to-refresh functionality.
- Search functionality to filter users by name.

## Pre-requisites

To run the project, ensure you have the following installed:

- Flutter SDK: Install Flutter (version 3.0 or higher is recommended).
- Android Studio/VS Code (or any IDE with Flutter/Dart plugins).
- Android Emulator or physical device connected for testing.

## How to run the code

- Clone the Repository

```bash
  git clone https://github.com/nazy61/healtether_flutter_task
  cd healtether_flutter_task
```

- Install Dependencies: Run the following command to install the required Dart and Flutter packages:

```bash
  flutter pub get
```

- Run the Application: Connect your emulator or physical device and run the following command:

```bash
  flutter run
```

- Building APK (Optional): To generate a release APK for testing on a physical Android device, use:

```bash
  flutter build apk --release
```
