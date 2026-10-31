# Flutter Portfolio — Pan Myint Mo

Portfolio site built with Flutter Web that presents three Flutter apps from this workspace.

## Projects featured

1. **Dermaluxe** — Multi-brand clinic member app (GT base): bookings, wallet, loyalty, GraphQL + Firebase
2. **Hidayatul Quran** — Quran books reader/listener with admin CMS, Firebase + offline CDN mirror
3. **Flutter Clean Base** — Clean-architecture starter with auth, Dio, device security, maps

## Run

```sh
flutter pub get
flutter run -d chrome
```

For a release web build:

```sh
flutter build web --release
```

## Structure

- `lib/data/projects.dart` — project copy and skills
- `lib/pages/home_page.dart` — scrollable portfolio page
- `lib/widgets/` — hero, work, about, contact sections
- `lib/theme/app_theme.dart` — Fraunces + DM Sans theme
# portfolio
