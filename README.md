# Flutter MVVM Starter

Create scalable Flutter apps with MVVM architecture, state management & dependency injection using the [Stacked Flutter Framework](https://stacked.filledstacks.com/).

## Usage

1. Clone the repository locally or use the template for your own projects:

2. Install dependencies using the following command:

```bash
flutter pub get
```

3. Generate files with `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app on your emulator of choice (simulator in case of iOS):

```
flutter run
```

## Folder Structure

```
lib/
|- api/
|- app/
|- constants/
|- enums/
|- exceptions/
|- models/
|- services
|- ui
  |- [screen_name]/
  |- shared/
|- main.dart
```
