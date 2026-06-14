# Space — Solar System Flutter App

A Flutter web application that showcases the solar system with planet details and interactive 3D models.

## Tech Stack

- **Framework**: Flutter (Dart)
- **Renderer**: Flutter Web (CanvasKit)
- **3D Models**: `model_viewer_plus` package (`.glb` files)
- **Splash Screen**: `flutter_native_splash`

## Project Layout

- `lib/` — Dart source code (screens, widgets, models, data)
- `assets/3d/` — 3D planet `.glb` model files
- `assets/images/` — Planet images and UI assets
- `assets/fonts/` — SpaceGrotesk font
- `web/` — Flutter web runner/index
- `build/web/` — Compiled output (served in dev, published in prod)

## Development

The app is pre-built; the workflow serves `build/web/` with Python's HTTP server on port 5000.

To rebuild after code changes:
```
flutter pub get
flutter build web --release --base-href /
```

Then restart the "Start application" workflow.

## Deployment

Configured as a **static** deployment:
- Build: `flutter build web --release --base-href /`
- Public dir: `build/web`

## User Preferences

<!-- Add user preferences here -->
