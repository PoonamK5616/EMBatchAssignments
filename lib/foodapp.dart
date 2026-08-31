import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ======================================================
// TASK 1 & TASK 2: APP SETUP & LUXURY DARK MIDNIGHT THEME
// ======================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Kitchen Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF818CF8),
          surface: Color(0xFF12142B),
        ),
        scaffoldBackgroundColor: const Color(0xFF090A16),
        fontFamily: 'Roboto',
      ),
      home: const LandingScreen(),
    );
  }
}

// ======================================================
// DATA MODELS
// ======================================================

class FoodItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final IconData icon;
  final String imageUrl;
  final String description;

  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.icon,
    required this.imageUrl,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class CartItem {
  final FoodItem food;
  int quantity;

  CartItem({required this.food, this.quantity = 1});
}

class OrderItem {
  final String id;
  final String food;
  final String status;
  final double amount;
  final String time;

  const OrderItem({
    required this.id,
    required this.food,
    required this.status,
    required this.amount,
    required this.time,
  });
}

class OfferItem {
  final String title;
  final String description;
  final String code;
  final String discount;
  final String validUntil;
  final Color badgeColor;

  const OfferItem({
    required this.title,
    required this.description,
    required this.code,
    required this.discount,
    required this.validUntil,
    required this.badgeColor,
  });
}

// ======================================================
// LANDING PAGE (WELCOME / HERO SCREEN)
// ======================================================

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 700;

    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Navigation Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF0F1026),
                border: Border(bottom: BorderSide(color: Color(0xFF1E204A), width: 1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.restaurant_menu, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Unit Kitchen',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(builder: (context) => const OffersScreen()),
                          );
                        },
                        child: const Text('Offers', style: TextStyle(color: Color(0xFF94A3B8))),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(builder: (context) => const DashboardScreen()),
                          );
                        },
                        child: const Text('Go to Dashboard'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Hero Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: 50),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1D48),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF4338CA)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.stars_rounded, color: Color(0xFFFBBF24), size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Rajshahi\'s Premium Food Experience',
                          style: TextStyle(
                            color: Color(0xFFA5B4FC),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Delicious Meals, Delivered Fast',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 32 : 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 16),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: const Text(
                      'Explore gourmet burgers, authentic Japanese noodles, royal biryanis, cheesy pizzas and roll combos prepared fresh at Unit Kitchen.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Color(0xFF94A3B8), height: 1.4),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          elevation: 8,
                          shadowColor: const Color(0x604F46E5),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(builder: (context) => const DashboardScreen()),
                          );
                        },
                        icon: const Icon(Icons.restaurant, size: 20),
                        label: const Text(
                          'Explore Full Menu',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Color(0xFF313568)),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(builder: (context) => const OffersScreen()),
                          );
                        },
                        icon: const Icon(Icons.local_offer, size: 18, color: Color(0xFFEC4899)),
                        label: const Text('View Deals'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Feature Cards Row
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: const [
                      _LandingFeatureCard(
                        icon: Icons.flash_on_rounded,
                        title: 'Superfast Delivery',
                        description: 'Hot and fresh delivery within 30 mins.',
                      ),
                      _LandingFeatureCard(
                        icon: Icons.verified_rounded,
                        title: 'Quality Ingredients',
                        description: 'Prepared using 100% fresh gourmet produce.',
                      ),
                      _LandingFeatureCard(
                        icon: Icons.thumb_up_alt_rounded,
                        title: 'Customer Favorite',
                        description: 'Over 12,000+ satisfied foodies in Rajshahi.',
                      ),
                    ],
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

class _LandingFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _LandingFeatureCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF141632),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF282B56)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF21244E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFF818CF8), size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(description, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
        ],
      ),
    );
  }
}

