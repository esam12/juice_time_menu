# Setup Instructions

## Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK

## Installation Steps

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Generate Freezed Code

**IMPORTANT**: You must run build_runner to generate Freezed model code before the app will compile.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `*.freezed.dart` files for immutable models
- `*.g.dart` files for JSON serialization

### 3. Run the App

```bash
flutter run
```

## Troubleshooting

### Build Errors

If you see errors about missing `*.freezed.dart` or `*.g.dart` files:

1. Make sure you've run `flutter pub get`
2. Run `flutter pub run build_runner build --delete-conflicting-outputs`
3. If issues persist, try:
   ```bash
   flutter clean
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

### Version Conflicts

If you encounter version conflicts with freezed/json_serializable:

1. Check `pubspec.yaml` for compatible versions
2. The current setup uses:
   - `freezed: ^2.5.2`
   - `json_serializable: ^6.7.1`
   - `freezed_annotation: ^2.4.1`

## Development Workflow

### After Adding/Modifying Freezed Models

Always run build_runner after changing Freezed models:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or use watch mode for automatic regeneration:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Project Structure

See `ARCHITECTURE.md` for detailed architecture documentation.
