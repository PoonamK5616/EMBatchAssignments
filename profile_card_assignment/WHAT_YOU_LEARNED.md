# Flutter Lab Assignment & Technical Learning Report

**Student Name:** Ashutosh Rai (3rd Year Computer Engineering)  
**Student Email:** `2024.pashutosh@isu.ac.in`  
**Location / Campus:** Navi Mumbai, India  
**Mentorship & Guidance:** Special thanks to Poonam Ma'am  
**Project:** Flutter Profile Card Screen (Light Blue Theme)  
**Widgets Covered:** `Column`, `Row`, `Container`, `CircleAvatar`, `Text`, `Icon`  
**Rubric Coverage:**  
- **Report & Screenshots (2 Marks)**
- **What You Learned (2 Marks — 2+ Pages Comprehensive Reflection)**

---

## 1. Project Objective & Architecture

As a 3rd-year computer engineering student specializing in cross-platform mobile application development, the objective of this assignment is to design, implement, and document a production-ready Profile Card screen in Flutter. 

Instead of relying on heavy third-party UI libraries, the entire card is engineered from scratch using Flutter's core primitives: **`Column`**, **`Row`**, **`Container`**, **`CircleAvatar`**, **`Text`**, and **`Icon`**, unified under a clean **Light Blue & Light Theme** design system (`AppColors`).

---

## 2. Work Steps & Step-by-Step Implementation (Report & Screenshots — 2 Marks)

### Step 1: Project Initialization & Dependency Setup
- Created clean workspace via `flutter create --org com.assignment profile_card_assignment`.
- Configured `pubspec.yaml` with Material 3 styling and validated environment on Dart 3.12.2 / Flutter 3.44.4.

> **[📸 Screenshot Step 1 Placeholder: Terminal initialization & Flutter Environment]**

### Step 2: Custom Light Blue Theme Engine (`lib/theme/app_colors.dart`)
- Engineered a centralized color scheme featuring Sky Blue 600 (`#0284C7`), Sky Blue 400 (`#38BDF8`), Soft Sky Tint (`#E0F2FE`), Pure White (`#FFFFFF`), and Deep Slate (`#0F172A`).
- Formulated linear gradients for the top decorative banner and smooth background canvas.

> **[📸 Screenshot Step 2 Placeholder: `app_colors.dart` in VS Code / IDE]**

### Step 3: Screen Building with Core Widgets (`lib/screens/profile_screen.dart`)
- Structured the root layout using `Column` and `SingleChildScrollView` for scroll safety.
- Hand-crafted the outer card container with curved corners (`BorderRadius.circular(28)`), soft sky border (`#BAE6FD`), and ambient drop shadows.
- Positioned the overlapping avatar with glowing gradient ring via `Stack` and `Positioned(bottom: -45)`.
- Added dynamic skill chips, statistics rows, and side-by-side action buttons (`Follow` and `Message`).

> **[📸 Screenshot Step 3 Placeholder: `profile_screen.dart` widget tree in IDE]**

### Step 4: Running on Device & Hot Reload Verification
- Ran `flutter run` in terminal to launch the application.
- Verified rapid UI iteration and instant updates using Hot Reload (`r`).

> **[📸 Screenshot Step 4 Placeholder: Terminal `flutter run` execution]**

### Step 5: Interactive State & SnackBar Confirmation
- Verified real-time state mutation: tapping the **Follow** button increments the follower count (1240 → 1241), switches button styling to Emerald Green, and displays a floating Material `SnackBar`.

> **[📸 Screenshot Step 5 Placeholder: Active App UI with Followed state & SnackBar]**

---

## 3. What I Learned (What You Learned — 2 Marks / Multi-Page Reflection)

### 3.1 The Flutter Layout Paradigm: *"Constraints Go Down, Sizes Go Up, Parent Sets Position"*
The most critical engineering concept I understood during this assignment is Flutter's one-pass layout rendering algorithm:
1. **Constraints Go Down:** The parent passes `BoxConstraints` (min/max width, min/max height) down to each child.
2. **Sizes Go Up:** The child determines its own dimensions within those boundaries and passes its concrete `Size` back up to the parent.
3. **Parent Sets Position:** The parent assigns the child's `Offset` (x, y coordinates) on the rendering canvas.

Before this assignment, I often struggled with `Container` width/height being ignored. I now understand that if a parent imposes tight constraints, child sizing will be overridden. Using `constraints: const BoxConstraints(maxWidth: 420)` allowed the profile card to stay compact and aesthetically centered across both small phone viewports and large desktop screens.

---

### 3.2 Deep Breakdown of Required Widgets

