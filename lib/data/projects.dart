enum ProjectStack { flutter, reactNative, fullstack }

extension ProjectStackX on ProjectStack {
  String get label => switch (this) {
        ProjectStack.flutter => 'Flutter',
        ProjectStack.reactNative => 'React Native',
        ProjectStack.fullstack => 'Full-stack',
      };
}

class SocialLink {
  const SocialLink({
    required this.label,
    required this.url,
    required this.iconKey,
  });

  final String label;
  final String url;
  final String iconKey;
}

class AppProject {
  const AppProject({
    required this.name,
    required this.role,
    required this.tagline,
    required this.overview,
    required this.features,
    required this.tech,
    required this.highlights,
    required this.accent,
    required this.platforms,
    required this.stack,
    this.githubUrl,
    this.status = 'Shipped',
    this.year = '2025–2026',
  });

  final String name;
  final String role;
  final String tagline;
  final String overview;
  final List<String> features;
  final List<String> tech;
  final List<String> highlights;
  final int accent;
  final List<String> platforms;
  final ProjectStack stack;
  final String? githubUrl;
  final String status;
  final String year;
}

const developerName = 'Pan Myint Mo';
const developerTitle = 'Mobile Engineer · Flutter & React Native';
const developerLocation = 'Myanmar';
const developerEmail = 'panmyintmo9@gmail.com';
const githubProfileUrl = 'https://github.com/PanMyintMo';
const linkedinProfileUrl =
    'https://www.linkedin.com/in/pan-myint-mo-872095256/';
const profilePhotoAsset = 'images/profile.jpg';

const developerBio =
    'I ship production mobile products across Flutter and React Native—'
    'white-label clinic wallets, fitness member apps, staff POS/workflow tools, '
    'and offline-first content platforms. I own architecture, GraphQL clients, '
    'Firebase, multi-brand builds, localization, and store-ready releases.';

const developerSkills = <String>[
  'Flutter & Dart',
  'React Native & Expo',
  'TypeScript',
  'Riverpod / Redux',
  'TanStack Query',
  'Clean Architecture',
  'GraphQL & Apollo',
  'Firebase',
  'Expo Router / go_router',
  'White-label / multi-brand',
  'Secure storage & pinning',
  'i18n (EN / Myanmar / Arabic / CN)',
  'App Store & Play Store',
  'EAS / CI pipelines',
];

const socialLinks = <SocialLink>[
  SocialLink(label: 'GitHub', url: githubProfileUrl, iconKey: 'github'),
  SocialLink(label: 'Email', url: 'mailto:$developerEmail', iconKey: 'email'),
  SocialLink(label: 'LinkedIn', url: linkedinProfileUrl, iconKey: 'linkedin'),
];

const careerStats = <({String value, String label})>[
  (value: '10+', label: 'Shipped apps'),
  (value: '2', label: 'Mobile stacks'),
  (value: '25+', label: 'White-label brands'),
  (value: '4', label: 'App locales'),
];

/// Shared feature set from pass.wallet (Piti Pass / GT white-label member app).
const _pitiPassFeatures = <String>[
  'Bottom tabs: Home, Royalty, Book, Point Wallet, Messages, Me',
  'Home offer categories and offer detail',
  'Book public services, create/edit appointments, booking success & member agenda',
  'Point wallet: transfer, history, Quick Pay QR, top-up (MMQR / A+)',
  'In-app shopping for services & packages with passcode checkout',
  'Royalty: points, rewards redeem, member benefits, reward history, PDF benefits viewer',
  'Messages / push notifications with brand Firebase topics',
  'Me: edit/delete member, orders & purchased services, language, change/forgot passcode (OTP)',
  'Firebase auth + passcode gate before wallet and purchase flows',
  'Locales: Myanmar, Zawgyi, English, Chinese',
];

const _pitiPassTech = <String>[
  'React Native 0.77',
  'TypeScript',
  'Redux + redux-observable',
  'Apollo Client / GraphQL',
  'React Navigation 7',
  'Firebase Auth / Messaging / Firestore / Crashlytics',
  'Reanimated',
  'Vision Camera',
];

