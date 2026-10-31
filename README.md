# Flutter Portfolio — Pan Myint Mo

Live site: **https://panmyintmo.github.io/portfolio/**

## Why the old live page looked wrong

GitHub Pages was serving the **source repo README** (Jekyll), not a Flutter web build.
Flutter web must be built with:

```sh
flutter build web --release --base-href /portfolio/
```

Then the `build/web` (or `docs/`) output is what Pages should publish.

## Run locally

```sh
flutter pub get
flutter run -d chrome
```

## Deploy to GitHub Pages

### Option A — `docs/` folder (quick)

1. Build:

```sh
flutter build web --release --base-href /portfolio/
rm -rf docs && cp -R build/web docs && touch docs/.nojekyll
```

2. Commit and push `docs/` to `main` / `master`.
3. Repo **Settings → Pages**:
   - Source: **Deploy from a branch**
   - Branch: `main` (or `master`)
   - Folder: **/docs**

### Option B — GitHub Actions

Workflow: `.github/workflows/deploy-pages.yml`

1. Settings → Pages → Source: **GitHub Actions**
2. Push to `main` / `master` (or run the workflow manually)

## Structure

- `lib/data/projects.dart` — project copy and skills
- `lib/pages/home_page.dart` — scrollable portfolio page
- `lib/widgets/` — hero, work, about, contact sections
- `docs/` — built web assets for GitHub Pages
