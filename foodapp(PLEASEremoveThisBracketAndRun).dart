import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'customers_page.dart';
import 'dashboard_page.dart';
import 'offers_page.dart';
import 'orders_page.dart';
import 'settings_page.dart';

// Japanese Calm Temple Theme Palette
class JapaneseTheme {
  static const Color creamBg = Color(0xFFF9F6F0);
  static const Color washiPaper = Color(0xFFFAF7F2);
  static const Color toriiCrimson = Color(0xFF9E2A2B);
  static const Color cinnabarRed = Color(0xFFB71C1C);
  static const Color vermilionLight = Color(0xFFFDE8E8);
  static const Color matchaGreen = Color(0xFF386641);
  static const Color matchaLight = Color(0xFFE9F5EC);
  static const Color goldAccent = Color(0xFFC5A059);
  static const Color goldLight = Color(0xFFFBF4E4);
  static const Color inkBlack = Color(0xFF2B2118);
  static const Color stoneGrey = Color(0xFF6B665E);
  static const Color borderLight = Color(0xFFEADBCE);
}

enum DiningMode {
  dineIn,
  takeAway,
  orderOnline,
}

class MealItem {
  final String id;
  final String name;
  final String jpName;
  final String category;
  final int price;
  final String rating;
  final String description;
  final String imageUrl;
  final IconData icon;

  const MealItem({
    required this.id,
    required this.name,
    required this.jpName,
    required this.category,
    required this.price,
    required this.rating,
    required this.description,
    required this.imageUrl,
    this.icon = Icons.restaurant,
  });
}

