# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

동구라미 (Donggurami) - Suwon University's official club/circle management platform. Flutter cross-platform app primarily deployed to web (donggurami.net), with legacy iOS/Android apps.

## Common Commands

```bash
# Install dependencies
flutter pub get

# Run development
flutter run

# Build for web (production)
flutter build web --release --source-maps

# Run code generation (Freezed, Retrofit, JSON serialization)
flutter pub run build_runner build

# Run tests
flutter test

# Lint/analyze
flutter analyze
```

## Architecture

**Pattern**: MVVM + Clean Architecture with Riverpod state management

```
lib/
├── models/           # Freezed data classes (request/, response/)
├── viewmodels/       # StateNotifierProvider business logic (state/ for state classes)
├── views/            # UI layer (screens/, widgets/)
├── repositories/     # Data access layer with Result pattern
├── notifier/         # Riverpod notifiers (auth, network, timer, etc.)
├── router/           # GoRouter navigation
├── utils/            # Error handling, interceptors, logging
├── dio/              # HTTP client configuration
└── secure_storage/   # Token/credential storage
```

**Key architectural decisions:**
- Each ViewModel manages one data type via Riverpod's Notifier (modular, reusable across Views)
- Result<T> pattern for type-safe error handling (similar to Rust's Result)
- Command pattern for async operations with state binding
- AsyncValue pattern for loading/error/success states
- Model layer completely separated from View dependencies

## Key Dependencies

- **State**: flutter_riverpod
- **Networking**: dio + retrofit (code-generated API client)
- **Code generation**: freezed, json_serializable, build_runner
- **Routing**: go_router
- **Firebase**: firebase_messaging (push notifications), firebase_analytics
- **Error monitoring**: sentry_flutter with source maps

## Web-Specific Notes

- Uses FlutterWebFrame wrapper (475x812 mobile dimensions on web)
- Firebase local notifications disabled on web (kIsWeb check)
- Deployment: GitHub Actions → GitHub Pages (create-web-branch triggers deploy)
- Custom domain: donggurami.net (CNAME configuration)

## Testing

Tests located in `/test` directory with structure mirroring `/lib`:
- `test/viewmodels/` - ViewModel unit tests
- `test/repositories/` - Repository tests
- `test/fakes/` - Mock objects

## Code Generation

Generated files follow patterns: `*.freezed.dart`, `*.g.dart`. After modifying models or API definitions:
```bash
flutter pub run build_runner build
```

## Deployment

Web deployment triggers automatically on push to `create-web-branch`:
1. Builds Flutter web with source maps
2. Uploads source maps to Sentry
3. Deploys to GitHub Pages
