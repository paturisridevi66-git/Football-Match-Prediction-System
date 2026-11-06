# ⚽ Football Match Prediction System (`footy_predict`)

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Provider](https://img.shields.io/badge/State-Provider-2E7D32)](https://pub.dev/packages/provider)
[![HTTP](https://img.shields.io/badge/Network-HTTP%20REST-orange)](https://pub.dev/packages/http)
[![Tests](https://img.shields.io/badge/Tests-Passing-brightgreen)](test/match_card_test.dart)

A comprehensive, modular Flutter application and laboratory lab series demonstrating end-to-end mobile development concepts through a **Football Match Prediction System**.

From fundamental Dart programming and responsive layout design to advanced state management (`Provider`), form validations, physics-based animations, REST API data consumption, and automated widget testing.

---

## 📑 Table of Contents

- [Overview](#overview)
- [Experiments Showcase](#-experiments-showcase)
  - [Experiment 01: Dart Basics](#experiment-01-dart-basics)
  - [Experiment 02: Widgets &amp; Layouts](#experiment-02-widgets--layouts)
  - [Experiment 03: Responsive UI](#experiment-03-responsive-ui)
  - [Experiment 04: Navigation &amp; Named Routes](#experiment-04-navigation--named-routes)
  - [Experiment 05: State Management (Provider &amp; setState)](#experiment-05-state-management-provider--setstate)
  - [Experiment 06: Custom Widgets &amp; Themes](#experiment-06-custom-widgets--themes)
  - [Experiment 07: Form Handling &amp; Validation](#experiment-07-form-handling--validation)
  - [Experiment 08: Animations &amp; Transitions](#experiment-08-animations--transitions)
  - [Experiment 09: REST API Integration](#experiment-09-rest-api-integration)
  - [Experiment 10: Unit Testing &amp; Widget Testing](#experiment-10-unit-testing--widget-testing)
- [Project Architecture &amp; Folder Structure](#-project-architecture--folder-structure)
- [Getting Started &amp; How to Run](#-getting-started--how-to-run)
- [Tech Stack &amp; Dependencies](#-tech-stack--dependencies)

---

## 🔎 Overview

The Football Match Prediction System is structured across 10 progressive experiments. Each experiment explores a distinct Flutter/Dart architectural tier while building real-world features for tracking scores, viewing live matches, making score predictions, and managing user state.

---

## 📸 Experiments Showcase

---

### Experiment 01: Dart Basics
> **Directory**: [`Experiment-01-Dart-Basics/`](Experiment-01-Dart-Basics/main.dart)  
> **Key Concepts**: Variables, Data Types, Lists, Maps, Control Flow, Functions, and Object-Oriented Programming (OOP) in Dart.

A foundational command-line execution validating match prediction logic, calculating match winners, querying upcoming fixtures, and managing Premier League standings using Dart classes and maps.

<div align="center">
  
  <img src="screenshots/exp01_dart_basics.svg" alt="Experiment 01 - Dart Basics Terminal Output" width="800"/>
  
</div>

- **Features**:
  - Strongly typed match representations (`Match` class with `displayResult()`).
  - Score comparison logic (`getWinner()` algorithm).
  - Fixture iteration over upcoming football matches and points lookup map.

---

### Experiment 02: Widgets & Layouts
> **Directory**: [`Experiment-02-Widgets-Layouts/`](Experiment-02-Widgets-Layouts/main.dart)  
> **Key Concepts**: `Container`, `Row`, `Column`, `Stack`, `BoxDecoration`, `BoxShadow`, and `Divider`.

Builds the core visual foundation of the app: a match card with custom circular team emblems (`MU` vs `LIV`), match status indicators, score typography, and stadium venue badges.

<div align="center">
  <img src="screenshots/exp02_widgets_layouts.svg" alt="Experiment 02 - Match Card Layout" width="450"/>
</div>

- **Features**:
  - Elevated card container with rounded corners (`16px`) and subtle drop shadow.
  - Multi-axis layout alignment using `Row` with `MainAxisAlignment.spaceAround`.
  - Stacked badge overlay for venue information (`Old Trafford • 90'`).

---

### Experiment 03: Responsive UI
> **Directory**: [`Experiment-03-Responsive-UI/`](Experiment-03-Responsive-UI/main.dart)  
> **Key Concepts**: `MediaQuery`, Responsive Breakpoints, Adaptive Layouts (`ListView` vs `Row`).

Dynamically reconfigures the UI across screen dimensions: Mobile (`< 600px`), Tablet (`600px - 1000px`), and Desktop (`> 1000px`).

<div align="center">
  <img src="screenshots/exp03_responsive_ui.svg" alt="Experiment 03 - Responsive Breakpoint Engine" width="800"/>
</div>

- **Features**:
  - Automatically alternates between single-column scrollable feed and multi-column grid layout.
  - Responsive dimension constraints using `MediaQuery.of(context).size.width`.
  - Scalable match card widgets preserving aspect ratios across screen sizes.

---

### Experiment 04: Navigation & Named Routes
> **Directory**: [`Experiment-04-Navigation/`](Experiment-04-Navigation/main.dart)  
> **Key Concepts**: Named Routing (`routes` map, `initialRoute`), `Navigator.pushNamed`, and `Navigator.pop`.

Implements multi-screen transitions across three interconnected screens: Match List Home (`/`), Detailed Match Summary (`/details`), and the Prediction Selection Screen (`/predict`).

<div align="center">
  <img src="screenshots/exp04_navigation.svg" alt="Experiment 04 - Named Routes Flow" width="850"/>
</div>

- **Features**:
  - Centralized route table: `'/'`, `'/details'`, and `'/predict'`.
  - Interactive match tiles with forward chevrons and push navigation.
  - Interactive prediction selection options with stack popping (`Navigator.pop`).

---

### Experiment 05: State Management (Provider & setState)
> **Directory**: [`Experiment-05-State-Management/`](Experiment-05-State-Management/main.dart)  
> **Key Concepts**: Ephemeral State (`setState`), App-level Reactive State (`Provider`, `ChangeNotifier`), Theme Switching.

Compares local state lifecycle against centralized reactive state management. Features an interactive prediction counter and live Light/Dark mode theme toggling.

<div align="center">
  <img src="screenshots/exp05_state_management.svg" alt="Experiment 05 - State Management Provider and setState" width="850"/>
</div>

- **Features**:
  - `PredictionProvider` extending `ChangeNotifier` with `notifyListeners()`.
  - Dynamic `Scaffold` background switching between Light (`Colors.grey[100]`) and Dark (`Colors.grey[900]`).
  - Isolated `CounterButton` demonstrating localized widget re-renders via `setState`.

---

### Experiment 06: Custom Widgets & Themes
> **Directory**: [`Experiment-06-Custom-Widgets-Themes/`](Experiment-06-Custom-Widgets-Themes/main.dart)  
> **Key Concepts**: Custom Reusable Widgets (`CustomMatchCard`), Global `ThemeData`, `CircleAvatar`, Design System.

Introduces a centralized design language and reusable component architecture. Generates uniform match cards supporting multiple leagues (Premier League, La Liga) with customized color-coded team initials.

<div align="center">
  <img src="screenshots/exp06_custom_widgets_themes.svg" alt="Experiment 06 - Custom Widgets and Global Themes" width="450"/>
</div>

- **Features**:
  - Centralized `ThemeData` configuring primary swatch, AppBar elevation, and button themes.
  - Modular `CustomMatchCard` accepting parameterized team initials, scores, and league banners.
  - Consistent box shadows and typography hierarchies.

---

### Experiment 07: Form Handling & Validation
> **Directory**: [`Experiment-07-Form-Validation/`](Experiment-07-Form-Validation/main.dart)  
> **Key Concepts**: `Form`, `GlobalKey<FormState>`, `TextFormField`, Input Controllers, Real-time Validation.

An interactive prediction submission form with input validation checking for non-empty names, minimum character lengths, and numerical score limits (0–20).

<div align="center">
  <img src="screenshots/exp07_form_validation.svg" alt="Experiment 07 - Form Handling and Validation" width="450"/>
</div>

- **Features**:
  - Form validation with `_formKey.currentState!.validate()`.
  - `TextEditingController` lifecycle management with clean disposal.
  - Styled validation error states and dynamic success confirmation banner.

---

### Experiment 08: Animations & Transitions
> **Directory**: [`Experiment-08-Animations/`](Experiment-08-Animations/main.dart)  
> **Key Concepts**: `AnimationController`, `CurvedAnimation`, `FadeTransition`, `SlideTransition`, `ScaleTransition`.

Creates an animated reveal effect combining opacity fade, vertical translation, and elastic spring physics into a synchronized 800ms timeline.

<div align="center">
  <img src="screenshots/exp08_animations.svg" alt="Experiment 08 - Flutter Physics Animations" width="480"/>
</div>

- **Features**:
  - `SingleTickerProviderStateMixin` managing VSYNC frame rendering.
  - Combined `FadeTransition` + `SlideTransition` + `ScaleTransition` (`Curves.elasticOut`).
  - Interactive animation trigger with replay functionality.

---

### Experiment 09: REST API Integration
> **Directory**: [`Experiment-09-REST-API/`](Experiment-09-REST-API/main.dart)  
> **Key Concepts**: Asynchronous Programming (`async`/`await`), `http` package, `json.decode`, Error Handling, `ListView.builder`.

Connects the Flutter client to a remote REST API to fetch live match payloads asynchronously, displaying a loading spinner during network transit and rendering results dynamically.

<div align="center">
  <img src="screenshots/exp09_rest_api.svg" alt="Experiment 09 - REST API Network Integration" width="450"/>
</div>

- **Features**:
  - Asynchronous HTTP GET requests with status code validation (`200 OK`).
  - Network state handling: Loading spinner (`CircularProgressIndicator`), error states, and loaded list.
  - Pull-to-refresh / AppBar reload action button.

---

### Experiment 10: Unit Testing & Widget Testing
> **Directory**: [`Experiment-10-Testing-Debugging/`](Experiment-10-Testing-Debugging/main.dart) & [`test/`](test/match_card_test.dart)  
> **Key Concepts**: `flutter_test`, `testWidgets`, `WidgetTester`, `pumpWidget`, `find.text`, Assertions.

Automated quality assurance suite verifying widget rendering, team name displays, and score calculations under simulated widget tree conditions.

<div align="center">
  <img src="screenshots/exp10_testing_debugging.svg" alt="Experiment 10 - Automated Unit and Widget Testing" width="850"/>
</div>

- **Features**:
  - Automated widget pumping (`tester.pumpWidget`) in a headless test harness.
  - Exact text match assertions using `find.text()` and `findsOneWidget`.
  - 100% test pass rate for core match presentation components.

---

## 📂 Project Architecture & Folder Structure

```text
footy_predict/
├── Experiment-01-Dart-Basics/
│   └── main.dart                     # Pure Dart console execution & OOP logic
├── Experiment-02-Widgets-Layouts/
│   └── main.dart                     # Core match card container & layout
├── Experiment-03-Responsive-UI/
│   └── main.dart                     # MediaQuery breakpoints for Mobile/Tablet/Desktop
├── Experiment-04-Navigation/
│   └── main.dart                     # Named routes ('/', '/details', '/predict')
├── Experiment-05-State-Management/
│   └── main.dart                     # Provider reactive state & setState demo
├── Experiment-06-Custom-Widgets-Themes/
│   └── main.dart                     # Modular CustomMatchCard & global ThemeData
├── Experiment-07-Form-Validation/
│   └── main.dart                     # Prediction form with validator rules
├── Experiment-08-Animations/
│   └── main.dart                     # Physics-based composite transitions (800ms)
├── Experiment-09-REST-API/
│   └── main.dart                     # HTTP client fetching and parsing REST data
├── Experiment-10-Testing-Debugging/
│   └── main.dart                     # Isolated MatchCard target widget for test runner
├── lib/
│   └── main.dart                     # Main application entrypoint
├── screenshots/
│   ├── exp01_dart_basics.svg         # Experiment 01 screenshot mockup
│   ├── exp02_widgets_layouts.svg     # Experiment 02 screenshot mockup
│   ├── exp03_responsive_ui.svg       # Experiment 03 screenshot mockup
│   ├── exp04_navigation.svg          # Experiment 04 screenshot mockup
│   ├── exp05_state_management.svg    # Experiment 05 screenshot mockup
│   ├── exp06_custom_widgets_themes.svg # Experiment 06 screenshot mockup
│   ├── exp07_form_validation.svg     # Experiment 07 screenshot mockup
│   ├── exp08_animations.svg          # Experiment 08 screenshot mockup
│   ├── exp09_rest_api.svg            # Experiment 09 screenshot mockup
│   └── exp10_testing_debugging.svg   # Experiment 10 screenshot mockup
├── test/
│   ├── match_card_test.dart          # Widget tests for MatchCard
│   └── widget_test.dart              # Default widget testing harness
├── pubspec.yaml                      # Project dependencies & assets configuration
└── README.md                         # Complete project documentation
```

---

## 🚀 Getting Started & How to Run

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart)
- An Android Emulator, iOS Simulator, or Chrome browser

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/paturisridevi66-git/Football-Match-Prediction-System.git
   cd Football-Match-Prediction-System
   ```

2. **Install Flutter packages**:
   ```bash
   flutter pub get
   ```

### Running Individual Experiments

- **Run Experiment 01 (Dart Console)**:
  ```bash
  dart run Experiment-01-Dart-Basics/main.dart
  ```

- **Run any Flutter Experiment (e.g., Exp 02, Exp 05, Exp 07)**:
  ```bash
  flutter run -t Experiment-02-Widgets-Layouts/main.dart
  flutter run -t Experiment-05-State-Management/main.dart
  flutter run -t Experiment-07-Form-Validation/main.dart
  ```

- **Run the Main Application**:
  ```bash
  flutter run
  ```

- **Execute Automated Tests**:
  ```bash
  flutter test
  ```

---

## 🛠 Tech Stack & Dependencies

| Category | Technology | Purpose |
|:---|:---|:---|
| **Framework** | [Flutter](https://flutter.dev) | Multi-platform UI toolkit |
| **Language** | [Dart](https://dart.dev) | Object-oriented client-optimized language |
| **State Management** | [`provider: ^6.1.2`](https://pub.dev/packages/provider) | Dependency injection & reactive state |
| **Networking** | [`http: ^1.2.1`](https://pub.dev/packages/http) | Composable HTTP requests for REST APIs |
| **Testing** | [`flutter_test`](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) | Automated unit and widget verification |
