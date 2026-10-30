# ThinkTrek Solutions — Website (Flutter Web)

Company website for ThinkTrek Solutions. This package is the Flutter Web
frontend in a monorepo that also reserves space for a Java Spring Boot backend.

This is a design-system and routing foundation only. Marketing page layouts
and API integration are not implemented yet.

## Folder structure

```text
thinktrek-solutions/
├── frontend/                 # This Flutter Web app
│   ├── lib/
│   │   ├── main.dart         # Process entry
│   │   ├── app/              # Theme, router, root widget
│   │   ├── core/             # Shared constants, responsive helpers, widgets
│   │   └── features/         # Route-level pages (home, about, services, contact)
│   ├── test/
│   └── web/
├── backend/                  # Reserved for Spring Boot
└── docs/                     # Design references
```

`lib/` follows a feature-first layout. State management (BLoC) and data
layers will be added per feature when they talk to the API — not before.

## Architecture notes

- **Theme:** One light Material 3 theme. Brand colors live in `app_colors.dart`.
  Navy is structural; turquoise is interactive; green is a spare accent.
- **Routing:** `go_router` with path URLs (`/`, `/about`, `/services`, `/contact`).
- **Layout:** Breakpoints compact (< 600), medium (600–1023), expanded (>= 1024).
  Page content is capped with `AppSectionContainer` so mobile browsers do not overflow.
- **State:** Static pages are `StatelessWidget`. Use `flutter_bloc` when a screen
  is driven by API or form state. Keep HTTP clients out of widgets.
- **HTTP:** `dio` will be added when the Spring Boot API exists. `url_launcher`
  is already available for mailto/tel/external links.

## Prerequisites

- Flutter SDK matching this project (`environment.sdk` in `pubspec.yaml`, currently `^3.11.5`)
- Chrome (for local web development)

Confirm the toolchain:

```bash
flutter doctor
flutter --version
```

## Run the web app

From `frontend/`:

```bash
flutter pub get
flutter run -d chrome
```

Useful alternatives:

```bash
flutter devices
flutter run -d web-server --web-port 8080
```

Deep links such as `/about` work in `flutter run`. A production host must
serve `index.html` for unknown paths so refreshes on nested routes succeed.

## Tests

```bash
flutter test
```

```bash
flutter analyze
dart format lib test
```

## Production build

```bash
flutter build web --release
```

Output is written to `build/web/`. Deploy that directory to your static host
(or behind the Spring Boot app later). If the site is not served from the
domain root:

```bash
flutter build web --release --base-href /your-subpath/
```