// ======================================================
// TASK 2 & TASK 19: RESPONSIVE DASHBOARD SCREEN WITH CART
// ======================================================

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Set<FoodItem> _likedItems = {};
  final List<CartItem> _cartItems = [];

  void _toggleLike(FoodItem food) {
    setState(() {
      if (_likedItems.contains(food)) {
        _likedItems.remove(food);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF1E204A),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            content: Text(
              '${food.name} removed from Liked Items',
              style: const TextStyle(color: Colors.white),
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        _likedItems.add(food);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF4F46E5),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            content: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${food.name} added to Liked Items!',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    });
  }

  void _addToCart(FoodItem food) {
    setState(() {
      final existingIndex = _cartItems.indexWhere((item) => item.food.id == food.id);
      if (existingIndex >= 0) {
        _cartItems[existingIndex].quantity++;
      } else {
        _cartItems.add(CartItem(food: food, quantity: 1));
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF4F46E5),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          content: Text('Added ${food.name} to Cart!'),
          duration: const Duration(seconds: 1),
        ),
      );
    });
  }

  int get _cartCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              elevation: 0,
              centerTitle: false,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.restaurant_menu, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        Text(
                          'Unit Kitchen',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor: const Color(0xFF090A16),
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Badge(
                    label: Text('$_cartCount'),
                    isLabelVisible: _cartCount > 0,
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => CheckoutScreen(
                          cartItems: _cartItems,
                          onUpdateCart: () => setState(() {}),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          : null,

      drawer: isMobile
          ? Drawer(
              backgroundColor: const Color(0xFF0F1026),
              child: SideMenu(
                likedCount: _likedItems.length,
                cartCount: _cartCount,
                likedItems: _likedItems,
                cartItems: _cartItems,
                onToggleLike: _toggleLike,
                onUpdateCart: () => setState(() {}),
              ),
            )
          : null,

      body: Row(
        children: [
          if (!isMobile)
            SizedBox(
              width: isDesktop ? 240 : 190,
              child: SideMenu(
                likedCount: _likedItems.length,
                cartCount: _cartCount,
                likedItems: _likedItems,
                cartItems: _cartItems,
                onToggleLike: _toggleLike,
                onUpdateCart: () => setState(() {}),
              ),
            ),
          Expanded(
            child: DashboardContent(
              isMobile: isMobile,
              isTablet: isTablet,
              isDesktop: isDesktop,
              likedItems: _likedItems,
              cartItems: _cartItems,
              onToggleLike: _toggleLike,
              onAddToCart: _addToCart,
              onUpdateCart: () => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================
// TASK 3 & TASK 4: SIDEBAR MENU (PROFILE & CHECKOUT INCLUDED)
// ======================================================

class SideMenu extends StatelessWidget {
  final int likedCount;
  final int cartCount;
  final Set<FoodItem> likedItems;
  final List<CartItem> cartItems;
  final Function(FoodItem) onToggleLike;
  final VoidCallback onUpdateCart;

  const SideMenu({
    super.key,
    required this.likedCount,
    required this.cartCount,
    required this.likedItems,
    required this.cartItems,
    required this.onToggleLike,
    required this.onUpdateCart,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0F1026),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Color(0xFF1E204A), width: 1)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 35),

            // TASK 4: Logo Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF4F46E5).withValues(alpha: 0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.restaurant_menu, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Unit Kitchen',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            const MenuItem(
              icon: Icons.dashboard_rounded,
              title: 'Dashboard',
              isCurrentScreen: true,
            ),

            // LIKED ITEMS
            MenuItem(
              icon: Icons.favorite,
              iconColor: const Color(0xFFEC4899),
              title: 'Liked Items',
              badgeCount: likedCount,
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        LikedItemsScreen(likedItems: likedItems, onToggleLike: onToggleLike),
                  ),
                );
              },
            ),

            // CART & CHECKOUT PAGE
            MenuItem(
              icon: Icons.shopping_cart_outlined,
              iconColor: const Color(0xFF6366F1),
              title: 'Cart / Checkout',
              badgeCount: cartCount,
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        CheckoutScreen(cartItems: cartItems, onUpdateCart: onUpdateCart),
                  ),
                );
              },
            ),

            // ORDERS SCREEN
            MenuItem(
              icon: Icons.shopping_bag_outlined,
              title: 'Orders',
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => const OrdersScreen()),
                );
              },
            ),

            // TASK 3: OFFERS SCREEN
            MenuItem(
              icon: Icons.local_offer_outlined,
              title: 'Offers',
              badgeCount: 3,
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => const OffersScreen()),
                );
              },
            ),

            // PROFILE PAGE
            MenuItem(
              icon: Icons.person_outline,
              title: 'Profile',
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => const ProfileScreen()),
                );
              },
            ),

            // SETTINGS SCREEN
            MenuItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTapOverride: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (context) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// REUSABLE MENU ITEM WIDGET
// ======================================================

class MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isCurrentScreen;
  final Color? iconColor;
  final int? badgeCount;
  final VoidCallback? onTapOverride;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.isCurrentScreen = false,
    this.iconColor,
    this.badgeCount,
    this.onTapOverride,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: widget.isCurrentScreen
                ? const Color(0xFF1E204A)
                : (_isHovered ? const Color(0xFF141635) : Colors.transparent),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                if (widget.onTapOverride != null) {
                  widget.onTapOverride!();
                  return;
                }
                if (Scaffold.of(context).isDrawerOpen) {
                  Navigator.pop(context);
                }
                if (widget.isCurrentScreen) return;

                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) {
                      return DetailScreen(title: widget.title);
                    },
                  ),
                );
              },
              borderRadius: BorderRadius.circular(14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      size: 20,
                      color: widget.isCurrentScreen
                          ? const Color(0xFF818CF8)
                          : (widget.iconColor ?? const Color(0xFF94A3B8)),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: widget.isCurrentScreen ? FontWeight.bold : FontWeight.w500,
                          color: widget.isCurrentScreen ? Colors.white : const Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                    if (widget.badgeCount != null && widget.badgeCount! > 0)
                      AnimatedScale(
                        scale: _isHovered ? 1.15 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC4899),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(color: Color(0x60EC4899), blurRadius: 6)],
                          ),
                          child: Text(
                            '${widget.badgeCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// PROFILE PAGE (PROFILE SCREEN)
// ======================================================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 550),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: const Color(0xFF141632),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF282B56)),
              boxShadow: const [
                BoxShadow(color: Color(0x30000000), blurRadius: 20, offset: Offset(0, 8)),
              ],
            ),
            child: Column(
              children: [
                // Avatar Header
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)]),
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(0xFF1E204A),
                        child: Icon(Icons.person, size: 52, color: Color(0xFFA5B4FC)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 14),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text(
                  'Farzan Rahman',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
                ),

                const SizedBox(height: 4),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF311B92),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF6B21A8)),
                  ),
                  child: const Text(
                    'VIP Gold Member',
                    style: TextStyle(
                      color: Color(0xFFE9D5FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 28),
                const Divider(color: Color(0xFF282B56)),
                const SizedBox(height: 20),

                // Info Rows
                const _ProfileInfoRow(
                  icon: Icons.email_outlined,
                  label: 'Email Address',
                  value: 'farzan.rahman@example.com',
                ),
                const SizedBox(height: 14),
                const _ProfileInfoRow(
                  icon: Icons.phone_outlined,
                  label: 'Phone Number',
                  value: '+880 1712-345678',
                ),
                const SizedBox(height: 14),
                const _ProfileInfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Delivery Address',
                  value: 'House 42, Road 7, Padma Residential, Rajshahi',
                ),
                const SizedBox(height: 14),
                const _ProfileInfoRow(
                  icon: Icons.credit_card_outlined,
                  label: 'Default Payment',
                  value: 'bKash Mobile Wallet (•••• 5678)',
                ),

                const SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(const SnackBar(content: Text('Profile edit saved!')));
                        },
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFF87171),
                        side: const BorderSide(color: Color(0xFF7F1D1D)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(builder: (context) => const LandingScreen()),
                        );
                      },
                      icon: const Icon(Icons.logout, size: 18),
                      label: const Text('Logout'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileInfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF21244E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFFA5B4FC), size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ======================================================