#### 1. `Column` (Vertical Multi-Child Alignment)
- Used as the primary structural backbone of the profile card.
- Organizes the top banner, profile header, user designation, bio box, skill tags, statistics, and action buttons.
- Configured with `mainAxisSize: MainAxisSize.min` so that the card hugs its contents tightly without unbounded vertical stretching.

#### 2. `Row` (Horizontal Multi-Child Alignment)
- Positions the **Verified Badge** next to the user's name with `MainAxisAlignment.center`.
- Uses `MainAxisAlignment.spaceEvenly` across the **Statistics Section** to distribute Projects, Followers, and Rating columns with clean vertical dividers.
- Arranges the **Follow** and **Message** action buttons side-by-side using `Expanded` flex ratios (`flex: 3` and `flex: 2`).

#### 3. `Container` (The Box Model, Borders, Shadows & Gradients)
- Combines sizing, padding, margin, borders, and painting via `BoxDecoration`.
- Outer card uses `BorderRadius.circular(28)`, a 1.5px soft sky border (`#BAE6FD`), and a 24px ambient shadow (`#0284C7` with 12% alpha).
- Header banner utilizes a `LinearGradient` blending Sky Blue 400 (`#38BDF8`) into Sky Blue 600 (`#0284C7`).

#### 4. `CircleAvatar` (Circular Imagery & Glowing Ring)
- Encapsulates the user's profile avatar (`radius: 42` and `radius: 39`).
- Nested inside a circular gradient container to create an outer glowing ring effect.
- Houses high-contrast fallback iconography (`Icons.person_rounded`).

#### 5. `Text` (Typography Hierarchy)
- **Name:** 24px, `FontWeight.bold`, Deep Slate 900 (`#0F172A`) for strong focal presence.
- **Designation:** 14.5px, `FontWeight.w600`, Sky Blue 600 (`#0284C7`) with `letterSpacing: 0.2`.
- **Bio Description:** 13.5px, Slate 600 (`#475569`) with line-height multiplier (`height: 1.45`).
- **Metrics & Numbers:** 18px bold typography for immediate data readability.

#### 6. `Icon` (Semantic Visual Communication)
- Uses Material symbols for immediate visual clarity: `Icons.verified_rounded`, `Icons.location_on_rounded`, `Icons.flutter_dash_rounded`, `Icons.email_outlined`, `Icons.phone_outlined`, and `Icons.person_add_alt_1_rounded`.

---

### 3.3 Ephemeral State Management with `StatefulWidget`
- Managed local UI state using `StatefulWidget` and `setState()`.
- Tapping **Follow** flips `_isFollowing` and increments `_followersCount`. Calling `setState()` marks the `State` dirty and schedules an efficient sub-tree rebuild without re-rendering the entire app.

---

### 3.4 Modern Dart 3.12 / Flutter 3.44 Syntax Updates
- **Refactoring `.withOpacity()` to `.withValues(alpha: ...)`:** In Flutter 3.44+, `withOpacity()` is deprecated to prevent precision degradation in color math. Upgraded all color alpha calls to `withValues(alpha: ...)`, achieving **0 analyzer warnings**.
- **Material 3 Integration:** Set `useMaterial3: true` in `main.dart` with custom `ColorScheme.light` for modern elevation and surface styling.

---

## 4. Problems Faced & How I Solved Them (Engineering Debugging Log)

### ❌ Problem 1: Horizontal `RenderFlex` Overflow by 133 Pixels
- **Symptom:** Yellow and black diagonal warning stripes appeared during testing when placing text inside `Row`.
- **Root Cause:** A `Row` has unbounded horizontal width. Long child text naturally expanded past the screen edge.
- **Solution:** Wrapped the text and action buttons in `Expanded` widgets and applied `TextOverflow.ellipsis`.

### ❌ Problem 2: Avatar Overlap Clipping Over Top Banner
- **Symptom:** In standard `Column` layout, the avatar appeared either entirely inside or entirely below the banner.
- **Root Cause:** Standard container bounds clip child widgets by default.
- **Solution:** Implemented a `Stack` within the banner container with `clipBehavior: Clip.none` and `Positioned(bottom: -45)`, allowing the avatar to float seamlessly between sections.

### ❌ Problem 3: Light Theme Color Contrast Compliance
- **Symptom:** Early light blue designs had low text contrast on light backgrounds.
- **Solution:** Calibrated the palette against WCAG AA standards using Deep Slate (`#0F172A`) for headlines and Sky Blue (`#0284C7`) for accents against pure white surfaces (`#FFFFFF`).

---

## 5. Conclusion & Acknowledgements

Through this assignment, I deepened my understanding of Flutter's reactive UI paradigm, widget tree composition, and responsive layout engineering. 

Special thanks to **Poonam Ma'am** for her continuous mentorship, code reviews, and inspiration in developing clean, high-performance mobile applications.
