# Flutter Profile Card - Assignment 3

## Assignment Overview

Build a Flutter profile card screen using `Column`, `Row`, `Container`, `CircleAvatar`, `Text`, and `Icon` widgets with custom theme colors.

## Features

- Responsive profile card centered on the screen
- Custom light-blue, navy, and blue theme colors
- Profile avatar using nested `CircleAvatar` widgets
- Profile name, role, biography, location, and email
- Statistics row for projects, followers, and following
- Connect button with an icon
- Scrollable layout for smaller screens
- Material 3 app theme

## Widgets Used

| Required widget | Where it is used |
| --- | --- |
| `Column` | Main card layout, statistics, and detail content |
| `Row` | App bar action, statistics, and profile details |
| `Container` | Card surface and detail icon backgrounds |
| `CircleAvatar` | Profile avatar and avatar border effect |
| `Text` | Name, role, bio, statistics, and contact details |
| `Icon` | Avatar, menu, location, email, and connect actions |

## Custom Theme Colors

- Navy: `Color(0xFF172554)` for the app bar and headings
- Blue: `Color(0xFF2563EB)` for actions and accents
- Sky: `Color(0xFFE0F2FE)` for the page background and detail surfaces
- Ink: `Color(0xFF172033)` for primary text
- Muted: `Color(0xFF64748B)` for supporting text

## How to Run

From the Flutter project directory containing the `lib` folder:

```bash
flutter pub get
flutter run
```

The app opens directly on the profile card screen.

## Assignment Evaluation Checklist

### Assignment Completion - 2 Marks

- [x] Profile card screen completed
- [x] Required Flutter widgets used
- [x] Custom colors and theme configured
- [x] Responsive scrolling layout included

### Project/Work Quality - 2 Marks

- [x] Screen uses a clear widget hierarchy
- [x] Layout works on narrow screens
- [x] Reusable private widgets created for statistics and details
- [x] Material 3 styling used correctly

### GitHub - 2 Marks

- [x] Repository: [Official-GK/EMBatchAssignments](https://github.com/Official-GK/EMBatchAssignments)
- [x] Main screen: `lib/profile_card.dart`
- [x] App entry point: `lib/main.dart`
- [ ] Pull request created after the PDF is added

### Report and Screenshots - 2 Marks

- [ ] Learning report PDF added by the student
- [ ] Screenshot of the complete profile card added
- [ ] Screenshot showing the app running on the target device added
- [ ] Screenshot links added below after capture

### What You Learned - 2 Marks

- [ ] Minimum two-page learning report added
- [ ] Understanding and problems faced documented in the report

## Screenshot Checklist

Add the real screenshots after running the Flutter application:

1. Full profile card showing the avatar, name, role, bio, and statistics
2. Contact details and Connect button
3. App running on a narrow/mobile viewport to show responsive layout

## Student Information

- **Name**: Gaurav Kulkarni
- **Roll No**: 150096724096
- **Assignment**: Flutter Profile Card Screen
- **Date**: September 2026