// CHECKOUT & CART PAGE (CHECKOUT SCREEN)
// ======================================================

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final VoidCallback onUpdateCart;

  const CheckoutScreen({super.key, required this.cartItems, required this.onUpdateCart});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'bKash Wallet';
  final TextEditingController _promoController = TextEditingController();
  double _discount = 0.0;

  double get _subtotal {
    return widget.cartItems.fold(0.0, (sum, item) => sum + (item.food.price * item.quantity));
  }

  double get _deliveryFee => widget.cartItems.isEmpty ? 0.0 : 40.0;
  double get _total => (_subtotal + _deliveryFee - _discount).clamp(0, 99999);

  void _applyPromo() {
    String code = _promoController.text.trim().toUpperCase();
    if (code == 'BURGER30' || code == 'WEEKEND50') {
      setState(() {
        _discount = _subtotal * 0.3;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF4F46E5),
          content: Text('Promo $code applied! Tk ${_discount.toStringAsFixed(0)} saved.'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF7F1D1D),
          content: Text('Invalid promo code! Try BURGER30'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('Cart & Checkout'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 80, color: Color(0xFF818CF8)),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add delicious food items from the dashboard menu!',
                    style: TextStyle(color: Color(0xFF94A3B8)),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F46E5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Return to Menu'),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Items',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Cart Items List
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF141632),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF282B56)),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item.food.imageUrl,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => Container(
                                  width: 50,
                                  height: 50,
                                  color: const Color(0xFF232650),
                                  child: Icon(item.food.icon, color: const Color(0xFFA5B4FC)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.food.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'Tk ${item.food.price.toStringAsFixed(0)} each',
                                    style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFF87171),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      } else {
                                        widget.cartItems.removeAt(index);
                                      }
                                    });
                                    widget.onUpdateCart();
                                  },
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0xFF34D399),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                    widget.onUpdateCart();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Promo Code Box
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF141632),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFF282B56)),
                          ),
                          child: TextField(
                            controller: _promoController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Promo Code (e.g. BURGER30)...',
                              hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: _applyPromo,
                        child: const Text('Apply'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Payment Method Picker
                  const Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Column(
                    children: ['bKash Wallet', 'Nagad Pay', 'Cash on Delivery'].map((method) {
                      final isSelected = _selectedPayment == method;
                      return ListTile(
                        onTap: () => setState(() => _selectedPayment = method),
                        leading: Icon(
                          isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                          color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF64748B),
                        ),
                        title: Text(method, style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Order Summary Container
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141632),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF282B56)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Subtotal:', style: TextStyle(color: Color(0xFF94A3B8))),
                            Text(
                              'Tk ${_subtotal.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Delivery Fee:', style: TextStyle(color: Color(0xFF94A3B8))),
                            Text(
                              'Tk ${_deliveryFee.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        if (_discount > 0) ...[
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Discount:', style: TextStyle(color: Color(0xFF34D399))),
                              Text(
                                '-Tk ${_discount.toStringAsFixed(0)}',
                                style: const TextStyle(
                                  color: Color(0xFF34D399),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                        const Divider(color: Color(0xFF282B56), height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Payable:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Tk ${_total.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF818CF8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: const Color(0xFF141632),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: const Text(
                              'Order Confirmed! 🎉',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Text(
                              'Thank you for ordering! Your payment of Tk ${_total.toStringAsFixed(0)} via $_selectedPayment has been accepted. Delivery to Rajshahi in 25-30 mins.',
                              style: const TextStyle(color: Color(0xFFCBD5E1)),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.cartItems.clear();
                                  });
                                  widget.onUpdateCart();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('Back to Dashboard'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle, size: 22),
                      label: Text(
                        'Place Order (Tk ${_total.toStringAsFixed(0)})',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// ======================================================
// POPULATED MENU SCREEN: LIKED ITEMS SCREEN
// ======================================================

class LikedItemsScreen extends StatelessWidget {
  final Set<FoodItem> likedItems;
  final Function(FoodItem) onToggleLike;

  const LikedItemsScreen({super.key, required this.likedItems, required this.onToggleLike});

  @override
  Widget build(BuildContext context) {
    final foodsList = likedItems.toList();

    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('Liked Items'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: foodsList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.favorite_border_rounded, size: 70, color: Color(0xFFEC4899)),
                  SizedBox(height: 16),
                  Text(
                    'No Liked Items Yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tap the ❤️ icon on any food card to add it here!',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: foodsList.length,
                itemBuilder: (context, index) {
                  final food = foodsList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF141632),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF282B56)),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          food.imageUrl,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 55,
                            height: 55,
                            color: const Color(0xFF232650),
                            child: Icon(food.icon, color: const Color(0xFFA5B4FC)),
                          ),
                        ),
                      ),
                      title: Text(
                        food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'Tk ${food.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Color(0xFF818CF8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.star_rounded, size: 16, color: Color(0xFFF59E0B)),
                          const SizedBox(width: 3),
                          Text(
                            '${food.rating}',
                            style: const TextStyle(
                              color: Color(0xFFCBD5E1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: Color(0xFFEC4899)),
                        onPressed: () => onToggleLike(food),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

// ======================================================
// POPULATED MENU SCREEN: ALL ORDERS SCREEN
// ======================================================

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String _selectedFilter = 'All';

  static const List<OrderItem> _allOrdersList = [
    OrderItem(
      id: '#1001',
      food: 'Japanese Noodles',
      status: 'Delivered',
      amount: 250,
      time: '10:30 AM',
    ),
    OrderItem(
      id: '#1002',
      food: 'Chicken Shawarma',
      status: 'Preparing',
      amount: 200,
      time: '11:15 AM',
    ),
    OrderItem(
      id: '#1003',
      food: 'Gourmet Burger',
      status: 'Delivered',
      amount: 280,
      time: '11:45 AM',
    ),
    OrderItem(
      id: '#1004',
      food: 'Royal Biryani',
      status: 'Cancelled',
      amount: 380,
      time: '12:10 PM',
    ),
    OrderItem(
      id: '#1005',
      food: 'Paneer Tikka Roll',
      status: 'Preparing',
      amount: 229,
      time: '12:35 PM',
    ),
    OrderItem(
      id: '#1006',
      food: 'Cheesy Pizza',
      status: 'Delivered',
      amount: 350,
      time: '01:05 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _allOrdersList.where((o) {
      if (_selectedFilter == 'All') return true;
      return o.status.toLowerCase() == _selectedFilter.toLowerCase();
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('All Customer Orders'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: ['All', 'Delivered', 'Preparing', 'Cancelled'].map((filter) {
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: isSelected,
                    selectedColor: const Color(0xFF4F46E5),
                    backgroundColor: const Color(0xFF141632),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      }
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        'No $_selectedFilter orders found.',
                        style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final order = filtered[index];
                        final statusColor = order.status == 'Delivered'
                            ? const Color(0xFF34D399)
                            : (order.status == 'Preparing'
                                  ? const Color(0xFFFBBF24)
                                  : const Color(0xFFF87171));

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF141632),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF282B56)),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xFF21244E),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Color(0xFFA5B4FC),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              'Order ${order.id} - ${order.food}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Time: ${order.time}',
                              style: const TextStyle(color: Color(0xFF94A3B8)),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Tk ${order.amount.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    color: Color(0xFF818CF8),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  order.status,
                                  style: TextStyle(
                                    color: statusColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (context) => OrderDetailsScreen(order: order),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// POPULATED MENU SCREEN: OFFERS SCREEN (TASK 3)
// ======================================================

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  static const List<OfferItem> _offers = [
    OfferItem(
      title: '30% OFF Gourmet Burgers',
      description: 'Get 30% instant discount on all gourmet burger combos.',
      code: 'BURGER30',
      discount: '30% OFF',
      validUntil: 'Valid till 05 Sep',
      badgeColor: Color(0xFF4F46E5),
    ),
    OfferItem(
      title: 'Buy 2 Get 1 Free Tacos',
      description: 'Order any 2 tacos and get 1 chicken taco absolutely free!',
      code: 'TACOFREE',
      discount: 'Buy 2 Get 1',
      validUntil: 'Valid till 07 Sep',
      badgeColor: Color(0xFFEC4899),
    ),
    OfferItem(
      title: 'Free Delivery on Orders Above Tk 500',
      description: 'Enjoy zero delivery charges across Rajshahi on minimum orders.',
      code: 'FREEDEL',
      discount: 'FREE DEL',
      validUntil: 'Valid till 10 Sep',
      badgeColor: Color(0xFF10B981),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('Promotions & Offers'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _offers.length,
          itemBuilder: (context, index) {
            final offer = _offers[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF141632), Color(0xFF1C1E42)]),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF282B56)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: offer.badgeColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          offer.discount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        offer.validUntil,
                        style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    offer.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    offer.description,
                    style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF21244E),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFF4338CA)),
                        ),
                        child: Text(
                          'Code: ${offer.code}',
                          style: const TextStyle(
                            color: Color(0xFFA5B4FC),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Promo code ${offer.code} copied!'),
                              backgroundColor: const Color(0xFF4F46E5),
                            ),
                          );
                        },
                        child: const Text('Claim Offer'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ======================================================
// POPULATED MENU SCREEN: SETTINGS SCREEN
// ======================================================

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _autoAccept = false;
  bool _darkModeSync = true;
  bool _soundEffects = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: const Text('Dashboard Settings'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF141632),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF282B56)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF21244E),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.storefront_rounded, color: Color(0xFF818CF8), size: 32),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Unit Kitchen (Rajshahi)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Delivery Radius: 10 KM • Active',
                        style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Preferences & Toggles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF141632),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF282B56)),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    activeThumbColor: const Color(0xFF6366F1),
                    title: const Text('Push Notifications', style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                      'Receive new order alerts in real-time',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    value: _notifications,
                    onChanged: (val) => setState(() => _notifications = val),
                  ),
                  const Divider(color: Color(0xFF282B56), height: 1),
                  SwitchListTile(
                    activeThumbColor: const Color(0xFF6366F1),
                    title: const Text('Auto-Accept Orders', style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                      'Automatically accept incoming orders',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    value: _autoAccept,
                    onChanged: (val) => setState(() => _autoAccept = val),
                  ),
                  const Divider(color: Color(0xFF282B56), height: 1),
                  SwitchListTile(
                    activeThumbColor: const Color(0xFF6366F1),
                    title: const Text('Dark Mode Sync', style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                      'Match system dark theme settings',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    value: _darkModeSync,
                    onChanged: (val) => setState(() => _darkModeSync = val),
                  ),
                  const Divider(color: Color(0xFF282B56), height: 1),
                  SwitchListTile(
                    activeThumbColor: const Color(0xFF6366F1),
                    title: const Text('Sound Effects', style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                      'Play chime sound on new order alert',
                      style: TextStyle(color: Color(0xFF94A3B8)),
                    ),
                    value: _soundEffects,
                    onChanged: (val) => setState(() => _soundEffects = val),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings saved successfully!'),
                      backgroundColor: Color(0xFF4F46E5),
                    ),
                  );
                },
                child: const Text(
                  'Save Settings',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// TASK 5: AMBIENT STATISTICAL CARDS
// ======================================================

class StatCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({super.key, required this.title, required this.value, required this.icon});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF141632),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? const Color(0xFF6366F1) : const Color(0xFF242750),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? const Color(0x406366F1) : const Color(0x1A000000),
              blurRadius: _isHovered ? 20 : 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _isHovered
                      ? const [Color(0xFF4F46E5), Color(0xFF7C3AED)]
                      : const [Color(0xFF312E81), Color(0xFF4338CA)],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(widget.icon, size: 24, color: Colors.white),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
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

// ======================================================
// UNIQUE MENU LOOKS (GRID VIEW, LIST VIEW, SHOWCASE CAROUSEL)
// ======================================================

class FoodGrid extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final String searchQuery;
  final String selectedCategory;
  final String viewMode; // 'grid', 'list', 'showcase'
  final Set<FoodItem> likedItems;
  final Function(FoodItem) onToggleLike;
  final Function(FoodItem) onAddToCart;

  const FoodGrid({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.searchQuery,
    required this.selectedCategory,
    required this.viewMode,
    required this.likedItems,
    required this.onToggleLike,
    required this.onAddToCart,
  });

  static const List<FoodItem> _allFoods = [
    FoodItem(
      id: '1',
      name: 'Japanese Noodles',
      category: 'Noodles',
      price: 250,
      rating: 4.8,
      icon: Icons.ramen_dining_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=500&q=80',
      description: 'Thick handmade udon in a rich miso broth with fresh veggies & soft egg.',
    ),
    FoodItem(
      id: '2',
      name: 'Chicken Shawarma',
      category: 'Shawarma',
      price: 200,
      rating: 4.6,
      icon: Icons.kebab_dining_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?auto=format&fit=crop&w=500&q=80',
      description: 'Slow-roasted spiced chicken wrapped in fluffy pita with garlic sauce.',
    ),
    FoodItem(
      id: '3',
      name: 'Gourmet Burger',
      category: 'Burgers',
      price: 280,
      rating: 4.7,
      icon: Icons.lunch_dining_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
      description: 'Juicy smash patty layered with cheddar cheese, caramelized onions & sauce.',
    ),
    FoodItem(
      id: '4',
      name: 'Cheesy Pizza',
      category: 'Pizza',
      price: 350,
      rating: 4.9,
      icon: Icons.local_pizza_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=500&q=80',
      description: 'Hand-tossed crust overloaded with mozzarella, parmesan and fresh oregano.',
    ),
    FoodItem(
      id: '5',
      name: 'Mexican Tacos',
      category: 'Mexican',
      price: 220,
      rating: 4.4,
      icon: Icons.bakery_dining_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?auto=format&fit=crop&w=500&q=80',
      description: 'Crispy corn shells stuffed with seasoned meats, salsa and cilantro.',
    ),
    FoodItem(
      id: '6',
      name: 'Royal Biryani',
      category: 'Rice',
      price: 380,
      rating: 4.9,
      icon: Icons.rice_bowl_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=500&q=80',
      description: 'Aromatic basmati rice layered with saffron, spices and tender meat.',
    ),
    FoodItem(
      id: '7',
      name: 'Paneer Tikka Roll',
      category: 'Shawarma',
      price: 229,
      rating: 4.7,
      icon: Icons.kebab_dining_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1626777552726-4a6b54c97e46?auto=format&fit=crop&w=500&q=80',
      description: 'Charred tandoori paneer cubes wrapped in layered paratha with mint chutney.',
    ),
    FoodItem(
      id: '8',
      name: 'Extra Cheese Paneer Tandoori Pizza',
      category: 'Pizza',
      price: 399,
      rating: 4.9,
      icon: Icons.local_pizza_rounded,
      imageUrl:
          'https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?auto=format&fit=crop&w=500&q=80',
      description: 'Smoky tandoori paneer chunks with double cheese and capsicum.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredFoods = _allFoods.where((food) {
      bool matchesSearch = food.name.toLowerCase().contains(searchQuery.toLowerCase());
      bool matchesCategory =
          selectedCategory == 'All' ||
          food.category.toLowerCase() == selectedCategory.toLowerCase();
      return matchesSearch && matchesCategory;
    }).toList();

    if (filteredFoods.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF141632),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF282B56)),
        ),
        child: Column(
          children: const [
            Icon(Icons.search_off_rounded, size: 56, color: Color(0xFF818CF8)),
            SizedBox(height: 12),
            Text(
              'No food available',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 6),
            Text(
              'We couldn\'t find any items matching your filter.',
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
            ),
          ],
        ),
      );
    }

    // UNIQUE MENU LOOK 1: COMPACT LIST VIEW
    if (viewMode == 'list') {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredFoods.length,
        itemBuilder: (context, index) {
          final food = filteredFoods[index];
          final isLiked = likedItems.contains(food);
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF141632),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF282B56)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(food.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(
                food.name,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                food.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tk ${food.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Color(0xFF818CF8),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFEC4899),
                    ),
                    onPressed: () => onToggleLike(food),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F46E5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                    ),
                    onPressed: () => onAddToCart(food),
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    // UNIQUE MENU LOOK 2: FEATURED SHOWCASE CAROUSEL/CARDS
    if (viewMode == 'showcase') {
      return SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filteredFoods.length,
          itemBuilder: (context, index) {
            final food = filteredFoods[index];
            return Container(
              width: 240,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1E1C4B), Color(0xFF141632)]),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFF4338CA)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(21)),
                    child: Image.network(
                      food.imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Color(0xFFCBD5E1), fontSize: 12),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tk ${food.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Color(0xFF818CF8),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4F46E5),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () => onAddToCart(food),
                              child: const Text('Order'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    // DEFAULT MENU LOOK: GRID VIEW (TASK 14)
    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredFoods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: isMobile ? 0.70 : 0.78,
      ),
      itemBuilder: (context, index) {
        final food = filteredFoods[index];
        final isLiked = likedItems.contains(food);
        return FoodCard(
          food: food,
          isLiked: isLiked,
          onToggleLike: () => onToggleLike(food),
          onAddToCart: () => onAddToCart(food),
        );
      },
    );
  }
}