const projects = <AppProject>[
  // ——— React Native · Piti Pass white-label brands ———
  AppProject(
    name: 'DSC',
    role: 'React Native · Piti Pass white-label',
    tagline:
        'Clinic member wallet for DSC—booking, point wallet, royalty rewards, and QR pay.',
    overview:
        'Live Great Time / Piti Pass member app for DSC (com.greatetime.dsc), built on the '
        'shared React Native white-label codebase. Members use Firebase auth and a passcode '
        'gate, then book services, shop packages, manage a point wallet (transfer, top-up, '
        'MMQR, Quick Pay QR), and redeem royalty rewards against Piti Pass + encrypted GT+ GraphQL.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      'Production brand: DSC · com.greatetime.dsc',
      'Firebase push topics: noti_dsc / dsc_customer_*',
      'Dual GraphQL: Piti Pass + GT+ encrypted apicore',
      'Active pass.wallet branch: dsc',
    ],
    accent: 0xFFB45309,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),
  AppProject(
    name: 'LV Aesthetic',
    role: 'React Native · Piti Pass white-label',
    tagline:
        'LV Aesthetic clinic member app—appointments, wallet, loyalty, and passcode checkout.',
    overview:
        'White-label Piti Pass member app for LV Aesthetic (com.greattime.lvbeauty), shipped '
        'from the pass.wallet lvclinic branch. Same production wallet stack as other Great Time '
        'clinic brands: booking, point wallet, royalty redeem, shopping, and Firebase messaging.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      'Store brand: LV Aesthetic · com.greattime.lvbeauty',
      'pass.wallet branch: lvclinic',
      'Shared Piti Pass + GT+ GraphQL member platform',
      'iOS/Android store builds from white-label base',
    ],
    accent: 0xFF9A3412,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),
  AppProject(
    name: 'Skin & Bling',
    role: 'React Native · Piti Pass white-label',
    tagline:
        'Skin & Bling member app—book care, manage points, redeem rewards, and pay by QR.',
    overview:
        'Clinic member app for Skin & Bling (com.greattime.skbling) on the Piti Pass React Native '
        'white-label platform. Members book services, use point wallet top-up/transfer/Quick Pay, '
        'and redeem royalty benefits with the same passcode-secured checkout flow.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      'Store brand: Skin & Bling · com.greattime.skbling',
      'pass.wallet branch: skbling',
      'Firebase Auth, Messaging, Crashlytics',
      'mm / zg / en / cn localization',
    ],
    accent: 0xFFBE185D,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),
  AppProject(
    name: 'De Novo',
    role: 'React Native · Piti Pass white-label',
    tagline:
        'De Novo clinic wallet—service booking, packages, loyalty points, and MMQR top-up.',
    overview:
        'Production member app for De Novo (com.greatetime.thedenovo) built from pass.wallet. '
        'Covers the full Piti Pass member journey: offers, appointments, shopping with passcode '
        'checkout, point wallet, royalty rewards, orders, and profile/passcode management.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      'Store brand: De Novo · com.greatetime.thedenovo',
      'pass.wallet branch: denovo',
      'Apollo GraphQL + Redux / redux-observable',
      'Vision Camera for QR pay flows',
    ],
    accent: 0xFF0F766E,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),
  AppProject(
    name: 'DR PENTRA',
    role: 'React Native · Piti Pass white-label',
    tagline:
        'DR PENTRA member app—book treatments, shop packages, wallet pay, and redeem rewards.',
    overview:
        'White-label clinic app for DR PENTRA (com.greattime.drpentra). Members authenticate '
        'with Firebase, unlock passcode-gated purchases, book and manage appointments, hold a '
        'point wallet with QR Quick Pay / MMQR top-up, and track royalty rewards and orders.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      'Store brand: DR PENTRA · com.greattime.drpentra',
      'pass.wallet branch: drpentra',
      'Shared GT clinic merchant wallet platform',
      'React Navigation 7 tab + stack flows',
    ],
    accent: 0xFF7C2D12,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),
  AppProject(
    name: "D' LUX",
    role: 'React Native · Piti Pass white-label',
    tagline:
        "D' LUX clinic member app—appointments, point wallet, royalty, and passcode checkout.",
    overview:
        "Member app for D' LUX (com.greattime.dlux) on the Piti Pass / Great Time React Native "
        'white-label stack. Delivers booking, shopping, wallet transfer/top-up/QR pay, royalty '
        'redeem, messages, and multi-language profile settings for clinic members.',
    features: _pitiPassFeatures,
    tech: _pitiPassTech,
    highlights: [
      "Store brand: D' LUX · com.greattime.dlux",
      'pass.wallet branch: dlux',
      'Piti Pass GraphQL + GT+ encrypted API',
      'Part of 25+ brand white-label fleet',
    ],
    accent: 0xFF6D28D9,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Live',
    year: '2023–2026',
  ),

  // ——— React Native · GT Movement ———
  AppProject(
    name: 'Powerhouse',
    role: 'React Native · Expo · GT Movement',
    tagline:
        'Fitness member app—classes, challenges, memberships, PT stamp card, and QR check-in.',
    overview:
        'Powerhouse (Power house) is a native Expo / React Native member client for the GT '
        'Movement GraphQL API—not a marketplace or WebView. Production pins tenant POWERHOUSE '
        '(com.greattime.powerhouse). Members sign in with SMS OTP, book classes, track PT, '
        'shop plans, join challenges, check in with QR, and switch System / Light / Dark themes.',
    features: [
      'Tabs: Home, Classes, Challenges, Shop, Profile (Messages route hidden from tab bar)',
      'SMS OTP login/registration; secure session; photo onboarding',
      'Home: membership pass, booked-class calendar, PT stamp card, flash sales, posts, branch picker',
      'Classes browse/book; class detail; QR check-in',
      'PT check-in and trainer slot request flows',
      'Challenges list + challenge classes',
      'Shop: memberships, class passes, PT sessions, checkout, purchase details',
      'Reward Connect entry (pilot-gated) + wallet screen',
      'Profile: edit profile, invoices, membership leave, theme System/Light/Dark',
      'Push notifications; EAS staging & production channels',
    ],
    tech: [
      'Expo 57',
      'React Native 0.86',
      'TypeScript',
      'expo-router',
      'TanStack Query (+ persist)',
      'react-hook-form + zod',
      'Firebase Messaging',
      'GT Movement GraphQL',
    ],
    highlights: [
      'Production IDs: com.greattime.powerhouse',
      'Staging: com.greattime.powerhouse.staging · tenant GT-MOVEMENT-DEMO',
      'Build-time white-label config; smoke:production checks',
      'Version 1.0.5 · Urbanist dark-first UI',
    ],
    accent: 0xFF1D4ED8,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.reactNative,
    status: 'Shipping',
    year: '2026',
  ),

  // ——— Flutter member / consumer ———
  AppProject(
    name: 'Dermaluxe',
    role: 'Lead Flutter · GT multi-brand base',
    tagline:
        'Clinic member wallet for bookings, packages, rewards, and payments.',
    overview:
        'Dermaluxe (DERMALUXE) is the Flutter member app for Great Time clinics '
        '(com.greatetime.dermaluxe), ported from the React Native white-label line into a '
        'reusable multi-brand GT codebase (BRAND=dermalux). Guests browse treatments, prices, '
        'clinic info, posts, and flash sales; members unlock booking, wallet, loyalty, and account '
        'tools. The same base also configures Piti Pass (BrandId.piticafe).',
    features: [
      'Tabs: Home, Explore, Treatments, Wallet, You',
      'Guest browse treatments/prices, clinic info, posts, announcements, flash sales',
      'Sign-in gated booking, purchasing, notifications, and account data',
      'Home package carousel → booking (practitioner → date → time)',
      'Treatments: open booking or package usage history',
      'Wallet: top-up, transfer, Quick Pay / QR scan, gifts/redeem, invoices, bank accounts, shopping',
      'Explore ≈ loyalty/royalty: points and rewards redeem',
      'You: passcode, language (EN / Myanmar Unicode / Zawgyi), edit/delete member, messages',
      'Launch video with Reduce Motion fallback; force-update via Firestore version meta',
    ],
    tech: [
      'Flutter',
      'Riverpod',
      'go_router',
      'GraphQL (Piti Pass + GT + GT+ encrypted)',
      'Firebase',
      'Hive',
      'Dio',
      'Certificate pinning',
    ],
    highlights: [
      'Migrated from React Native GT → Flutter clean architecture',
      'Compile-time brands via --dart-define=BRAND / ENV',
      'TestFlight 9.2.2 · App Store Connect uploads',
      '~480 Dart files · sage & cream Dermaluxe UI',
    ],
    accent: 0xFF5F7A63,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.flutter,
    status: 'TestFlight / live',
    year: '2026',
  ),
  AppProject(
    name: 'Hidayatul Quran',
    role: 'Flutter · Full-stack Firebase',
    tagline:
        'Read and listen to curated Quran books—offline-friendly with a built-in admin CMS.',
    overview:
        'Hidayatul Quran (com.hidayatul.quran_book) lets users browse categorized Islamic/Quran '
        'books with PDF reading, audio listening, bookmarks, search, donations, and profile '
        'settings. An admin dashboard manages books, categories, banners, users, donations, and '
        'readings. Firebase is the source of truth, with a GitHub + jsDelivr public_data mirror '
        'for regions where Firebase is hard to reach.',
    features: [
      'Bottom tabs: Home, Bookmark, Setting, Profile',
      'Home: banners, book types, new/popular books, categories, search',
      'PDF reader (Syncfusion SfPdfViewer) with zoom and paging',
      'Audio listen via just_audio / audio_service',
      'Bookmarks; donate page; edit profile; intro/onboarding',
      'Auth: email/password + phone (Firebase Auth); logout / delete account',
      'Theme light / dark / system; locales English, Myanmar, Arabic',
      'Drawer: language, settings, theme, contact, help, about, share, store review',
      'Admin CMS: Categories, Posts (books), Readings, Users, Banners, Donations',
      'Offline cache + jsDelivr CDN mirror; GitHub Actions sync from Firebase every 6h',
    ],
    tech: [
      'Flutter',
      'Provider',
      'Firebase Auth / Realtime Database / Storage',
      'Hive',
      'Syncfusion PDF',
      'just_audio',
      'easy_localization',
      'GitHub Actions',
    ],
    highlights: [
      'Firebase → local cache → CDN mirror resilience',
      'Admin and reader experiences in one app',
      'public_data mirror: github.com/PanMyintMo/quran_book',
      'Version 1.0.0+10',
    ],
    accent: 0xFF1B6B4A,
    platforms: ['iOS', 'Android', 'Web'],
    stack: ProjectStack.fullstack,
    githubUrl: 'https://github.com/PanMyintMo/quran_book',
    status: 'Live product',
    year: '2025–2026',
  ),

  // ——— Flutter staff / ops ———
  AppProject(
    name: 'GT Business',
    role: 'Flutter · Partner / POS',
    tagline:
        'Clinic staff app—calendar bookings, check-in, POS sales, clients, and inventory.',
    overview:
        'GT Business (greattime_partner / com.greattime.greattime_partner) is the partner-facing '
        'Flutter app used inside Great Time clinics. Staff manage a Syncfusion appointment '
        'calendar, run check-in and new sales (POS), track clients and inventory, and open '
        'clinic management tools from the More menu—backed by GraphQL and Firebase.',
    features: [
      'Bottom tabs: Home (calendar), Appointment list, New Sale, Sales, Clients, More',
      'Syncfusion appointment calendar with multi-service booking',
      'Home FABs: refresh, check-in, new appointment, top-up, new sale',
      'Direct check-in and POS new-sale / sale history flows',
      'Client CRM: wallet/credit, service bag, reminders, birthday & inactivity signals',
      'More → Clinic: Products, Services, Packages, Practitioners, Top-ups',
      'More → Management: Leave, Seller, Report',
      'More → Settings: theme, translate, supported APIs, logout',
      'Inventory: products, brands, stock; clinic form',
      'Firebase messaging / storage; Hive local cache; localization',
    ],
    tech: [
      'Flutter',
      'Provider',
      'GraphQL',
      'Hive',
      'Syncfusion Calendar',
      'Firebase Messaging / Storage',
      'l10n',
    ],
    highlights: [
      'Package greattime_partner · IDs com.greattime.greattime_partner',
      'Long-running production partner app (700+ commits)',
      'Staff-side companion to member wallet apps',
    ],
    accent: 0xFF0F766E,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.flutter,
    status: 'Live product',
    year: '2024–2026',
  ),
  AppProject(
    name: 'GT Taskflow',
    role: 'Flutter · Clinical workflow',
    tagline:
        'Practitioner kanban board—services, check-in/out, medical records, and signatures.',
    overview:
        'GT Taskflow (gt_taskflow / com.greattime.gtTaskflow) helps clinic practitioners run '
        'the day on a drag-and-drop workflow board. Staff add/edit services, select practitioner '
        'and room, check members in/out, capture signatures, manage procedures and agreements, '
        'and keep member medical context—localized in English, Myanmar, and Thai.',
    features: [
      'Kanban board home with drag/drop across workflow lists',
      'Date + practitioner/room filters and search',
      'Appointment detail tabs: Overview, Services, Medical',
      'Add/edit services; practitioner, room, and helper selection',
      'Check-in / check-out, checkout list, signature pad, comments, activity log',
      'Procedures create/edit (manual or from appointment)',
      'Agreement forms (signed); allergy types CRUD; service record forms',
      'Document upload/view (PDF)',
      'Member detail: personal, service forms, documents, procedures, allergies, agreements, history',
      'Taskflow dashboard + settings + members; locales EN / Myanmar / Thai',
    ],
    tech: [
      'Flutter',
      'hooks_riverpod',
      'GraphQL',
      'Firebase Firestore / Storage',
      'flutter_boardview',
      'Syncfusion signature',
      'table_calendar',
      'Hive',
    ],
    highlights: [
      'Healthcare staff UX on production GT APIs',
      'IDs: com.greattime.gtTaskflow / gt_taskflow',
      'Structured core / gql / models / ui architecture',
    ],
    accent: 0xFF7C3AED,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.flutter,
    status: 'Live product',
    year: '2025–2026',
  ),
  AppProject(
    name: 'Flutter Clean Base',
    role: 'Architecture starter',
    tagline:
        'Reusable clean-architecture Flutter base with auth, networking, and device security.',
    overview:
        'Layered Flutter starter used as a foundation for production clients. Demo flows cover '
        'login/register against DummyJSON, user CRUD, and a profile map with geolocation. The '
        'core ships Dio interceptors, secure storage, encryption, certificate pinning, '
        'root/jailbreak checks, env flavors, RBAC stubs, and Hive caching with Riverpod DI.',
    features: [
      'Auth screen with Login / Register tabs (DummyJSON login; register stubbed)',
      'User list plus create/edit user screens',
      'Profile screen with Google Maps + Geolocator current location',
      'Session access / RBAC stubs and admin CRUD patterns',
      'Post feature layer (remote + Hive local) as architecture sample',
      'Startup safe_device root/jailbreak gate (skipped on simulator/debug)',
      'Dio stack with cache, token, retry interceptors and certificate pinning',
      'flutter_secure_storage + encrypt; Hive cache; env-based API hosts',
      'Shared UI kit: buttons, text fields, skeletons, dialogs',
    ],
    tech: [
      'Flutter',
      'Riverpod',
      'Dio',
      'Secure storage',
      'safe_device',
      'Google Maps',
      'Hive',
    ],
    highlights: [
      'Clean Architecture: features with data / domain / presentation',
      'Core layers for network, security, session, RBAC, analytics',
      'Injector wraps ProviderScope for DI',
      'github.com/PanMyintMo/base_code_flutter',
    ],
    accent: 0xFF2F5D8C,
    platforms: ['iOS', 'Android'],
    stack: ProjectStack.flutter,
    githubUrl: 'https://github.com/PanMyintMo/base_code_flutter',
    status: 'Architecture base',
    year: '2025',
  ),
];
