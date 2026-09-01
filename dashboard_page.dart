import 'package:flutter/material.dart';
import 'foodapp.dart';
import 'orders_page.dart';
import 'offers_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text(
          'Parth’s Dining Sanctuary (マイハブ)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: TempleAnimatedBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Loyalty & Status Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF85191C),
                      Color(0xFFB71C1C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: JapaneseTheme.goldAccent,
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: JapaneseTheme.goldAccent),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: JapaneseTheme.goldAccent,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Parth Sahani',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'VIP Gold Member • 金会員',
                                  style: TextStyle(
                                    color: JapaneseTheme.goldAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: JapaneseTheme.goldLight,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '850 Pts',
                            style: TextStyle(
                              color: JapaneseTheme.inkBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'おいしい時間 • Delicious Moments',
                      style: TextStyle(
                        color: JapaneseTheme.goldAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'You have 4 temple discount vouchers ready to use on your next order.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Parth's Quick Actions
              Row(
                children: const [
                  Icon(Icons.touch_app_outlined, color: JapaneseTheme.toriiCrimson, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Quick Diner Actions (クイック操作)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _QuickDinerCard(
                      icon: Icons.delivery_dining,
                      title: 'Active Delivery',
                      subtitle: '1 In Kitchen',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersPage()));
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _QuickDinerCard(
                      icon: Icons.local_offer,
                      title: 'Claim Deals',
                      subtitle: '20% OFF Active',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const OffersPage()));
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Parth's Favorite Dishes
              Row(
                children: const [
                  Icon(Icons.favorite, color: JapaneseTheme.toriiCrimson, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Parth’s Favorite Bowls (お気に入り)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _FavoriteDishTile(
                name: 'Special Tonkotsu Ramen (特製豚骨ラーメン)',
                price: '₹249',
                rating: '4.8 ★',
                imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=400&auto=format&fit=crop&q=80',
              ),

              const SizedBox(height: 10),

              _FavoriteDishTile(
                name: 'Fresh Nigiri & Maki Sushi (寿司盛り合わせ)',
                price: '₹299',
                rating: '4.9 ★',
                imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400&auto=format&fit=crop&q=80',
              ),

              const SizedBox(height: 10),

              _FavoriteDishTile(
                name: 'Matcha Green Tea Parfait (抹茶パフェ)',
                price: '₹179',
                rating: '4.7 ★',
                imageUrl: 'https://images.unsplash.com/photo-1505253758473-96b7015fcd40?w=400&auto=format&fit=crop&q=80',
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickDinerCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickDinerCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: JapaneseTheme.borderLight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: JapaneseTheme.vermilionLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: JapaneseTheme.toriiCrimson,
                size: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: JapaneseTheme.inkBlack,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              subtitle,
              style: const TextStyle(
                color: JapaneseTheme.stoneGrey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteDishTile extends StatelessWidget {
  final String name;
  final String price;
  final String rating;
  final String imageUrl;

  const _FavoriteDishTile({
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: JapaneseTheme.borderLight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: 58,
            height: 58,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 58,
              height: 58,
              color: JapaneseTheme.vermilionLight,
              child: const Icon(Icons.restaurant, color: JapaneseTheme.toriiCrimson),
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: JapaneseTheme.inkBlack,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              price,
              style: const TextStyle(
                color: JapaneseTheme.matchaGreen,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              rating,
              style: const TextStyle(
                color: Color(0xFFC5A059),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: JapaneseTheme.toriiCrimson,
                content: Text('Re-ordered $name! (再注文完了)'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: JapaneseTheme.toriiCrimson,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Re-order', style: TextStyle(fontSize: 11)),
        ),
      ),
    );
  }
}