class FoodData {
  static const List<MealItem> allMeals = [
    // --- RAMEN & NOODLES (6 Meals) ---
    MealItem(
      id: 'm1',
      name: 'Tonkotsu Ramen',
      jpName: '豚骨ラーメン',
      category: 'Ramen',
      price: 249,
      rating: '4.9/5',
      description: 'Slow-simmered 16hr rich pork bone broth, tender chashu, soft ajitsuke egg & nori.',
      imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),
    MealItem(
      id: 'm2',
      name: 'Spicy Miso Ramen',
      jpName: '辛味噌ラーメン',
      category: 'Ramen',
      price: 269,
      rating: '4.8/5',
      description: 'Hokkaido red miso broth with fragrant chili oil, minced pork, sweet corn & butter pat.',
      imageUrl: 'https://images.unsplash.com/photo-1591814468924-caf88d1232e1?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),
    MealItem(
      id: 'm3',
      name: 'Tokyo Shoyu Ramen',
      jpName: '醤油ラーメン',
      category: 'Ramen',
      price: 239,
      rating: '4.7/5',
      description: 'Clear chicken & dashi broth infused with aged barrel soy sauce and menma bamboo.',
      imageUrl: 'https://images.unsplash.com/photo-1552611052-33e04de081de?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),
    MealItem(
      id: 'm4',
      name: 'Crispy Tempura Udon',
      jpName: '天ぷらうどん',
      category: 'Ramen',
      price: 219,
      rating: '4.6/5',
      description: 'Chewy handmade Sanuki udon in golden broth with jumbo tiger prawn tempura.',
      imageUrl: 'https://images.unsplash.com/photo-1618841557871-b4664fbf0cb3?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),
    MealItem(
      id: 'm5',
      name: 'Tsukemen Dipping Noodles',
      jpName: '特製つけ麺',
      category: 'Ramen',
      price: 279,
      rating: '4.8/5',
      description: 'Extra thick chilled noodles with a boiling hyper-concentrated bonito pork dip.',
      imageUrl: 'https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),
    MealItem(
      id: 'm6',
      name: 'Street Style Yakisoba',
      jpName: '焼きそば',
      category: 'Ramen',
      price: 199,
      rating: '4.5/5',
      description: 'Wok-seared soba noodles with tender pork belly, cabbage, pickled ginger & aonori.',
      imageUrl: 'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=500&auto=format&fit=crop&q=80',
      icon: Icons.ramen_dining,
    ),

    // --- SUSHI & SASHIMI (5 Meals) ---
    MealItem(
      id: 'm7',
      name: 'Premium Salmon Nigiri Set',
      jpName: 'サーモン握り',
      category: 'Sushi',
      price: 299,
      rating: '4.9/5',
      description: '6 pieces of fresh Atlantic salmon brushed with chef nikiri soy glaze.',
      imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500&auto=format&fit=crop&q=80',
      icon: Icons.set_meal,
    ),
    MealItem(
      id: 'm8',
      name: 'Spicy Tuna Maki Roll',
      jpName: 'スパイシーツナ',
      category: 'Sushi',
      price: 279,
      rating: '4.7/5',
      description: 'Yellowfin tuna tartar with spicy sriracha Kewpie mayo, cucumber & sesame.',
      imageUrl: 'https://images.unsplash.com/photo-1611143669185-af224c5e3252?w=500&auto=format&fit=crop&q=80',
      icon: Icons.set_meal,
    ),
    MealItem(
      id: 'm9',
      name: 'Dragon Roll (Eel & Avocado)',
      jpName: 'ドラゴンロール',
      category: 'Sushi',
      price: 349,
      rating: '4.9/5',
      description: 'Crispy prawn tempura roll blanketed with grilled eel, avocado and kabayaki sauce.',
      imageUrl: 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=500&auto=format&fit=crop&q=80',
      icon: Icons.set_meal,
    ),
    MealItem(
      id: 'm10',
      name: 'California Crab Roll',
      jpName: 'カリフォルニアロール',
      category: 'Sushi',
      price: 249,
      rating: '4.6/5',
      description: 'Snow crab, fresh avocado, crunchy cucumber coated with orange tobiko roe.',
      imageUrl: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=500&auto=format&fit=crop&q=80',
      icon: Icons.set_meal,
    ),
    MealItem(
      id: 'm11',
      name: 'Sashimi Moriawase Platter',
      jpName: '刺身盛り合わせ',
      category: 'Sushi',
      price: 399,
      rating: '5.0/5',
      description: 'Chef cut thick slices of prime Atlantic Salmon, Maguro Tuna & Hamachi.',
      imageUrl: 'https://images.unsplash.com/photo-1534482421-64566f976cfa?w=500&auto=format&fit=crop&q=80',
      icon: Icons.set_meal,
    ),

    // --- DONBURI & RICE (6 Meals) ---
    MealItem(
      id: 'm12',
      name: 'Chicken Katsu Curry Don',
      jpName: 'チキンカツカレー',
      category: 'Donburi',
      price: 289,
      rating: '4.9/5',
      description: 'Crispy golden panko chicken cutlet over rice smothered in rich Japanese curry.',
      imageUrl: 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=500&auto=format&fit=crop&q=80',
      icon: Icons.lunch_dining,
    ),
    MealItem(
      id: 'm13',
      name: 'Beef Gyudon Bowl',
      jpName: '特製牛丼',
      category: 'Donburi',
      price: 269,
      rating: '4.8/5',
      description: 'Thinly shaved prime beef and caramelized sweet onions simmered in sweet mirin dashi.',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&auto=format&fit=crop&q=80',
      icon: Icons.rice_bowl,
    ),
    MealItem(
      id: 'm14',
      name: 'Glazed Chicken Teriyaki Don',
      jpName: '照り焼きチキン丼',
      category: 'Donburi',
      price: 259,
      rating: '4.7/5',
      description: 'Charbroiled juicy chicken thigh glazed with glossy artisan teriyaki glaze & sesame.',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&auto=format&fit=crop&q=80',
      icon: Icons.restaurant,
    ),
    MealItem(
      id: 'm15',
      name: 'Unagi Don (Grilled Eel)',
      jpName: '特上うなぎ丼',
      category: 'Donburi',
      price: 369,
      rating: '4.9/5',
      description: 'Sweet soy-lacquered freshwater eel grilled over open binchotan coals on rice.',
      imageUrl: 'https://images.unsplash.com/photo-1580822184713-fc5400e7fe10?w=500&auto=format&fit=crop&q=80',
      icon: Icons.rice_bowl,
    ),
    MealItem(
      id: 'm16',
      name: 'Oyakodon (Chicken & Egg)',
      jpName: '親子丼',
      category: 'Donburi',
      price: 239,
      rating: '4.6/5',
      description: 'Silky scrambled organic egg and tender chicken simmered in sweet mirin broth.',
      imageUrl: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=500&auto=format&fit=crop&q=80',
      icon: Icons.rice_bowl,
    ),
    MealItem(
      id: 'm17',
      name: 'Garlic Butter Chahan',
      jpName: 'ガーリック炒飯',
      category: 'Donburi',
      price: 199,
      rating: '4.5/5',
      description: 'High-heat wok fried Japanese rice with crispy garlic chips, scrambled egg & green scallions.',
      imageUrl: 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=500&auto=format&fit=crop&q=80',
      icon: Icons.rice_bowl,
    ),

    // --- SIDES & APPETIZERS (5 Meals) ---
    MealItem(
      id: 'm18',
      name: 'Crispy Pork & Leek Gyoza',
      jpName: '焼き餃子 (6個)',
      category: 'Sides',
      price: 159,
      rating: '4.8/5',
      description: 'Pan-seared dumplings with a crispy lace skirt served with chili sesame soy dip.',
      imageUrl: 'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?w=500&auto=format&fit=crop&q=80',
      icon: Icons.restaurant,
    ),
    MealItem(
      id: 'm19',
      name: 'Osaka Takoyaki (Octopus Balls)',
      jpName: 'たこ焼き (6個)',
      category: 'Sides',
      price: 179,
      rating: '4.9/5',
      description: 'Crispy golden batter balls stuffed with octopus, Kewpie mayo, takoyaki sauce & dancing bonito flakes.',
      imageUrl: 'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?w=500&auto=format&fit=crop&q=80',
      icon: Icons.fastfood,
    ),
    MealItem(
      id: 'm20',
      name: 'Japanese Chicken Karaage',
      jpName: '鶏の唐揚げ',
      category: 'Sides',
      price: 189,
      rating: '4.8/5',
      description: 'Soy, ginger & garlic double-fried crunchy chicken morsels with fresh lemon.',
      imageUrl: 'https://images.unsplash.com/photo-1562967914-608f82629710?w=500&auto=format&fit=crop&q=80',
      icon: Icons.fastfood,
    ),
    MealItem(
      id: 'm21',
      name: 'Steamed Edamame with Sea Salt',
      jpName: '枝豆 (塩味)',
      category: 'Sides',
      price: 129,
      rating: '4.5/5',
      description: 'Tender young soybean pods freshly steamed and sprinkled with coarse Okinawa sea salt.',
      imageUrl: 'https://images.unsplash.com/photo-1559847844-5315695dadae?w=500&auto=format&fit=crop&q=80',
      icon: Icons.eco,
    ),
    MealItem(
      id: 'm22',
      name: 'Agedashi Silken Tofu',
      jpName: '揚げ出し豆腐',
      category: 'Sides',
      price: 149,
      rating: '4.6/5',
      description: 'Delicate crispy potato starch fried tofu resting in warm dashi broth with grated daikon.',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=500&auto=format&fit=crop&q=80',
      icon: Icons.restaurant,
    ),

    // --- DESSERTS & DRINKS (5 Meals) ---
    MealItem(
      id: 'm23',
      name: 'Kyoto Matcha Parfait',
      jpName: '抹茶パフェ',
      category: 'Dessert',
      price: 179,
      rating: '4.9/5',
      description: 'Uji matcha gelato, sweet azuki red beans, warabi mochi cubes and crisp wafer.',
      imageUrl: 'https://images.unsplash.com/photo-1505253758473-96b7015fcd40?w=500&auto=format&fit=crop&q=80',
      icon: Icons.icecream,
    ),
    MealItem(
      id: 'm24',
      name: 'Handmade Mochi Trio',
      jpName: 'もち 3種',
      category: 'Dessert',
      price: 149,
      rating: '4.7/5',
      description: 'Three soft pillowy rice cakes: Red Bean Anko, Uji Matcha, and Strawberry Cream.',
      imageUrl: 'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=500&auto=format&fit=crop&q=80',
      icon: Icons.cake,
    ),
    MealItem(
      id: 'm25',
      name: 'Dorayaki Honey Pancake',
      jpName: 'どら焼き',
      category: 'Dessert',
      price: 129,
      rating: '4.6/5',
      description: 'Fluffy golden honey castella pancakes filled with sweetened Azuki red bean paste.',
      imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500&auto=format&fit=crop&q=80',
      icon: Icons.bakery_dining,
    ),
    MealItem(
      id: 'm26',
      name: 'Iced Roasted Hojicha Latte',
      jpName: 'ほうじ茶ラテ',
      category: 'Dessert',
      price: 119,
      rating: '4.8/5',
      description: 'Rich roasted green tea with a smoky caramel aroma and creamy oat milk.',
      imageUrl: 'https://images.unsplash.com/photo-1544787219-7f47ccb76574?w=500&auto=format&fit=crop&q=80',
      icon: Icons.local_cafe,
    ),
    MealItem(
      id: 'm27',
      name: 'Japanese Ramune Marble Soda',
      jpName: 'ラムネ (オリジナル)',
      category: 'Dessert',
      price: 99,
      rating: '4.7/5',
      description: 'Classic bubbly citrus-lime Japanese soda in an iconic glass bottle with marble stopper.',
      imageUrl: 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=500&auto=format&fit=crop&q=80',
      icon: Icons.local_drink,
    ),
  ];

  static List<MealItem> get mainDishes =>
      allMeals.where((m) => m.category == 'Ramen' || m.category == 'Sushi' || m.category == 'Donburi').toList();

  static List<MealItem> get sideDishes =>
      allMeals.where((m) => m.category == 'Sides').toList();

  static List<MealItem> get drinkAndDessertDishes =>
      allMeals.where((m) => m.category == 'Dessert').toList();
}

// Global Order State
class CurrentOrderState {
  static DiningMode selectedMode = DiningMode.dineIn;
  static String tableNumber = 'Table 04 (Tatami Garden)';
  static String pickupTime = 'In 15 Mins (Express Counter)';
  static String deliveryAddress = 'Flat 402, Sakura Residency';
}

// Background Animation: Floating Sakura Petals
class TempleAnimatedBackground extends StatefulWidget {
  final Widget child;
  const TempleAnimatedBackground({super.key, required this.child});

  @override
  State<TempleAnimatedBackground> createState() => _TempleAnimatedBackgroundState();
}

class _TempleAnimatedBackgroundState extends State<TempleAnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Petal> _petals = [];
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    for (int i = 0; i < 22; i++) {
      _petals.add(
        _Petal(
          x: _random.nextDouble(),
          y: _random.nextDouble(),
          size: 7 + _random.nextDouble() * 9,
          speed: 0.08 + _random.nextDouble() * 0.12,
          swaySpeed: 1.0 + _random.nextDouble() * 2.0,
          opacity: 0.25 + _random.nextDouble() * 0.45,
          rotation: _random.nextDouble() * math.pi * 2,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFCF9F3),
                Color(0xFFF6F0E5),
                Color(0xFFFAF4EB),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: _SakuraPainter(
                  petals: _petals,
                  progress: _controller.value,
                ),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _Petal {
  double x;
  double y;
  double size;
  double speed;
  double swaySpeed;
  double opacity;
  double rotation;

  _Petal({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.swaySpeed,
    required this.opacity,
    required this.rotation,
  });
}

class _SakuraPainter extends CustomPainter {
  final List<_Petal> petals;
  final double progress;

  _SakuraPainter({required this.petals, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    for (var petal in petals) {
      double currentY = (petal.y + progress * petal.speed * 4) % 1.1 - 0.05;
      double sway = math.sin((progress * math.pi * 2 * petal.swaySpeed) + petal.x * 10) * 0.03;
      double currentX = (petal.x + sway) % 1.0;

      double px = currentX * size.width;
      double py = currentY * size.height;

      paint.color = const Color(0xFFF8BBD0).withValues(alpha: petal.opacity);

      canvas.save();
      canvas.translate(px, py);
      canvas.rotate(petal.rotation + progress * math.pi * 2);

      final Rect rect = Rect.fromCenter(
        center: Offset.zero,
        width: petal.size,
        height: petal.size * 1.5,
      );
      canvas.drawOval(rect, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _SakuraPainter oldDelegate) => true;
}

// User-centric Responsive Main Screen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              elevation: 0,
              backgroundColor: JapaneseTheme.toriiCrimson,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: JapaneseTheme.goldAccent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      '食',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Parth Food Hub',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrdersPage()),
                    );
                  },
                ),
              ],
            )
          : null,
      body: TempleAnimatedBackground(
        child: Row(
          children: [
            if (!isMobile)
              SizedBox(
                width: screenWidth >= 1024 ? 250 : 200,
                child: const SideMenu(),
              ),
            Expanded(
              child: DashboardContent(
                isMobile: isMobile,
                isTablet: isTablet,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sidebar for User "Parth"
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF85191C),
        border: Border(
          right: BorderSide(
            color: JapaneseTheme.goldAccent,
            width: 2.5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(3, 0),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 28),

            // Profile Crest for Parth
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: JapaneseTheme.washiPaper,
                border: Border.all(
                  color: JapaneseTheme.goldAccent,
                  width: 3,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '食',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF85191C),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Parth Food Hub',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Diner: Parth • 金会員 (VIP)',
                style: TextStyle(
                  color: JapaneseTheme.goldAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const MenuItem(
              icon: Icons.home_rounded,
              title: 'My Hub',
              targetPage: DashboardPage(),
            ),

            const MenuItem(
              icon: Icons.receipt_long_rounded,
              title: 'My Orders',
              targetPage: OrdersPage(),
            ),

            const MenuItem(
              icon: Icons.groups_rounded,
              title: 'Foodies Club',
              targetPage: CustomersPage(),
            ),

            const MenuItem(
              icon: Icons.local_offer_rounded,
              title: 'My Offers',
              targetPage: OffersPage(),
            ),

            const MenuItem(
              icon: Icons.settings_rounded,
              title: 'Preferences',
              targetPage: SettingsPage(),
            ),

            const Spacer(),

            // Greeting banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: JapaneseTheme.goldAccent.withValues(alpha: 0.5),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.temple_buddhist, color: JapaneseTheme.goldAccent, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'いただきます!',
                    style: TextStyle(
                      color: JapaneseTheme.goldAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable menu item
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? targetPage;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          color: JapaneseTheme.goldAccent,
          size: 22,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 13,
          color: Colors.white70,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return targetPage ?? DetailScreen(title: title);
              },
            ),
          );
        },
      ),
    );
  }
}

// User Personal Quick Card (Favorites, Points, Vouchers, Track)
class UserStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;

  const UserStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.94),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: JapaneseTheme.borderLight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0E000000),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: JapaneseTheme.vermilionLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: JapaneseTheme.toriiCrimson.withValues(alpha: 0.2),
                ),
              ),
              child: Icon(
                icon,
                size: 24,
                color: JapaneseTheme.toriiCrimson,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: JapaneseTheme.stoneGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// McDonald's Style Dining Mode Selector
class DiningModeSelector extends StatelessWidget {
  final DiningMode currentMode;
  final Function(DiningMode) onModeChanged;

  const DiningModeSelector({
    super.key,
    required this.currentMode,
    required this.onModeChanged,
  });

  void _showConfigSheet(BuildContext context, DiningMode mode) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(22),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mode == DiningMode.dineIn
                        ? 'Select Temple Table (店内飲食)'
                        : mode == DiningMode.takeAway
                            ? 'Select Pickup Time (お持ち帰り)'
                            : 'Delivery Address (出前お届け先)',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (mode == DiningMode.dineIn) ...[
                const Text('Choose your seating area in the sanctuary:'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'Table 04 (Tatami Garden)',
                    'Table 08 (Koi Pond Booth)',
                    'Table 12 (Shoji Window)',
                    'Counter 02 (Chef View)',
                  ].map((table) {
                    final isSel = CurrentOrderState.tableNumber == table;
                    return ChoiceChip(
                      label: Text(table),
                      selected: isSel,
                      selectedColor: JapaneseTheme.toriiCrimson,
                      labelStyle: TextStyle(
                        color: isSel ? Colors.white : JapaneseTheme.inkBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (selected) {
                        CurrentOrderState.tableNumber = table;
                        Navigator.pop(ctx);
                        onModeChanged(DiningMode.dineIn);
                      },
                    );
                  }).toList(),
                ),
              ] else if (mode == DiningMode.takeAway) ...[
                const Text('When would you like to collect your feast?'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'In 15 Mins (Express Counter)',
                    'In 30 Mins',
                    'In 45 Mins',
                    'Scheduled for Evening',
                  ].map((slot) {
                    final isSel = CurrentOrderState.pickupTime == slot;
                    return ChoiceChip(
                      label: Text(slot),
                      selected: isSel,
                      selectedColor: JapaneseTheme.toriiCrimson,
                      labelStyle: TextStyle(
                        color: isSel ? Colors.white : JapaneseTheme.inkBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (selected) {
                        CurrentOrderState.pickupTime = slot;
                        Navigator.pop(ctx);
                        onModeChanged(DiningMode.takeAway);
                      },
                    );
                  }).toList(),
                ),
              ] else ...[
                const Text('Delivering hot to Parth:'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'Flat 402, Sakura Residency',
                    'Office: IT Park Tower B',
                    'Current GPS Location',
                  ].map((addr) {
                    final isSel = CurrentOrderState.deliveryAddress == addr;
                    return ChoiceChip(
                      label: Text(addr),
                      selected: isSel,
                      selectedColor: JapaneseTheme.toriiCrimson,
                      labelStyle: TextStyle(
                        color: isSel ? Colors.white : JapaneseTheme.inkBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      onSelected: (selected) {
                        CurrentOrderState.deliveryAddress = addr;
                        Navigator.pop(ctx);
                        onModeChanged(DiningMode.orderOnline);
                      },
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: JapaneseTheme.goldAccent, width: 1.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildModeButton(
                  context: context,
                  mode: DiningMode.dineIn,
                  title: 'Dine In',
                  jpTitle: '店内',
                  icon: Icons.table_restaurant_rounded,
                  isSelected: currentMode == DiningMode.dineIn,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildModeButton(
                  context: context,
                  mode: DiningMode.takeAway,
                  title: 'Take Away',
                  jpTitle: '持帰',
                  icon: Icons.shopping_bag_outlined,
                  isSelected: currentMode == DiningMode.takeAway,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildModeButton(
                  context: context,
                  mode: DiningMode.orderOnline,
                  title: 'Order Online',
                  jpTitle: '出前',
                  icon: Icons.delivery_dining_rounded,
                  isSelected: currentMode == DiningMode.orderOnline,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _showConfigSheet(context, currentMode),
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: JapaneseTheme.goldLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: JapaneseTheme.goldAccent.withValues(alpha: 0.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline, size: 16, color: JapaneseTheme.toriiCrimson),
                      const SizedBox(width: 6),
                      Text(
                        currentMode == DiningMode.dineIn
                            ? 'Seated at: ${CurrentOrderState.tableNumber}'
                            : currentMode == DiningMode.takeAway
                                ? 'Pickup: ${CurrentOrderState.pickupTime}'
                                : 'Delivering to: ${CurrentOrderState.deliveryAddress}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: JapaneseTheme.inkBlack,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Change >',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.toriiCrimson,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeButton({
    required BuildContext context,
    required DiningMode mode,
    required String title,
    required String jpTitle,
    required IconData icon,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () {
        onModeChanged(mode);
        _showConfigSheet(context, mode);
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? JapaneseTheme.toriiCrimson : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? JapaneseTheme.toriiCrimson : Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : JapaneseTheme.inkBlack,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : JapaneseTheme.inkBlack,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              jpTitle,
              style: TextStyle(
                color: isSelected ? JapaneseTheme.goldAccent : JapaneseTheme.stoneGrey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Interactive Custom Combo Meal Builder Screen
class CustomComboBuilderScreen extends StatefulWidget {
  const CustomComboBuilderScreen({super.key});

  @override
  State<CustomComboBuilderScreen> createState() => _CustomComboBuilderScreenState();
}

class _CustomComboBuilderScreenState extends State<CustomComboBuilderScreen> {
  MealItem? selectedMain;
  MealItem? selectedSide;
  MealItem? selectedDrinkOrDessert;

  @override
  void initState() {
    super.initState();
    selectedMain = FoodData.mainDishes.first;
    selectedSide = FoodData.sideDishes.first;
    selectedDrinkOrDessert = FoodData.drinkAndDessertDishes.first;
  }

  int get rawTotal => (selectedMain?.price ?? 0) + (selectedSide?.price ?? 0) + (selectedDrinkOrDessert?.price ?? 0);
  int get comboDiscount => (rawTotal * 0.20).round(); // Automatic 20% bundle discount
  int get discountedTotal => rawTotal - comboDiscount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text('Make Your Custom Combo (セット作成)'),
      ),
      body: TempleAnimatedBackground(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // Combo Value Pitch Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF85191C),
                    JapaneseTheme.toriiCrimson,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: JapaneseTheme.goldAccent, width: 1.5),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: JapaneseTheme.goldAccent,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Automatic 20% Combo Savings!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'Pick 1 Main Bowl + 1 Side + 1 Dessert/Drink for instant bundle discount.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Step 1: Main Dish
            _buildSectionHeader('Step 1: Choose Main Bowl (メイン料理)', Icons.ramen_dining),
            const SizedBox(height: 10),
            _buildPickerList(
              items: FoodData.mainDishes,
              selectedItem: selectedMain,
              onSelect: (item) => setState(() => selectedMain = item),
            ),

            const SizedBox(height: 20),

            // Step 2: Side Dish
            _buildSectionHeader('Step 2: Choose Side / Appetizer (サイド)', Icons.fastfood),
            const SizedBox(height: 10),
            _buildPickerList(
              items: FoodData.sideDishes,
              selectedItem: selectedSide,
              onSelect: (item) => setState(() => selectedSide = item),
            ),

            const SizedBox(height: 20),

            // Step 3: Drink / Dessert
            _buildSectionHeader('Step 3: Choose Dessert or Drink (甘味・飲物)', Icons.icecream),
            const SizedBox(height: 10),
            _buildPickerList(
              items: FoodData.drinkAndDessertDishes,
              selectedItem: selectedDrinkOrDessert,
              onSelect: (item) => setState(() => selectedDrinkOrDessert = item),
            ),

            const SizedBox(height: 25),

            // Summary & Auto Discount Box
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: JapaneseTheme.goldAccent, width: 1.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Original Menu Price:', style: TextStyle(color: JapaneseTheme.stoneGrey)),
                      Text(
                        '₹$rawTotal',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.local_offer, color: JapaneseTheme.matchaGreen, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Combo Bundle Savings (20% OFF):',
                            style: TextStyle(
                              color: JapaneseTheme.matchaGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '-₹$comboDiscount',
                        style: const TextStyle(
                          color: JapaneseTheme.matchaGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Parth’s Combo Total:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: JapaneseTheme.inkBlack,
                        ),
                      ),
                      Text(
                        '₹$discountedTotal',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: JapaneseTheme.toriiCrimson,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: JapaneseTheme.toriiCrimson,
                            content: Text(
                              'Custom Combo (${selectedMain?.name} + ${selectedSide?.name} + ${selectedDrinkOrDessert?.name}) added for ₹$discountedTotal! (Savings: ₹$comboDiscount)',
                            ),
                            action: SnackBarAction(
                              label: 'View Order',
                              textColor: JapaneseTheme.goldAccent,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OrdersPage()),
                                );
                              },
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                      label: const Text('Add Combo to Order (コンボを注文)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: JapaneseTheme.toriiCrimson,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: JapaneseTheme.toriiCrimson),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: JapaneseTheme.inkBlack,
          ),
        ),
      ],
    );
  }

  Widget _buildPickerList({
    required List<MealItem> items,
    required MealItem? selectedItem,
    required Function(MealItem) onSelect,
  }) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = selectedItem?.id == item.id;

          return InkWell(
            onTap: () => onSelect(item),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 140,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? JapaneseTheme.vermilionLight : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? JapaneseTheme.toriiCrimson : JapaneseTheme.borderLight,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.imageUrl,
                      height: 52,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 52,
                        color: JapaneseTheme.goldLight,
                        child: Icon(item.icon, color: JapaneseTheme.toriiCrimson),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                      color: isSelected ? JapaneseTheme.toriiCrimson : JapaneseTheme.inkBlack,
                    ),
                  ),
                  Text(
                    '₹${item.price}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.matchaGreen,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Food Grid with full 27 Japanese dishes & User Ordering Action
class FoodGrid extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final String searchText;
  final String selectedCategory;

  const FoodGrid({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.searchText,
    this.selectedCategory = 'All',
  });

  @override
  Widget build(BuildContext context) {
    final filteredFoods = FoodData.allMeals.where((food) {
      String name = food.name.toLowerCase();
      String jpName = food.jpName.toLowerCase();
      String category = food.category;

      bool matchesCategory = (selectedCategory == 'All') || (category == selectedCategory);
      bool matchesSearch = name.contains(searchText.toLowerCase()) || jpName.contains(searchText.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    if (filteredFoods.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: JapaneseTheme.borderLight),
        ),
        child: const Center(
          child: Column(
            children: [
              Icon(Icons.search_off, size: 40, color: JapaneseTheme.stoneGrey),
              SizedBox(height: 10),
              Text(
                'No dishes found matching your cravings (見つかりません)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: JapaneseTheme.inkBlack,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredFoods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? 2
            : isTablet
                ? 3
                : 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 0.74 : 0.80,
      ),
      itemBuilder: (context, index) {
        final food = filteredFoods[index];
        return FoodCard(
          foodName: food.name,
          price: '₹${food.price}',
          rating: food.rating,
          icon: food.icon,
          imageUrl: food.imageUrl,
          jpName: food.jpName,
          description: food.description,
        );
      },
    );
  }
}

// User Interactive Food Card
class FoodCard extends StatelessWidget {
  final String foodName;
  final String price;
  final String rating;
  final IconData icon;
  final String? imageUrl;
  final String? jpName;
  final String? description;

  const FoodCard({
    super.key,
    required this.foodName,
    required this.price,
    required this.rating,
    required this.icon,
    this.imageUrl,
    this.jpName,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JapaneseTheme.borderLight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Dish Image
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (imageUrl != null && imageUrl!.isNotEmpty)
                    Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: JapaneseTheme.goldLight,
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: JapaneseTheme.toriiCrimson,
                              ),
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: JapaneseTheme.vermilionLight,
                          child: Icon(
                            icon,
                            size: 38,
                            color: JapaneseTheme.toriiCrimson,
                          ),
                        );
                      },
                    )
                  else
                    Container(
                      color: JapaneseTheme.vermilionLight,
                      child: Icon(
                        icon,
                        size: 38,
                        color: JapaneseTheme.toriiCrimson,
                      ),
                    ),

                  // Rating pill
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: JapaneseTheme.goldAccent,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            rating.replaceAll('/5', ''),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Kanji badge
                  if (jpName != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: JapaneseTheme.toriiCrimson.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          jpName!,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Details & Order Button for User
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: JapaneseTheme.inkBlack,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            color: JapaneseTheme.matchaGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            final modeStr = CurrentOrderState.selectedMode == DiningMode.dineIn
                                ? 'Dine In (${CurrentOrderState.tableNumber})'
                                : CurrentOrderState.selectedMode == DiningMode.takeAway
                                    ? 'Take Away (${CurrentOrderState.pickupTime})'
                                    : 'Delivery (${CurrentOrderState.deliveryAddress})';

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: JapaneseTheme.toriiCrimson,
                                content: Text('Added $foodName for $modeStr! (注文に追加)'),
                                action: SnackBarAction(
                                  label: 'View Order',
                                  textColor: JapaneseTheme.goldAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const OrdersPage()),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: JapaneseTheme.toriiCrimson,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add_shopping_cart, size: 13, color: Colors.white),
                                SizedBox(width: 3),
                                Text(
                                  'Order',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User Active Live Order Banner
class ActiveOrderBanner extends StatelessWidget {
  const ActiveOrderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JapaneseTheme.goldAccent,
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0E000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: JapaneseTheme.vermilionLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.delivery_dining,
                      color: JapaneseTheme.toriiCrimson,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Parth’s Active Order #JP1002',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFD97706)),
                ),
                child: const Text(
                  'Preparing • 調理中',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD97706),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Chicken Katsu Curry + Gyoza (ETA: 18 mins)',
            style: TextStyle(color: JapaneseTheme.stoneGrey, fontSize: 13),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.65,
              backgroundColor: Color(0xFFEADBCE),
              color: JapaneseTheme.toriiCrimson,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

// User Quick Offer banner
class QuickOffer extends StatelessWidget {
  const QuickOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF85191C),
            JapaneseTheme.toriiCrimson,
          ],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JapaneseTheme.goldAccent,
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.local_offer_rounded,
            color: JapaneseTheme.goldAccent,
            size: 32,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '今日の特典 • Parth’s Special Offer',
                  style: TextStyle(
                    color: JapaneseTheme.goldAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Enjoy 20% OFF on all authentic Japanese bowls with code PARTH20',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Main User Dashboard Content
class DashboardContent extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;

  const DashboardContent({
    super.key,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  String searchText = '';
  String selectedCategory = 'All';

  final List<String> categories = ['All', 'Ramen', 'Sushi', 'Donburi', 'Sides', 'Dessert'];

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'おはよう, Parth! (Good Morning)';
    } else if (hour < 17) {
      return 'こんにちは, Parth! (Good Afternoon)';
    } else {
      return 'こんばんは, Parth! (Good Evening)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(
          widget.isMobile ? 16 : 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Greeting Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getGreeting(),
                        style: TextStyle(
                          fontSize: widget.isMobile ? 21 : 28,
                          fontWeight: FontWeight.bold,
                          color: JapaneseTheme.inkBlack,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'What delicious Japanese feast would you like today?',
                        style: TextStyle(
                          color: JapaneseTheme.stoneGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!widget.isMobile)
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: JapaneseTheme.toriiCrimson,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: JapaneseTheme.goldAccent,
                        width: 2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 18),

            // McDonald's Style Dining Mode Selector (Dine-In, Takeaway, Delivery)
            DiningModeSelector(
              currentMode: CurrentOrderState.selectedMode,
              onModeChanged: (mode) {
                setState(() {
                  CurrentOrderState.selectedMode = mode;
                });
              },
            ),

            const SizedBox(height: 18),

            // Custom Combo Maker Banner (Auto Discount)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomComboBuilderScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(18),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF85191C),
                      Color(0xFF9E2A2B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: JapaneseTheme.goldAccent, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: JapaneseTheme.goldAccent),
                      ),
                      child: const Icon(
                        Icons.lunch_dining_rounded,
                        color: JapaneseTheme.goldAccent,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Make Your Custom Combo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '20% OFF',
                                style: TextStyle(
                                  color: JapaneseTheme.goldAccent,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Bundle Main + Side + Drink/Dessert with automatic discount!',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // Active Order Live Tracking
            const ActiveOrderBanner(),

            const SizedBox(height: 18),

            // Quick Offer Banner
            const QuickOffer(),

            const SizedBox(height: 22),

            // Diner Quick Overview Cards (Favorites, Points, Vouchers, Track)
            Row(
              children: const [
                Icon(Icons.person_pin_circle_outlined, color: JapaneseTheme.toriiCrimson, size: 22),
                SizedBox(width: 8),
                Text(
                  "Parth’s Dining Hub (マイハブ)",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // User-based cards
            if (widget.isMobile)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: UserStatCard(
                          title: 'Reward Points',
                          value: '850 pts',
                          icon: Icons.stars_rounded,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OffersPage()));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: UserStatCard(
                          title: 'My Vouchers',
                          value: '4 Available',
                          icon: Icons.local_offer,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OffersPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: UserStatCard(
                          title: 'Favorite Dishes',
                          value: '5 Saved',
                          icon: Icons.favorite,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: UserStatCard(
                          title: 'Past Orders',
                          value: '12 Orders',
                          icon: Icons.receipt_long,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: UserStatCard(
                      title: 'Reward Points',
                      value: '850 pts',
                      icon: Icons.stars_rounded,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OffersPage()));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UserStatCard(
                      title: 'My Vouchers',
                      value: '4 Available',
                      icon: Icons.local_offer,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OffersPage()));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UserStatCard(
                      title: 'Favorite Dishes',
                      value: '5 Saved',
                      icon: Icons.favorite,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: UserStatCard(
                      title: 'Past Orders',
                      value: '12 Orders',
                      icon: Icons.receipt_long,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersPage()));
                      },
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 28),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search 27 authentic dishes (e.g. Ramen, Sushi, Takoyaki, Gyoza)...',
                hintStyle: const TextStyle(color: JapaneseTheme.stoneGrey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: JapaneseTheme.toriiCrimson,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: JapaneseTheme.borderLight,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: JapaneseTheme.borderLight,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: JapaneseTheme.toriiCrimson,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 18),

            // Category Filter Pills
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = selectedCategory == cat;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = cat;
                      });
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? JapaneseTheme.toriiCrimson : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? JapaneseTheme.toriiCrimson : JapaneseTheme.borderLight,
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isSelected ? Colors.white : JapaneseTheme.inkBlack,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.restaurant_menu, color: JapaneseTheme.toriiCrimson, size: 22),
                    SizedBox(width: 8),
                    Text(
                      '27 Authentic Japanese Dishes (料理メニュー)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: JapaneseTheme.inkBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Food Grid (27 Meals)
            FoodGrid(
              isMobile: widget.isMobile,
              isTablet: widget.isTablet,
              searchText: searchText,
              selectedCategory: selectedCategory,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Generic Detail Screen fallback
class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TempleAnimatedBackground(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: JapaneseTheme.goldAccent,
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.restaurant,
                  size: 64,
                  color: JapaneseTheme.toriiCrimson,
                ),
                const SizedBox(height: 18),
                Text(
                  '$title Screen',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'ようこそ, Parth!',
                  style: TextStyle(
                    fontSize: 18,
                    color: JapaneseTheme.toriiCrimson,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JapaneseTheme.toriiCrimson,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}