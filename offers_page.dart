import 'package:flutter/material.dart';
import 'foodapp.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text('Parth’s Vouchers & Rewards (特典)'),
      ),
      body: TempleAnimatedBackground(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // Temple Blessing Banner
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF85191C),
                    JapaneseTheme.toriiCrimson,
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
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: JapaneseTheme.goldAccent),
                        ),
                        child: const Icon(
                          Icons.local_offer_rounded,
                          color: JapaneseTheme.goldAccent,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Parth’s Temple Rewards (今日の特典)',
                        style: TextStyle(
                          color: JapaneseTheme.goldAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    '850 Loyalty Points Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Redeem your reward coupons directly on your next Japanese feast.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: const [
                Icon(Icons.confirmation_num_outlined, color: JapaneseTheme.toriiCrimson, size: 20),
                SizedBox(width: 8),
                Text(
                  'My Active Promo Coupons (マイクーポン)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            const _OfferCard(
              icon: Icons.percent,
              title: '20% OFF (2割引)',
              subtitle: 'Valid on Ramen & Bento orders above ₹499',
              code: 'PARTH20',
            ),

            const _OfferCard(
              icon: Icons.delivery_dining,
              title: 'FREE EXPRESS DELIVERY (送料無料)',
              subtitle: 'VIP perk for Gold Member Parth',
              code: 'PARTHFREE',
            ),

            const _OfferCard(
              icon: Icons.icecream,
              title: 'COMPLIMENTARY MATCHA DESSERT',
              subtitle: 'Free Kyoto green tea parfait on meal orders',
              code: 'SWEETPARTH',
            ),

            const _OfferCard(
              icon: Icons.currency_rupee,
              title: '₹100 WEEKEND BLESSING',
              subtitle: 'Instant discount on orders above ₹399',
              code: 'ZEN100',
            ),

            const SizedBox(height: 12),

            // Omikuji Fortune Gift Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: JapaneseTheme.goldLight,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: JapaneseTheme.goldAccent,
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: JapaneseTheme.toriiCrimson,
                    size: 32,
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daily Omikuji Fortune (おみくじ)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: JapaneseTheme.inkBlack,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Tap to draw today’s dining blessing and surprise bonus points!',
                          style: TextStyle(
                            color: JapaneseTheme.stoneGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: JapaneseTheme.toriiCrimson,
                          content: Text('🥠 大吉 (Great Blessing!): +50 Points added to Parth’s account!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JapaneseTheme.toriiCrimson,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Draw', style: TextStyle(fontSize: 12)),
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

class _OfferCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String code;

  const _OfferCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: JapaneseTheme.borderLight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: JapaneseTheme.vermilionLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: JapaneseTheme.toriiCrimson.withValues(alpha: 0.2)),
            ),
            child: Icon(
              icon,
              color: JapaneseTheme.toriiCrimson,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.toriiCrimson,
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
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: JapaneseTheme.goldLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Code: $code',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: JapaneseTheme.inkBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: JapaneseTheme.toriiCrimson,
                  content: Text('Voucher $code applied to Parth’s order! (適用完了)'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: JapaneseTheme.toriiCrimson,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}