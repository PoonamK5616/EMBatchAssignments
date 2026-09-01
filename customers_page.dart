import 'package:flutter/material.dart';
import 'foodapp.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodieReviews = [
      {
        'name': 'Kenji Sato',
        'dish': 'Tonkotsu Ramen',
        'comment': 'The slow-simmered broth has an authentic Tokyo flavor! Best ramen in town.',
        'rating': '5.0 ★',
        'tier': 'Foodie Elite',
      },
      {
        'name': 'Aarav & Priya',
        'dish': 'Salmon Nigiri Set',
        'comment': 'Fresh fish and perfect sushi rice texture. Super fast delivery!',
        'rating': '4.9 ★',
        'tier': 'Gold Diner',
      },
      {
        'name': 'Meera Patel',
        'dish': 'Matcha Parfait',
        'comment': 'Not overly sweet, genuine Uji matcha bitterness and sweetness.',
        'rating': '4.8 ★',
        'tier': 'Sweet Lover',
      },
    ];

    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text('食の絆 • Foodies Club & Community'),
      ),
      body: TempleAnimatedBackground(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // Parth's Club Tier Card
            Container(
              padding: const EdgeInsets.all(22),
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
                          Icons.military_tech_rounded,
                          color: JapaneseTheme.goldAccent,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Parth’s VIP Club Lounge (金会員)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Level 3 Foodie • 850 / 1000 Pts to Platinum',
                              style: TextStyle(
                                color: JapaneseTheme.goldAccent,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.85,
                      backgroundColor: Colors.black26,
                      color: JapaneseTheme.goldAccent,
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Exclusive Perk: Free green tea & 10% bonus points on all dinner orders!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Refer a friend
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: JapaneseTheme.goldLight,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: JapaneseTheme.goldAccent),
              ),
              child: Row(
                children: [
                  const Icon(Icons.share, color: JapaneseTheme.toriiCrimson, size: 28),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Invite Foodie Friends',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: JapaneseTheme.inkBlack,
                          ),
                        ),
                        Text(
                          'Give ₹100, Get ₹100 on their first Japanese bowl order.',
                          style: TextStyle(fontSize: 12, color: JapaneseTheme.stoneGrey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: JapaneseTheme.toriiCrimson,
                          content: Text('Referral invite link copied to clipboard!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: JapaneseTheme.toriiCrimson,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Share', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: const [
                Icon(Icons.reviews_outlined, color: JapaneseTheme.toriiCrimson, size: 20),
                SizedBox(width: 8),
                Text(
                  'Community Reviews & Taste Log (口コミ)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ...foodieReviews.map(
              (rev) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(14),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: JapaneseTheme.vermilionLight,
                              child: Text(
                                rev['name']![0],
                                style: const TextStyle(
                                  color: JapaneseTheme.toriiCrimson,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rev['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: JapaneseTheme.inkBlack,
                                  ),
                                ),
                                Text(
                                  rev['dish']!,
                                  style: const TextStyle(
                                    color: JapaneseTheme.stoneGrey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          rev['rating']!,
                          style: const TextStyle(
                            color: Color(0xFFC5A059),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '“${rev['comment']}”',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: JapaneseTheme.inkBlack,
                      ),
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