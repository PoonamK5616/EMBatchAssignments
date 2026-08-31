# Bite — Food Ordering App

**Branch:** [`food-dashboard-tasks`](https://github.com/SakshiP07/EMBatchAssignments/tree/food-dashboard-tasks)

Bite is the EMBatchAssignments food-ordering app. It uses a KitKat-red theme, shows a logo with the name **Bite** once in the top bar, lists 3 dishes per restaurant, and shows an offer badge only on dishes that have a deal.

## GitHub (this branch)

- Repository: https://github.com/SakshiP07/EMBatchAssignments
- Branch: `food-dashboard-tasks`
- Push / code: https://github.com/SakshiP07/EMBatchAssignments/tree/food-dashboard-tasks
- Pull request into `main`: https://github.com/SakshiP07/EMBatchAssignments/compare/main...food-dashboard-tasks?expand=1

## Branches in this repo

| Branch | What it contains | Link |
| --- | --- | --- |
| `main` | Instagram-style feed (first Flutter app) | https://github.com/SakshiP07/EMBatchAssignments/tree/main |
| `contact-services-page` | Feed plus Contact / Services page | https://github.com/SakshiP07/EMBatchAssignments/tree/contact-services-page |
| `food-dashboard-tasks` | **This branch** — Bite food app | https://github.com/SakshiP07/EMBatchAssignments/tree/food-dashboard-tasks |

## Features (this branch)

- App name: **Bite** (shown once, with logo, in the header)
- Brand color: KitKat red `#D52B1E`
- 3 dishes each at Domino's, Burger King, Italian Corner, Fresh Bites, Hyderabadi House, China Town, Punjab Grill, Mango Shack, Oven Story, and Juice Bar
- Larger desktop food cards, bigger text, short description
- Offer badge on selected dishes (20% OFF, BOGO, ₹100 OFF, and similar)
- Discount applied when that dish is ordered
- Screens: Home, Orders, Offers, Settings, Wishlist, Account

## Run

```bash
git clone https://github.com/SakshiP07/EMBatchAssignments.git
cd EMBatchAssignments
git checkout food-dashboard-tasks
flutter pub get
flutter run -d chrome
```

Hot reload: `r`  
Hot restart: `R`  
Do not refresh the Chrome tab while `flutter run` is active.

## Git commands for this branch

```bash
cd EMBatchAssignments
git checkout -b food-dashboard-tasks
git add lib/foodapp.dart lib/main.dart test/widget_test.dart web/index.html web/manifest.json assets/images README.md
git commit -m "Add Bite food app UI, menus, and dish offers"
git push -u origin food-dashboard-tasks
```

Then open a pull request from `food-dashboard-tasks` into `main`.
