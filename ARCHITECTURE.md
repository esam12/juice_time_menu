# Architecture Documentation

## Overview

This Flutter application follows a **Clean Architecture** pattern with clear separation of concerns across four layers:

1. **Domain Layer** - Business logic and entities (immutable models)
2. **Data Layer** - Data sources, repositories, and mappers
3. **Application Layer** - State management (Riverpod providers)
4. **Presentation Layer** - UI widgets and views

## Layer Structure

### Domain Layer (`lib/features/home/domain/`)

Contains pure business logic and immutable domain models using Freezed:

- `models/` - Immutable domain models:
  - `product.dart` - Product entity
  - `category.dart` - Category entity
  - `flavor.dart` - Flavor entity
  - `flavor_option.dart` - Flavor option group
  - `localized_text.dart` - Localized text wrapper

**Key Principles:**
- All models are immutable (using Freezed)
- No dependencies on other layers
- Contains business logic methods

### Data Layer (`lib/features/home/data/`)

Handles data operations and external dependencies:

- `repositories/` - Repository interfaces and implementations
- `sources/` - Data sources (local, remote, etc.)
- `models/` - Data layer entities (different from domain models)
- `mappers/` - Convert between data and domain models

**Key Principles:**
- Implements repository interfaces from domain layer
- Handles data transformation
- Abstracts data sources (Firebase, API, local storage)

### Application Layer (`lib/features/home/application/`)

Manages application state using Riverpod:

- `providers/` - Riverpod providers for state management
  - `menu_providers.dart` - Menu data providers
  - Uses `FutureProvider` for async data
  - Uses `StateProvider` for simple state
  - Uses selective listening to optimize rebuilds

**Key Principles:**
- Single source of truth for state
- Providers are testable and composable
- Uses `select()` for granular rebuilds

### Presentation Layer (`lib/features/home/presentation/`)

UI components and views:

- `views/` - Screen widgets
- `widgets/` - Reusable UI components
- `providers/` - Presentation-specific providers (if needed)

**Key Principles:**
- Widgets are pure (no business logic in build methods)
- Logic extracted to separate methods
- Uses `ConsumerWidget` for Riverpod integration
- Optimized with `const` constructors where possible

## State Management

### Riverpod Only

The application uses **Riverpod** as the exclusive state management solution:

- `FutureProvider` - For async data fetching
- `StateProvider` - For simple mutable state
- `Provider` - For computed/derived state
- `Provider.family` - For parameterized providers

### Performance Optimizations

1. **Selective Listening**: Uses `ref.watch()` with specific providers to avoid unnecessary rebuilds
2. **Provider Families**: Isolates state per product/category to prevent global rebuilds
3. **Pure Widgets**: Extracts logic from build methods to prevent rebuilds
4. **Const Constructors**: Uses `const` wherever possible
5. **Memoization**: Providers cache results automatically

## Code Generation

### Freezed Models

Run the following to generate Freezed code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- `*.freezed.dart` - Freezed model implementations
- `*.g.dart` - JSON serialization code

## Performance Considerations

### Low-End Device Optimization

1. **Image Loading**: Uses `Image.network` with proper error/loading builders
2. **Lazy Loading**: Uses `ListView.builder` for large lists
3. **Selective Rebuilds**: Only rebuilds affected widgets
4. **Const Widgets**: Minimizes widget tree rebuilds
5. **Async Operations**: Properly handles loading states

### Avoiding Unnecessary Rebuilds

- Use `ref.watch()` only for needed providers
- Extract widgets to prevent parent rebuilds
- Use `ValueKey` for list items
- Use `AnimatedSwitcher` with proper keys

## Testing Strategy

### Unit Tests
- Domain models (pure functions)
- Repository implementations
- Mappers

### Widget Tests
- Pure widgets
- Consumer widgets with mocked providers

### Integration Tests
- Full user flows
- Provider interactions

## Future Improvements

1. **Error Handling**: Add proper error handling with Result/Either pattern
2. **Caching**: Implement proper caching strategy
3. **Offline Support**: Add local database (Hive/Isar)
4. **Analytics**: Add analytics tracking
5. **Deep Linking**: Implement deep linking with go_router

## Migration Notes

### Old Code Removal

The following old files should be removed after verification:
- `lib/features/home/data/models/product.dart` (old model)
- `lib/features/home/data/models/category.dart` (old model)
- `lib/features/home/presentation/manager/providers/menu_provider.dart` (old provider)

### Breaking Changes

- Models are now immutable (Freezed)
- Providers moved to `application/providers/`
- Domain models use different naming (`Product` vs `ProductModel`)

## Running the App

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate code:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Code Style

- Follow Flutter/Dart style guide
- Use meaningful variable names
- Add documentation for public APIs
- Keep functions small and focused
- Prefer composition over inheritance