// ======================================================
// ANIMATED HOVER FOOD CARD (TASK 7, 8, 15 & HEART LIKED TOGGLE)
// ======================================================

class FoodCard extends StatefulWidget {
  final FoodItem food;
  final bool isLiked;
  final VoidCallback onToggleLike;
  final VoidCallback onAddToCart;

  const FoodCard({
    super.key,
    required this.food,
    required this.isLiked,
    required this.onToggleLike,
    required this.onAddToCart,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF141632), Color(0xFF1C1E42)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? const Color(0x406366F1) : const Color(0x20000000),
              blurRadius: _isHovered ? 20 : 16,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: _isHovered ? const Color(0xFF6366F1) : const Color(0xFF282B56),
            width: _isHovered ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(21)),
                  child: AspectRatio(
                    aspectRatio: 1.4,
                    child: AnimatedScale(
                      scale: _isHovered ? 1.06 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: Image.network(
                        widget.food.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: const Color(0xFF232650),
                          child: Center(
                            child: Icon(widget.food.icon, size: 36, color: const Color(0xFFA5B4FC)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.75),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star_rounded, size: 14, color: Color(0xFFF59E0B)),
                        const SizedBox(width: 3),
                        Text(
                          '${widget.food.rating}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 6,
                  right: 6,
                  child: Material(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: widget.onToggleLike,
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: AnimatedScale(
                          scale: widget.isLiked ? 1.2 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            widget.isLiked ? Icons.favorite : Icons.favorite_border_rounded,
                            size: 18,
                            color: widget.isLiked ? const Color(0xFFEC4899) : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.food.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Tk ${widget.food.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Color(0xFF818CF8),
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: widget.onAddToCart,
                          borderRadius: BorderRadius.circular(8),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: _isHovered
                                  ? [const BoxShadow(color: Color(0x604F46E5), blurRadius: 8)]
                                  : null,
                            ),
                            child: const Text(
                              'Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
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

// ======================================================
// TASK 9, TASK 10, TASK 16: RECENT ORDERS LIST
// ======================================================

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  static const List<OrderItem> _orders = [
    OrderItem(
      id: '#1001',
      food: 'Japanese Noodles',
      status: 'Delivered',
      amount: 250,
      time: '10:30 AM',
    ),
    OrderItem(
      id: '#1002',
      food: 'Chicken Shawarma',
      status: 'Preparing',
      amount: 200,
      time: '11:15 AM',
    ),
    OrderItem(
      id: '#1003',
      food: 'Gourmet Burger',
      status: 'Delivered',
      amount: 280,
      time: '11:45 AM',
    ),
    OrderItem(
      id: '#1004',
      food: 'Royal Biryani',
      status: 'Cancelled',
      amount: 380,
      time: '12:10 PM',
    ),
    OrderItem(
      id: '#1005',
      food: 'Paneer Tikka Roll',
      status: 'Preparing',
      amount: 229,
      time: '12:35 PM',
    ),
    OrderItem(
      id: '#1006',
      food: 'Cheesy Pizza',
      status: 'Delivered',
      amount: 350,
      time: '01:05 PM',
    ),
  ];

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF34D399);
      case 'preparing':
        return const Color(0xFFFBBF24);
      case 'cancelled':
        return const Color(0xFFF87171);
      default:
        return Colors.grey;
    }
  }

  Color _getStatusBg(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF064E3B);
      case 'preparing':
        return const Color(0xFF78350F);
      case 'cancelled':
        return const Color(0xFF7F1D1D);
      default:
        return const Color(0xFF1E204A);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        final statusColor = _getStatusColor(order.status);
        final statusBg = _getStatusBg(order.status);

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Material(
            color: const Color(0xFF141632),
            borderRadius: BorderRadius.circular(18),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFF242750)),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                leading: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFF21244E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Color(0xFFA5B4FC), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                title: Text(
                  'Order ${order.id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  order.food,
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                ),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(builder: (context) => OrderDetailsScreen(order: order)),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// ======================================================
// TASK 18 & MAIN DASHBOARD CONTENT (VIEW MODE SWITCHER INCLUDED)
// ======================================================

class DashboardContent extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final Set<FoodItem> likedItems;
  final List<CartItem> cartItems;
  final Function(FoodItem) onToggleLike;
  final Function(FoodItem) onAddToCart;
  final VoidCallback onUpdateCart;

  const DashboardContent({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
    required this.likedItems,
    required this.cartItems,
    required this.onToggleLike,
    required this.onAddToCart,
    required this.onUpdateCart,
  });

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _viewMode = 'grid'; // 'grid', 'list', 'showcase'

  static const List<String> _categories = [
    'All',
    'Burgers',
    'Noodles',
    'Pizza',
    'Shawarma',
    'Mexican',
    'Rice',
  ];

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good Morning!';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(widget.isMobile ? 16 : 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO BANNER
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E1C4B), Color(0xFF311B92)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(color: Color(0x30000000), blurRadius: 20, offset: Offset(0, 8)),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getGreeting(),
                          style: TextStyle(
                            fontSize: widget.isMobile ? 22 : 28,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFFA5B4FC),
                          ),
                        ),
                        const SizedBox(height: 6),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: widget.isMobile ? 20 : 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                            children: const [
                              TextSpan(text: 'Fastest '),
                              TextSpan(
                                text: 'Delivery ',
                                style: TextStyle(color: Color(0xFF818CF8)),
                              ),
                              TextSpan(text: '& Easy '),
                              TextSpan(
                                text: 'Pickup',
                                style: TextStyle(color: Color(0xFFC084FC)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Order delicious food items directly from Unit Kitchen',
                          style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  if (!widget.isMobile)
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2A2868),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.delivery_dining_rounded,
                        size: 44,
                        color: Color(0xFFA5B4FC),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // STATISTICS
            const Text(
              "Today's Overview",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 14),

            if (widget.isMobile)
              Column(
                children: const [
                  StatCard(title: 'Orders', value: '120', icon: Icons.shopping_bag_outlined),
                  SizedBox(height: 10),
                  StatCard(title: 'Customers', value: '85', icon: Icons.people_outline),
                  SizedBox(height: 10),
                  StatCard(
                    title: 'Pending Orders',
                    value: '18',
                    icon: Icons.pending_actions_outlined,
                  ),
                  SizedBox(height: 10),
                  StatCard(title: 'Revenue', value: 'Tk 25K', icon: Icons.currency_rupee_rounded),
                ],
              )
            else
              Row(
                children: [
                  const Expanded(
                    child: StatCard(
                      title: 'Orders',
                      value: '120',
                      icon: Icons.shopping_bag_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: StatCard(title: 'Customers', value: '85', icon: Icons.people_outline),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: StatCard(
                      title: 'Pending Orders',
                      value: '18',
                      icon: Icons.pending_actions_outlined,
                    ),
                  ),
                  if (widget.isDesktop) ...[
                    const SizedBox(width: 12),
                    const Expanded(
                      child: StatCard(
                        title: 'Revenue',
                        value: 'Tk 25K',
                        icon: Icons.currency_rupee_rounded,
                      ),
                    ),
                  ],
                ],
              ),

            const SizedBox(height: 32),

            // FEATURED ITEMS & VIEW MODE SWITCHER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Featured Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),

                // UNIQUE WAYS TO LOOK AT MENUS SWITCHER
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141632),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF282B56)),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(6),
                        icon: Icon(
                          Icons.grid_view_rounded,
                          size: 18,
                          color: _viewMode == 'grid'
                              ? const Color(0xFF818CF8)
                              : const Color(0xFF64748B),
                        ),
                        onPressed: () => setState(() => _viewMode = 'grid'),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(6),
                        icon: Icon(
                          Icons.view_list_rounded,
                          size: 18,
                          color: _viewMode == 'list'
                              ? const Color(0xFF818CF8)
                              : const Color(0xFF64748B),
                        ),
                        onPressed: () => setState(() => _viewMode = 'list'),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.all(6),
                        icon: Icon(
                          Icons.view_carousel_rounded,
                          size: 18,
                          color: _viewMode == 'showcase'
                              ? const Color(0xFF818CF8)
                              : const Color(0xFF64748B),
                        ),
                        onPressed: () => setState(() => _viewMode = 'showcase'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Category Chips Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: const Color(0xFF4F46E5),
                      backgroundColor: const Color(0xFF141632),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF282B56),
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 14),

            // Search Box
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF141632),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF282B56)),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Your order? (e.g. Noodles, Burger)...',
                  hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF818CF8)),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Color(0xFF94A3B8)),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.transparent,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ANIMATED & SWITCHABLE FOOD GRID/LIST/SHOWCASE
            FoodGrid(
              isMobile: widget.isMobile,
              isTablet: widget.isTablet,
              searchQuery: _searchQuery,
              selectedCategory: _selectedCategory,
              viewMode: _viewMode,
              likedItems: widget.likedItems,
              onToggleLike: widget.onToggleLike,
              onAddToCart: widget.onAddToCart,
            ),

            const SizedBox(height: 32),

            // RECENT ORDERS
            const Text(
              'Recent Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 14),

            const RecentOrders(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// TASK 16 & TASK 17: ORDER DETAILS SCREEN
// ======================================================

class OrderDetailsScreen extends StatelessWidget {
  final OrderItem order;

  const OrderDetailsScreen({super.key, required this.order});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF34D399);
      case 'preparing':
        return const Color(0xFFFBBF24);
      case 'cancelled':
        return const Color(0xFFF87171);
      default:
        return Colors.grey;
    }
  }

  Color _getStatusBg(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return const Color(0xFF064E3B);
      case 'preparing':
        return const Color(0xFF78350F);
      case 'cancelled':
        return const Color(0xFF7F1D1D);
      default:
        return const Color(0xFF1E204A);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);
    final statusBg = _getStatusBg(order.status);

    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: Text('Order ${order.id} Details'),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 450),
            decoration: BoxDecoration(
              color: const Color(0xFF141632),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF282B56)),
              boxShadow: const [
                BoxShadow(color: Color(0x30000000), blurRadius: 20, offset: Offset(0, 6)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF21244E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.receipt_long_rounded,
                      size: 48,
                      color: Color(0xFFA5B4FC),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Order ${order.id}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFF282B56)),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Food Item:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        order.food,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Time:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        order.time,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Tk ${order.amount.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF818CF8),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status:',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          order.status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F46E5),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: const Text(
                        'Go Back',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ======================================================
// GENERIC DETAIL SCREEN FOR OTHER MENU ITEMS
// ======================================================

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090A16),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF12142B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Color(0xFF1E204A), shape: BoxShape.circle),
              child: const Icon(Icons.check_circle_rounded, size: 64, color: Color(0xFF818CF8)),
            ),
            const SizedBox(height: 24),
            Text(
              '$title Screen',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
