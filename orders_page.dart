import 'package:flutter/material.dart';
import 'foodapp.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final parthOrders = [
      {
        'id': '#JP1002',
        'food': 'Custom Bento Combo (Tonkotsu Ramen + Takoyaki + Matcha Parfait)',
        'status': 'Preparing',
        'jpStatus': '調理中',
        'mode': 'Dine In • Table 04 (Tatami Garden)',
        'time': 'Today, 1:15 PM',
        'price': '₹486',
        'savings': 'Saved ₹121 (20% Combo)',
        'imageUrl': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=200&auto=format&fit=crop&q=80',
        'isLive': true,
      },
      {
        'id': '#JP1001',
        'food': 'Chicken Katsu Curry Don + Ramune Soda',
        'status': 'Delivered',
        'jpStatus': '配達完了',
        'mode': 'Delivery • Flat 402, Sakura Residency',
        'time': 'Yesterday, 8:30 PM',
        'price': '₹388',
        'savings': null,
        'imageUrl': 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=200&auto=format&fit=crop&q=80',
        'isLive': false,
      },
      {
        'id': '#JP0998',
        'food': 'Premium Salmon Nigiri Set + Gyoza',
        'status': 'Delivered',
        'jpStatus': '受取完了',
        'mode': 'Take Away • Express Pickup (In 15 Mins)',
        'time': '28 Aug, 7:45 PM',
        'price': '₹458',
        'savings': null,
        'imageUrl': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=200&auto=format&fit=crop&q=80',
        'isLive': false,
      },
      {
        'id': '#JP0984',
        'food': 'Dragon Roll (Eel & Avocado) + Hojicha Latte',
        'status': 'Delivered',
        'jpStatus': '配達完了',
        'mode': 'Delivery • Flat 402, Sakura Residency',
        'time': '25 Aug, 1:00 PM',
        'price': '₹468',
        'savings': null,
        'imageUrl': 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=200&auto=format&fit=crop&q=80',
        'isLive': false,
      },
    ];

    final currentModeLabel = CurrentOrderState.selectedMode == DiningMode.dineIn
        ? 'Dine In (${CurrentOrderState.tableNumber})'
        : CurrentOrderState.selectedMode == DiningMode.takeAway
            ? 'Take Away (${CurrentOrderState.pickupTime})'
            : 'Delivery (${CurrentOrderState.deliveryAddress})';

    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text('Parth’s Orders & Receipts (注文履歴)'),
      ),
      body: TempleAnimatedBackground(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // Live order progress tracking card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.96),
                borderRadius: BorderRadius.circular(20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: JapaneseTheme.vermilionLight,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.restaurant_rounded,
                              color: JapaneseTheme.toriiCrimson,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Active Order Status (進行中)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
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
                          'In Kitchen (15 min ETA)',
                          style: TextStyle(
                            color: Color(0xFFD97706),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Order #JP1002 • Custom Bento Combo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: JapaneseTheme.toriiCrimson,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.pin_drop, size: 14, color: JapaneseTheme.stoneGrey),
                      const SizedBox(width: 4),
                      Text(
                        currentModeLabel,
                        style: const TextStyle(
                          color: JapaneseTheme.stoneGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Progress Steps
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStep(label: 'Order Sent', isDone: true),
                      _buildLine(isDone: true),
                      _buildStep(label: 'Kitchen Prep', isDone: true),
                      _buildLine(isDone: false),
                      _buildStep(
                        label: CurrentOrderState.selectedMode == DiningMode.dineIn ? 'To Table' : 'Ready',
                        isDone: false,
                      ),
                      _buildLine(isDone: false),
                      _buildStep(label: 'Enjoy Meal', isDone: false),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: const [
                Icon(Icons.history_edu, color: JapaneseTheme.toriiCrimson, size: 20),
                SizedBox(width: 8),
                Text(
                  'Your Order Receipts (過去のご注文)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ...parthOrders.map(
              (order) => _UserOrderCard(order: order),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStep({required String label, required bool isDone}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isDone ? JapaneseTheme.toriiCrimson : const Color(0xFFEADBCE),
          child: Icon(
            isDone ? Icons.check : Icons.circle,
            size: 12,
            color: isDone ? Colors.white : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isDone ? FontWeight.bold : FontWeight.normal,
            color: isDone ? JapaneseTheme.inkBlack : JapaneseTheme.stoneGrey,
          ),
        ),
      ],
    );
  }

  static Widget _buildLine({required bool isDone}) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 14),
        color: isDone ? JapaneseTheme.toriiCrimson : const Color(0xFFEADBCE),
      ),
    );
  }
}

class _UserOrderCard extends StatelessWidget {
  final Map<String, dynamic> order;

  const _UserOrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    final bool isDelivered = order['status'] == 'Delivered';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            order['imageUrl'] as String,
            width: 55,
            height: 55,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 55,
              height: 55,
              color: JapaneseTheme.vermilionLight,
              child: const Icon(Icons.receipt_long, color: JapaneseTheme.toriiCrimson),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order['id'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: JapaneseTheme.inkBlack,
              ),
            ),
            Text(
              order['price'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: JapaneseTheme.matchaGreen,
                fontSize: 14,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              order['food'] as String,
              style: const TextStyle(color: JapaneseTheme.stoneGrey, fontSize: 12),
            ),
            if (order['savings'] != null) ...[
              const SizedBox(height: 2),
              Text(
                order['savings'] as String,
                style: const TextStyle(
                  color: JapaneseTheme.matchaGreen,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            const SizedBox(height: 4),
            Text(
              order['mode'] as String,
              style: const TextStyle(
                color: JapaneseTheme.toriiCrimson,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order['time'] as String,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isDelivered ? JapaneseTheme.matchaLight : const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${order['status']} • ${order['jpStatus']}',
                    style: TextStyle(
                      color: isDelivered ? JapaneseTheme.matchaGreen : const Color(0xFFD97706),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: JapaneseTheme.toriiCrimson,
              content: Text('Viewing receipt for ${order['id']} (${order['mode']})'),
            ),
          );
        },
      ),
    );
  }
}