import 'package:flutter/material.dart';

const String kAppName = 'Bite';

/// KitKat-style crimson used across the app.
const Color kZomatoRed = Color(0xFFD52B1E);
const Color kZomatoGreen = Color(0xFF2E7D32);
const Color kPageBg = Color(0xFFF7F4F2);
const Color kBrandSoft = Color(0xFFFFE8E4);
const Color kLine = Color(0xFFE8E0DC);

bool isPhone(BuildContext context) => MediaQuery.sizeOf(context).width < 700;
bool isWide(BuildContext context) => MediaQuery.sizeOf(context).width >= 1024;

EdgeInsets pagePadding(BuildContext context, {double bottom = 28}) {
  final width = MediaQuery.sizeOf(context).width;
  final side = width >= 1024 ? 28.0 : width >= 700 ? 20.0 : 16.0;
  return EdgeInsets.fromLTRB(side, 16, side, bottom);
}

double pageMaxWidth(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width >= 1400) return 1320;
  if (width >= 1024) return 1180;
  return width;
}

Widget pageShell({
  required BuildContext context,
  required Widget child,
  double? maxWidth,
  EdgeInsets? padding,
}) {
  return SizedBox.expand(
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth ?? pageMaxWidth(context)),
        child: Padding(
          padding: padding ?? pagePadding(context),
          child: child,
        ),
      ),
    ),
  );
}

class BiteLogo extends StatelessWidget {
  final double size;
  final bool inverted;

  const BiteLogo({super.key, this.size = 32, this.inverted = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _BiteLogoPainter(inverted: inverted)),
    );
  }
}

class _BiteLogoPainter extends CustomPainter {
  final bool inverted;

  _BiteLogoPainter({this.inverted = false});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width * 0.26;
    final body = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    canvas.drawRRect(
      body,
      Paint()..color = inverted ? Colors.white : kZomatoRed,
    );

    final cut = Paint()..color = inverted ? kZomatoRed : Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.12),
      size.width * 0.26,
      cut,
    );

    final fork = Paint()
      ..color = inverted ? kZomatoRed : Colors.white
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final cx = size.width * 0.46;
    final top = size.height * 0.28;
    final gap = size.width * 0.11;
    for (var i = -1; i <= 1; i++) {
      canvas.drawLine(
        Offset(cx + i * gap, top),
        Offset(cx + i * gap, top + size.height * 0.2),
        fork,
      );
    }
    canvas.drawLine(
      Offset(cx - gap, top + size.height * 0.2),
      Offset(cx + gap, top + size.height * 0.2),
      fork,
    );
    canvas.drawLine(
      Offset(cx, top + size.height * 0.2),
      Offset(cx, size.height * 0.74),
      fork,
    );
  }

  @override
  bool shouldRepaint(covariant _BiteLogoPainter oldDelegate) =>
      oldDelegate.inverted != inverted;
}

class BrandMark extends StatelessWidget {
  final bool compact;
  final Color? color;

  const BrandMark({super.key, this.compact = false, this.color});

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? kZomatoRed;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BiteLogo(size: compact ? 28 : 32),
        SizedBox(width: compact ? 8 : 10),
        Text(
          kAppName,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: compact ? 20 : 22,
            color: textColor,
            letterSpacing: -0.6,
            height: 1,
          ),
        ),
      ],
    );
  }
}

InputDecoration biteField({
  required String hint,
  Widget? prefix,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
    prefixIcon: prefix,
    suffixIcon: suffix,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kLine),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kLine),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: kZomatoRed, width: 1.6),
    ),
  );
}

int _levenshtein(String a, String b) {
  if (a == b) return 0;
  if (a.isEmpty) return b.length;
  if (b.isEmpty) return a.length;
  final rows = List.generate(
    a.length + 1,
    (i) => List<int>.filled(b.length + 1, 0),
  );
  for (var i = 0; i <= a.length; i++) {
    rows[i][0] = i;
  }
  for (var j = 0; j <= b.length; j++) {
    rows[0][j] = j;
  }
  for (var i = 1; i <= a.length; i++) {
    for (var j = 1; j <= b.length; j++) {
      final cost = a[i - 1] == b[j - 1] ? 0 : 1;
      final deletion = rows[i - 1][j] + 1;
      final insertion = rows[i][j - 1] + 1;
      final substitution = rows[i - 1][j - 1] + cost;
      rows[i][j] = deletion < insertion
          ? (deletion < substitution ? deletion : substitution)
          : (insertion < substitution ? insertion : substitution);
    }
  }
  return rows[a.length][b.length];
}

bool matchesQuery(String source, String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return true;
  final s = source.toLowerCase();
  if (s.contains(q)) return true;
  final qTokens = q.split(RegExp(r'\s+')).where((token) => token.length >= 2);
  final sTokens = s.split(RegExp(r'\s+'));
  return qTokens.every((token) {
    if (s.contains(token)) return true;
    return sTokens.any((word) => _levenshtein(word, token) <= 2);
  });
}

// ============================================================
// FOOD MODEL
// ============================================================

class Food {
  final String name;
  final String price;
  final IconData icon;
  final double rating;
  final String image;
  final String restaurant;
  final String description;
  final List<String> ingredients;
  final String? offer;

  Food({
    required this.name,
    required this.price,
    required this.icon,
    required this.rating,
    required this.image,
    required this.restaurant,
    required this.description,
    required this.ingredients,
    this.offer,
  });

  int get priceValue =>
      int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

  bool get hasOffer => offer != null && offer!.trim().isNotEmpty;

  int discountedTotal(int quantity) {
    final label = offer?.toUpperCase() ?? '';
    if (label.contains('BOGO') || label.contains('BUY 1')) {
      return priceValue * (quantity / 2).ceil();
    }
    var total = priceValue * quantity;
    if (label.contains('%')) {
      final pct = int.tryParse(label.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      return (total * (100 - pct) / 100).round();
    }
    if (label.contains('₹') || label.contains('OFF')) {
      final off = int.tryParse(label.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      return (total - off).clamp(0, total);
    }
    return total;
  }
}

class OfferBadge extends StatelessWidget {
  final String label;
  final bool compact;

  const OfferBadge({super.key, required this.label, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 7 : 10,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: kZomatoRed,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: compact ? 11 : 13,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class FoodOrder {
  final String id;
  final String food;
  final String status;
  final String restaurant;
  final String amount;
  final String date;
  final IconData icon;
  final String image;
  final int etaMinutes;
  final String customerId;

  const FoodOrder({
    required this.id,
    required this.food,
    required this.status,
    required this.restaurant,
    required this.amount,
    required this.date,
    required this.icon,
    required this.image,
    this.etaMinutes = 25,
    this.customerId = 'current',
  });
}

Color statusColor(String status) {
  switch (status) {
    case 'Delivered':
      return kZomatoGreen;
    case 'Preparing':
      return const Color(0xFFE67E22);
    case 'Cancelled':
      return kZomatoRed;
    default:
      return Colors.grey;
  }
}

final List<Food> kFoods = [
  // Domino's Pizza
  Food(
    name: 'Margherita Pizza',
    price: '₹299',
    icon: Icons.local_pizza_outlined,
    rating: 4.5,
    image: 'assets/images/pizza.jpg',
    restaurant: "Domino's Pizza",
    description: 'Wood-fired pizza with tomato, mozzarella and fresh basil.',
    ingredients: [
      'Pizza dough',
      'Tomato sauce',
      'Mozzarella',
      'Basil',
      'Olive oil',
    ],
    offer: '20% OFF',
  ),
  Food(
    name: 'Farmhouse Pizza',
    price: '₹349',
    icon: Icons.local_pizza_outlined,
    rating: 4.6,
    image: 'assets/images/pizza.jpg',
    restaurant: "Domino's Pizza",
    description: 'Loaded with onion, capsicum, tomato and extra cheese.',
    ingredients: [
      'Pizza dough',
      'Onion',
      'Capsicum',
      'Tomato',
      'Mozzarella',
    ],
  ),
  Food(
    name: 'Garlic Breadsticks',
    price: '₹129',
    icon: Icons.bakery_dining_outlined,
    rating: 4.3,
    image: 'assets/images/sandwich.jpg',
    restaurant: "Domino's Pizza",
    description: 'Soft breadsticks brushed with garlic butter and herbs.',
    ingredients: ['Bread', 'Garlic', 'Butter', 'Herbs', 'Cheese'],
  ),
  // Burger King
  Food(
    name: 'Whopper Burger',
    price: '₹199',
    icon: Icons.lunch_dining_outlined,
    rating: 4.3,
    image: 'assets/images/burger.jpg',
    restaurant: 'Burger King',
    description: 'Flame-grilled patty with lettuce, tomato, onion and sauce.',
    ingredients: [
      'Sesame bun',
      'Beef patty',
      'Lettuce',
      'Tomato',
      'Onion',
      'Mayo',
    ],
    offer: 'BOGO',
  ),
  Food(
    name: 'Crispy Chicken Burger',
    price: '₹189',
    icon: Icons.lunch_dining_outlined,
    rating: 4.4,
    image: 'assets/images/burger.jpg',
    restaurant: 'Burger King',
    description: 'Crispy fried chicken fillet with spicy mayo and slaw.',
    ingredients: ['Brioche bun', 'Chicken fillet', 'Slaw', 'Spicy mayo'],
  ),
  Food(
    name: 'King Fries',
    price: '₹99',
    icon: Icons.fastfood_outlined,
    rating: 4.2,
    image: 'assets/images/sandwich.jpg',
    restaurant: 'Burger King',
    description: 'Salted fries served hot and crispy.',
    ingredients: ['Potato', 'Salt', 'Oil'],
  ),
  // Italian Corner
  Food(
    name: 'Creamy Alfredo Pasta',
    price: '₹249',
    icon: Icons.ramen_dining_outlined,
    rating: 4.6,
    image: 'assets/images/pasta.jpg',
    restaurant: 'Italian Corner',
    description: 'Fettuccine tossed in a rich parmesan cream sauce.',
    ingredients: [
      'Fettuccine',
      'Cream',
      'Parmesan',
      'Garlic',
      'Butter',
      'Parsley',
    ],
  ),
  Food(
    name: 'Penne Arrabbiata',
    price: '₹229',
    icon: Icons.ramen_dining_outlined,
    rating: 4.4,
    image: 'assets/images/pasta.jpg',
    restaurant: 'Italian Corner',
    description: 'Penne in a spicy tomato garlic sauce with chilli flakes.',
    ingredients: ['Penne', 'Tomato', 'Garlic', 'Chilli', 'Olive oil'],
    offer: '15% OFF',
  ),
  Food(
    name: 'Cheesy Garlic Bread',
    price: '₹149',
    icon: Icons.bakery_dining_outlined,
    rating: 4.5,
    image: 'assets/images/sandwich.jpg',
    restaurant: 'Italian Corner',
    description: 'Toasted baguette with molten mozzarella and garlic butter.',
    ingredients: ['Baguette', 'Mozzarella', 'Garlic', 'Butter'],
  ),
  // Fresh Bites
  Food(
    name: 'Club Sandwich',
    price: '₹179',
    icon: Icons.breakfast_dining_outlined,
    rating: 4.2,
    image: 'assets/images/sandwich.jpg',
    restaurant: 'Fresh Bites',
    description: 'Toasted sandwich stacked with veggies, cheese and sauces.',
    ingredients: [
      'Toasted bread',
      'Cheese',
      'Lettuce',
      'Tomato',
      'Cucumber',
      'Mayo',
    ],
  ),
  Food(
    name: 'Veggie Wrap',
    price: '₹159',
    icon: Icons.tapas_outlined,
    rating: 4.3,
    image: 'assets/images/sandwich.jpg',
    restaurant: 'Fresh Bites',
    description: 'Whole-wheat wrap packed with grilled veggies and hummus.',
    ingredients: ['Wrap', 'Hummus', 'Lettuce', 'Capsicum', 'Corn'],
  ),
  Food(
    name: 'Loaded Nachos',
    price: '₹169',
    icon: Icons.restaurant_outlined,
    rating: 4.1,
    image: 'assets/images/pizza.jpg',
    restaurant: 'Fresh Bites',
    description: 'Crispy nachos with salsa, cheese sauce and jalapeños.',
    ingredients: ['Nachos', 'Salsa', 'Cheese', 'Jalapeño', 'Sour cream'],
    offer: '₹40 OFF',
  ),
  // Hyderabadi House
  Food(
    name: 'Hyderabadi Biryani',
    price: '₹329',
    icon: Icons.rice_bowl_outlined,
    rating: 4.8,
    image: 'assets/images/biryani.jpg',
    restaurant: 'Hyderabadi House',
    description: 'Slow-cooked basmati rice with spices, served with raita.',
    ingredients: [
      'Basmati rice',
      'Spices',
      'Fried onions',
      'Mint',
      'Yogurt',
      'Saffron',
    ],
    offer: '₹100 OFF',
  ),
  Food(
    name: 'Chicken Dum Biryani',
    price: '₹369',
    icon: Icons.rice_bowl_outlined,
    rating: 4.7,
    image: 'assets/images/biryani.jpg',
    restaurant: 'Hyderabadi House',
    description: 'Sealed dum biryani with tender chicken and saffron rice.',
    ingredients: ['Basmati rice', 'Chicken', 'Saffron', 'Spices', 'Fried onions'],
  ),
  Food(
    name: 'Mirchi Ka Salan',
    price: '₹149',
    icon: Icons.soup_kitchen_outlined,
    rating: 4.4,
    image: 'assets/images/paneer_tikka.jpg',
    restaurant: 'Hyderabadi House',
    description: 'Classic chilli curry served as a side with biryani.',
    ingredients: ['Green chilli', 'Peanuts', 'Sesame', 'Tamarind', 'Spices'],
  ),
  // China Town
  Food(
    name: 'Hakka Noodles',
    price: '₹229',
    icon: Icons.ramen_dining_outlined,
    rating: 4.4,
    image: 'assets/images/noodles.jpg',
    restaurant: 'China Town',
    description: 'Stir-fried noodles with crunchy vegetables and soy sauce.',
    ingredients: [
      'Noodles',
      'Cabbage',
      'Carrot',
      'Capsicum',
      'Soy sauce',
      'Garlic',
    ],
  ),
  Food(
    name: 'Veg Manchurian',
    price: '₹219',
    icon: Icons.rice_bowl_outlined,
    rating: 4.5,
    image: 'assets/images/noodles.jpg',
    restaurant: 'China Town',
    description: 'Crispy veggie balls tossed in a tangy garlic sauce.',
    ingredients: ['Cabbage', 'Carrot', 'Garlic', 'Soy sauce', 'Spring onion'],
    offer: '10% OFF',
  ),
  Food(
    name: 'Veg Fried Rice',
    price: '₹199',
    icon: Icons.rice_bowl_outlined,
    rating: 4.3,
    image: 'assets/images/biryani.jpg',
    restaurant: 'China Town',
    description: 'Wok-tossed rice with mixed vegetables and light soy.',
    ingredients: ['Rice', 'Peas', 'Carrot', 'Spring onion', 'Soy sauce'],
  ),
  // Punjab Grill
  Food(
    name: 'Paneer Tikka',
    price: '₹279',
    icon: Icons.kebab_dining,
    rating: 4.7,
    image: 'assets/images/paneer_tikka.jpg',
    restaurant: 'Punjab Grill',
    description: 'Tandoor-roasted paneer cubes marinated in yogurt and spices.',
    ingredients: [
      'Paneer',
      'Yogurt',
      'Red chilli',
      'Garam masala',
      'Capsicum',
      'Onion',
    ],
    offer: '15% OFF',
  ),
  Food(
    name: 'Butter Paneer',
    price: '₹289',
    icon: Icons.restaurant_menu,
    rating: 4.8,
    image: 'assets/images/paneer_tikka.jpg',
    restaurant: 'Punjab Grill',
    description: 'Soft paneer in a creamy tomato-butter gravy.',
    ingredients: ['Paneer', 'Tomato', 'Butter', 'Cream', 'Kasuri methi'],
  ),
  Food(
    name: 'Tandoori Roti Basket',
    price: '₹89',
    icon: Icons.breakfast_dining_outlined,
    rating: 4.4,
    image: 'assets/images/sandwich.jpg',
    restaurant: 'Punjab Grill',
    description: 'Three tandoor-baked rotis, best with gravy dishes.',
    ingredients: ['Wheat flour', 'Ghee', 'Salt'],
  ),
  // Mango Shack
  Food(
    name: 'Mango Shake',
    price: '₹149',
    icon: Icons.local_drink_outlined,
    rating: 4.5,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Mango Shack',
    description: 'Chilled Alphonso mango blended with milk and ice cream.',
    ingredients: ['Alphonso mango', 'Milk', 'Sugar', 'Ice cream'],
    offer: 'Free topping',
  ),
  Food(
    name: 'Mango Lassi',
    price: '₹129',
    icon: Icons.local_drink_outlined,
    rating: 4.6,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Mango Shack',
    description: 'Thick yogurt lassi blended with ripe mango pulp.',
    ingredients: ['Mango', 'Yogurt', 'Sugar', 'Cardamom'],
  ),
  Food(
    name: 'Mango Ice Cream Cup',
    price: '₹99',
    icon: Icons.icecream_outlined,
    rating: 4.4,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Mango Shack',
    description: 'Two scoops of mango ice cream with a honey drizzle.',
    ingredients: ['Mango ice cream', 'Honey', 'Pistachio'],
  ),
  // Oven Story
  Food(
    name: 'Extra Cheese Paneer Tandoori Pizza',
    price: '₹399',
    icon: Icons.local_pizza_outlined,
    rating: 4.9,
    image: 'assets/images/pizza.jpg',
    restaurant: 'Oven Story',
    description:
        'Tandoori paneer pizza loaded with extra mozzarella and peppers.',
    ingredients: [
      'Pizza base',
      'Tandoori paneer',
      'Mozzarella',
      'Onion',
      'Capsicum',
      'Tandoori sauce',
    ],
    offer: '20% OFF',
  ),
  Food(
    name: 'Veggie Supreme Pizza',
    price: '₹359',
    icon: Icons.local_pizza_outlined,
    rating: 4.6,
    image: 'assets/images/pizza.jpg',
    restaurant: 'Oven Story',
    description: 'Corn, olives, peppers and onion on a cheese-burst base.',
    ingredients: ['Pizza base', 'Corn', 'Olives', 'Capsicum', 'Mozzarella'],
  ),
  Food(
    name: 'Cheese Burst Slice Box',
    price: '₹249',
    icon: Icons.local_pizza_outlined,
    rating: 4.5,
    image: 'assets/images/pizza.jpg',
    restaurant: 'Oven Story',
    description: 'Four cheese-burst slices, perfect for sharing.',
    ingredients: ['Pizza base', 'Mozzarella', 'Cheddar', 'Oregano'],
    offer: '20% OFF',
  ),
  // Juice Bar
  Food(
    name: 'Mixed Fruit Punch',
    price: '₹139',
    icon: Icons.local_drink_outlined,
    rating: 4.3,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Juice Bar',
    description: 'Orange, apple and pineapple blended into a chilled punch.',
    ingredients: ['Orange', 'Apple', 'Pineapple', 'Mint'],
  ),
  Food(
    name: 'Cold Coffee',
    price: '₹119',
    icon: Icons.coffee_outlined,
    rating: 4.4,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Juice Bar',
    description: 'Iced coffee shaken with milk and a scoop of ice cream.',
    ingredients: ['Coffee', 'Milk', 'Sugar', 'Ice cream'],
    offer: '₹20 OFF',
  ),
  Food(
    name: 'Watermelon Cooler',
    price: '₹109',
    icon: Icons.local_drink_outlined,
    rating: 4.2,
    image: 'assets/images/mango_shake.jpg',
    restaurant: 'Juice Bar',
    description: 'Fresh watermelon juice with lemon and mint.',
    ingredients: ['Watermelon', 'Lemon', 'Mint', 'Ice'],
  ),
];

const List<FoodOrder> kOrders = [
  FoodOrder(
    id: '#1001',
    food: 'Margherita Pizza',
    status: 'Delivered',
    restaurant: "Domino's Pizza",
    amount: '₹299',
    date: 'Today, 1:20 PM',
    icon: Icons.local_pizza_outlined,
    image: 'assets/images/pizza.jpg',
  ),
  FoodOrder(
    id: '#1002',
    food: 'Burger',
    status: 'Preparing',
    restaurant: 'Burger King',
    amount: '₹199',
    date: 'Today, 12:45 PM',
    icon: Icons.lunch_dining_outlined,
    image: 'assets/images/burger.jpg',
  ),
  FoodOrder(
    id: '#1003',
    food: 'Creamy Alfredo Pasta',
    status: 'Delivered',
    restaurant: 'Italian Corner',
    amount: '₹249',
    date: 'Yesterday, 8:10 PM',
    icon: Icons.ramen_dining_outlined,
    image: 'assets/images/pasta.jpg',
  ),
  FoodOrder(
    id: '#1004',
    food: 'Hyderabadi Biryani',
    status: 'Cancelled',
    restaurant: 'Hyderabadi House',
    amount: '₹329',
    date: 'Yesterday, 2:00 PM',
    icon: Icons.rice_bowl_outlined,
    image: 'assets/images/biryani.jpg',
  ),
  FoodOrder(
    id: '#1005',
    food: 'Paneer Tikka',
    status: 'Preparing',
    restaurant: 'Punjab Grill',
    amount: '₹279',
    date: 'Today, 11:30 AM',
    icon: Icons.kebab_dining,
    image: 'assets/images/paneer_tikka.jpg',
  ),
  FoodOrder(
    id: '#1006',
    food: 'Extra Cheese Paneer Tandoori Pizza',
    status: 'Delivered',
    restaurant: 'Oven Story',
    amount: '₹399',
    date: 'Mon, 7:15 PM',
    icon: Icons.local_pizza_outlined,
    image: 'assets/images/pizza.jpg',
  ),
  FoodOrder(
    id: '#1098',
    food: 'Veg Hakka Noodles',
    status: 'Delivered',
    restaurant: 'China Town',
    amount: '₹189',
    date: 'Sun, 6:40 PM',
    icon: Icons.ramen_dining_outlined,
    image: 'assets/images/noodles.jpg',
    customerId: 'other',
  ),
  FoodOrder(
    id: '#1099',
    food: 'Mango Shake',
    status: 'Preparing',
    restaurant: 'Juice Bar',
    amount: '₹129',
    date: 'Today, 10:05 AM',
    icon: Icons.local_drink_outlined,
    image: 'assets/images/mango_shake.jpg',
    customerId: 'other',
  ),
];

class FoodStore extends ChangeNotifier {
  FoodStore._() : orders = List<FoodOrder>.from(kOrders);

  static final FoodStore instance = FoodStore._();

  final List<FoodOrder> orders;
  final Set<String> liked = {};
  String restaurantQuery = '';
  int _nextId = 1007;

  String userName = 'Sakshi Pokhriyal';
  String userEmail = 'sakshi@bite.app';
  String userPhone = '+91 98765 43210';
  bool orderAlerts = true;
  bool offerAlerts = true;
  String paymentMethod = 'UPI';
  String selectedAddress = 'Home — Connaught Place, Delhi';
  final List<String> addresses = [
    'Home — Connaught Place, Delhi',
    'Work — Cyber Hub, Gurugram',
  ];

  List<Food> get wishlist =>
      kFoods.where((food) => liked.contains(food.name)).toList();

  List<FoodOrder> get myOrders =>
      orders.where((order) => order.customerId == 'current').toList();

  bool isLiked(String name) => liked.contains(name);

  void setRestaurantQuery(String value) {
    restaurantQuery = value;
    notifyListeners();
  }

  void toggleLike(Food food) {
    if (liked.contains(food.name)) {
      liked.remove(food.name);
    } else {
      liked.add(food.name);
    }
    notifyListeners();
  }

  FoodOrder placeOrder(Food food, int quantity) {
    final total = food.discountedTotal(quantity);
    final order = FoodOrder(
      id: '#$_nextId',
      food: quantity > 1 ? '${food.name} × $quantity' : food.name,
      status: 'Preparing',
      restaurant: food.restaurant,
      amount: '₹$total',
      date: 'Just now',
      icon: food.icon,
      image: food.image,
      etaMinutes: 22,
      customerId: 'current',
    );
    _nextId++;
    orders.insert(0, order);
    notifyListeners();
    return order;
  }

  FoodOrder? orderById(String id) {
    for (final order in orders) {
      if (order.id == id) return order;
    }
    return null;
  }

  void cancelOrder(String id) {
    final index = orders.indexWhere((order) => order.id == id);
    if (index < 0) return;
    final current = orders[index];
    if (current.status != 'Preparing') return;
    orders[index] = FoodOrder(
      id: current.id,
      food: current.food,
      status: 'Cancelled',
      restaurant: current.restaurant,
      amount: current.amount,
      date: current.date,
      icon: current.icon,
      image: current.image,
      etaMinutes: current.etaMinutes,
      customerId: current.customerId,
    );
    notifyListeners();
  }

  void saveAccount({
    required String name,
    required String email,
    required String phone,
  }) {
    userName = name;
    userEmail = email;
    userPhone = phone;
    notifyListeners();
  }

  void setOrderAlerts(bool value) {
    orderAlerts = value;
    notifyListeners();
  }

  void setOfferAlerts(bool value) {
    offerAlerts = value;
    notifyListeners();
  }

  void setSelectedAddress(String value) {
    selectedAddress = value.trim();
    notifyListeners();
  }

  void addAddress(String value) {
    addresses.add(value);
    selectedAddress = value;
    notifyListeners();
  }

  void setPaymentMethod(String value) {
    paymentMethod = value;
    notifyListeners();
  }
}

// ============================================================
// DASHBOARD SCREEN
// ============================================================

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedMenu = 0;
  final TextEditingController _restaurantSearch = TextEditingController();

  @override
  void dispose() {
    _restaurantSearch.dispose();
    super.dispose();
  }

  void selectMenu(int index) {
    if (Scaffold.maybeOf(context)?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OffersScreen()),
      );
      return;
    }

    setState(() {
      selectedMenu = index;
    });
  }

  Widget _content({required bool isMobile, required bool isTablet}) {
    switch (selectedMenu) {
      case 1:
        return OrdersPage(isMobile: isMobile);
      case 2:
        return const OffersPage();
      case 3:
        return SettingsPage(onOpenAccount: () => selectMenu(5));
      case 4:
        return const WishlistPage();
      case 5:
        return const AccountPage();
      default:
        return DashboardContent(
          isMobile: isMobile,
          isTablet: isTablet,
          onSeeAllOrders: () => selectMenu(1),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    final bottomIndex = selectedMenu <= 3 ? selectedMenu : 0;

    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: kPageBg,
          appBar: ZomatoAppBar(
            isMobile: isMobile,
            wishlistCount: FoodStore.instance.wishlist.length,
            restaurantController: _restaurantSearch,
            onWishlist: () => selectMenu(4),
            onAccount: () => selectMenu(5),
          ),
          body: Row(
            children: [
              if (!isMobile)
                SizedBox(
                  width: isTablet ? 200 : 220,
                  child: SideMenu(
                    selectedIndex: selectedMenu,
                    onItemSelected: selectMenu,
                  ),
                ),
              Expanded(
                child: _content(isMobile: isMobile, isTablet: isTablet),
              ),
            ],
          ),
          bottomNavigationBar: isMobile
              ? BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: bottomIndex,
                  selectedItemColor: kZomatoRed,
                  unselectedItemColor: Colors.grey.shade500,
                  selectedFontSize: 12,
                  unselectedFontSize: 11,
                  backgroundColor: Colors.white,
                  elevation: 8,
                  onTap: selectMenu,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 22),
                      activeIcon: Icon(Icons.home_outlined, size: 22),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.receipt_long_outlined, size: 22),
                      activeIcon: Icon(Icons.receipt_long_outlined, size: 22),
                      label: 'Orders',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.local_offer_outlined, size: 22),
                      activeIcon: Icon(Icons.local_offer_outlined, size: 22),
                      label: 'Offers',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined, size: 22),
                      activeIcon: Icon(Icons.settings_outlined, size: 22),
                      label: 'Settings',
                    ),
                  ],
                )
              : null,
        );
      },
    );
  }
}

// ============================================================
// APP BAR — name once + location + restaurant search
// ============================================================

class ZomatoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMobile;
  final int wishlistCount;
  final TextEditingController restaurantController;
  final VoidCallback onWishlist;
  final VoidCallback onAccount;

  const ZomatoAppBar({
    super.key,
    required this.isMobile,
    required this.wishlistCount,
    required this.restaurantController,
    required this.onWishlist,
    required this.onAccount,
  });

  @override
  Size get preferredSize => Size.fromHeight(isMobile ? 64 : 72);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: isMobile ? 64 : 72,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
      scrolledUnderElevation: 1,
      surfaceTintColor: Colors.white,
      titleSpacing: isMobile ? 12 : 16,
      title: isMobile
          ? const BrandMark(compact: true)
          : Row(
              children: [
                const BrandMark(compact: false),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: TextField(
                      controller: restaurantController,
                      onChanged: FoodStore.instance.setRestaurantQuery,
                      decoration: InputDecoration(
                        hintText: 'Search for restaurant, cuisine or a dish',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: kZomatoRed,
                          size: 20,
                        ),
                        suffixIcon: FoodStore.instance.restaurantQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 18),
                                onPressed: () {
                                  restaurantController.clear();
                                  FoodStore.instance.setRestaurantQuery('');
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: kPageBg,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      actions: [
        if (isMobile)
          IconButton(
            tooltip: 'Search restaurants',
            onPressed: () => _showMobileRestaurantSearch(context),
            icon: const Icon(Icons.search, size: 22),
          ),
        IconButton(
          tooltip: 'Wishlist',
          onPressed: onWishlist,
          icon: Badge(
            isLabelVisible: wishlistCount > 0,
            label: Text('$wishlistCount'),
            backgroundColor: kZomatoRed,
            child: Icon(
              wishlistCount > 0 ? Icons.favorite : Icons.favorite_border,
              color: wishlistCount > 0 ? kZomatoRed : Colors.black87,
              size: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            tooltip: 'Account',
            onPressed: () => _showAccountPopup(context),
            icon: CircleAvatar(
              radius: 16,
              backgroundColor: kZomatoRed.withValues(alpha: 0.12),
              child: const Icon(
                Icons.person_outline,
                size: 18,
                color: kZomatoRed,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAccountPopup(BuildContext context) {
    final store = FoodStore.instance;
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFFFFEBEE),
                        child: Icon(Icons.person_outline, color: kZomatoRed),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store.userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              store.userPhone,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kZomatoRed,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              store.selectedAddress,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onAccount();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kZomatoRed,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('View account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMobileRestaurantSearch(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Search restaurants'),
          content: TextField(
            controller: restaurantController,
            autofocus: true,
            onChanged: FoodStore.instance.setRestaurantQuery,
            decoration: const InputDecoration(
              hintText: 'Burger King, Oven Story...',
              prefixIcon: Icon(Icons.search, color: kZomatoRed),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                restaurantController.clear();
                FoodStore.instance.setRestaurantQuery('');
                Navigator.pop(context);
              },
              child: const Text('Clear'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// SIDEBAR
// ============================================================

class SideMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const SideMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: kLine)),
        ),
        child: Column(
        children: [
          const SizedBox(height: 12),
          MenuItem(
            icon: Icons.home_outlined,
            title: 'Dashboard',
            selected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          MenuItem(
            icon: Icons.receipt_long_outlined,
            title: 'Orders',
            selected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          MenuItem(
            icon: Icons.local_offer_outlined,
            title: 'Offers',
            selected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),
          MenuItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            selected: selectedIndex == 3,
            onTap: () => onItemSelected(3),
          ),
          MenuItem(
            icon: Icons.favorite_border,
            title: 'Wishlist',
            selected: selectedIndex == 4,
            onTap: () => onItemSelected(4),
          ),
          MenuItem(
            icon: Icons.person_outline,
            title: 'Account',
            selected: selectedIndex == 5,
            onTap: () => onItemSelected(5),
          ),
        ],
      ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Material(
        color: selected ? kZomatoRed.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: selected ? kZomatoRed : Colors.grey.shade600,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected ? kZomatoRed : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DASHBOARD CONTENT
// ============================================================

class DashboardContent extends StatefulWidget {
  final bool isMobile;
  final bool isTablet;
  final VoidCallback onSeeAllOrders;

  const DashboardContent({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.onSeeAllOrders,
  });

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  String foodQuery = '';
  final TextEditingController _foodSearch = TextEditingController();

  @override
  void dispose() {
    _foodSearch.dispose();
    super.dispose();
  }

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  List<Food> _filteredFoods() {
    final restaurantQuery =
        FoodStore.instance.restaurantQuery.trim().toLowerCase();
    final dishQuery = foodQuery.trim().toLowerCase();

    return kFoods.where((food) {
      final matchesRestaurant = restaurantQuery.isEmpty ||
          matchesQuery(food.restaurant, restaurantQuery) ||
          matchesQuery(food.name, restaurantQuery);
      final matchesFood = dishQuery.isEmpty ||
          matchesQuery(food.name, dishQuery) ||
          food.ingredients.any((item) => matchesQuery(item, dishQuery));
      return matchesRestaurant && matchesFood;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final filteredFoods = _filteredFoods();
        final restaurantQuery = FoodStore.instance.restaurantQuery.trim();

        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final inset = width >= 1024 ? 24.0 : width >= 700 ? 18.0 : 14.0;

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(inset, 18, inset, 8),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getGreeting(),
                          style: TextStyle(
                            fontSize: widget.isMobile ? 26 : 34,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87,
                            letterSpacing: -0.6,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          restaurantQuery.isEmpty
                              ? 'Order from the best kitchens around you'
                              : 'Food matching "$restaurantQuery"',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _PopularFoodSearchHeader(
                    itemCount: filteredFoods.length,
                    searchQuery: foodQuery,
                    controller: _foodSearch,
                    horizontal: inset,
                    onChanged: (value) {
                      setState(() {
                        foodQuery = value;
                      });
                    },
                    onClear: () {
                      _foodSearch.clear();
                      setState(() {
                        foodQuery = '';
                      });
                    },
                  ),
                ),
                if (filteredFoods.isEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          'No food available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(inset, 8, inset, 8),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: widget.isMobile ? 220 : 360,
                        mainAxisExtent: widget.isMobile ? 300 : 370,
                        crossAxisSpacing: widget.isMobile ? 12 : 18,
                        mainAxisSpacing: widget.isMobile ? 12 : 18,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            FoodCard(food: filteredFoods[index]),
                        childCount: filteredFoods.length,
                      ),
                    ),
                  ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(inset, 16, inset, 32),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Your recent orders',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: widget.onSeeAllOrders,
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  color: kZomatoRed,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const RecentOrders(limit: 4),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _PopularFoodSearchHeader extends SliverPersistentHeaderDelegate {
  final int itemCount;
  final String searchQuery;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final double horizontal;

  _PopularFoodSearchHeader({
    required this.itemCount,
    required this.searchQuery,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    this.horizontal = 16,
  });

  @override
  double get minExtent => 126;

  @override
  double get maxExtent => 126;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: kPageBg,
      elevation: overlapsContent ? 2 : 0,
      shadowColor: Colors.black12,
      child: Padding(
        padding: EdgeInsets.fromLTRB(horizontal, 10, horizontal, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Popular food',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                Text(
                  '$itemCount items',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: biteField(
                hint: 'Search a dish or ingredient...',
                prefix: const Icon(Icons.search, color: kZomatoRed),
                suffix: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: onClear,
                      )
                    : null,
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _PopularFoodSearchHeader oldDelegate) {
    return oldDelegate.itemCount != itemCount ||
        oldDelegate.searchQuery != searchQuery ||
        oldDelegate.horizontal != horizontal;
  }
}

// ============================================================
// ORDERS PAGE
// ============================================================

class OrdersPage extends StatefulWidget {
  final bool isMobile;

  const OrdersPage({super.key, required this.isMobile});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  String filter = 'All';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        final mine = store.myOrders;
        final filtered = filter == 'All'
            ? mine
            : mine.where((order) => order.status == filter).toList();

        return pageShell(
          context: context,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your orders',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${store.userName}  •  ${filtered.length} orders',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final label in [
                          'All',
                          'Delivered',
                          'Preparing',
                          'Cancelled',
                        ])
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(label),
                              selected: filter == label,
                              selectedColor: kZomatoRed.withValues(alpha: 0.12),
                              labelStyle: TextStyle(
                                color: filter == label
                                    ? kZomatoRed
                                    : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                              side: BorderSide(
                                color: filter == label
                                    ? kZomatoRed
                                    : Colors.grey.shade300,
                              ),
                              onSelected: (_) {
                                setState(() {
                                  filter = label;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text('No orders in this filter'))
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                      itemCount: filtered.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return OrderLineCard(order: filtered[index]);
                      },
                    ),
            ),
          ],
        ),
        );
      },
    );
  }
}

class OrderLineCard extends StatelessWidget {
  final FoodOrder order;

  const OrderLineCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final color = statusColor(order.status);

    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(
                orderId: order.id,
                foodName: order.food,
                status: order.status,
                restaurant: order.restaurant,
                amount: order.amount,
                date: order.date,
                image: order.image,
                icon: order.icon,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  order.image,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return CircleAvatar(
                      radius: 28,
                      backgroundColor: kZomatoRed.withValues(alpha: 0.1),
                      child: Icon(order.icon, color: kZomatoRed, size: 22),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurant,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Order ${order.id}  •  ${order.food}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${order.amount}  •  ${order.date}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.status,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentOrders extends StatelessWidget {
  final int? limit;

  const RecentOrders({super.key, this.limit});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final all = FoodStore.instance.myOrders;
        final orders = limit == null ? all : all.take(limit!).toList();

        if (orders.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Text('No recent orders yet. Order a dish to see it here.'),
          );
        }

        return Column(
          children: [
            for (final order in orders) ...[
              OrderLineCard(order: order),
              const SizedBox(height: 10),
            ],
          ],
        );
      },
    );
  }
}

// ============================================================
// FOOD CARD — heart only, hover shows what's in it
// ============================================================

class FoodCard extends StatefulWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool hovering = false;

  void _openDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsScreen(food: widget.food),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final liked = FoodStore.instance.isLiked(food.name);

        return MouseRegion(
          onEnter: (_) => setState(() => hovering = true),
          onExit: (_) => setState(() => hovering = false),
          child: Card(
            elevation: hovering ? 5 : 0,
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: kLine),
            ),
            child: InkWell(
              onTap: _openDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          food.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return ColoredBox(
                              color: kZomatoRed.withValues(alpha: 0.08),
                              child: Icon(food.icon, size: 44, color: kZomatoRed),
                            );
                          },
                        ),
                        if (hovering)
                          ColoredBox(
                            color: Colors.black.withValues(alpha: 0.72),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "What's in it",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  for (final item
                                      in food.ingredients.take(4))
                                    Text(
                                      '• $item',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  const Spacer(),
                                  const Text(
                                    'Tap for full details',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: food.hasOffer
                              ? OfferBadge(label: food.offer!, compact: true)
                              : const SizedBox.shrink(),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: _RoundIconButton(
                            icon: liked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: liked ? kZomatoRed : Colors.black87,
                            onTap: () =>
                                FoodStore.instance.toggleLike(food),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          bottom: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: kZomatoGreen,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${food.rating}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                const Icon(
                                  Icons.star,
                                  size: 11,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: isPhone(context) ? 15 : 17,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food.restaurant,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: isPhone(context) ? 12 : 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (!isPhone(context)) ...[
                            const SizedBox(height: 6),
                            Text(
                              food.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.3,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                          const Spacer(),
                          Row(
                            children: [
                              if (food.hasOffer &&
                                  food.discountedTotal(1) < food.priceValue) ...[
                                Text(
                                  food.price,
                                  style: TextStyle(
                                    fontSize: isPhone(context) ? 13 : 14,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '₹${food.discountedTotal(1)}',
                                  style: TextStyle(
                                    fontSize: isPhone(context) ? 16 : 18,
                                    color: kZomatoRed,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ] else
                                Text(
                                  food.price,
                                  style: TextStyle(
                                    fontSize: isPhone(context) ? 16 : 18,
                                    color: kZomatoRed,
                                    fontWeight: FontWeight.w800,
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
          ),
        );
      },
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _RoundIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, color: color, size: 18),
        ),
      ),
    );
  }
}

// ============================================================
// ORDER DETAILS
// ============================================================

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  final String foodName;
  final String status;
  final String restaurant;
  final String amount;
  final String date;
  final String image;
  final IconData icon;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.foodName,
    required this.status,
    this.restaurant = 'Bite Kitchen',
    this.amount = '₹0',
    this.date = '',
    this.image = 'assets/images/pizza.jpg',
    this.icon = Icons.receipt_long_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final live = FoodStore.instance.orderById(orderId);
        final currentStatus = live?.status ?? status;
        final eta = live?.etaMinutes ?? 25;
        final color = statusColor(currentStatus);
        final canCancel = currentStatus == 'Preparing';
        final isMobile = MediaQuery.of(context).size.width < 600;

        return Scaffold(
          backgroundColor: kPageBg,
          appBar: AppBar(
            title: const Row(
              children: [
                BiteLogo(size: 26, inverted: true),
                SizedBox(width: 10),
                Text('Order details'),
              ],
            ),
            backgroundColor: kZomatoRed,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: pageShell(
            context: context,
            maxWidth: 860,
            child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  shadowColor: Colors.black12,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: kLine),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: isMobile ? 180 : 240,
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return ColoredBox(
                                color: kZomatoRed.withValues(alpha: 0.08),
                                child: Icon(icon, size: 64, color: kZomatoRed),
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.receipt_long_outlined,
                              size: 36,
                              color: kZomatoRed,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              restaurant,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                currentStatus,
                                style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            DeliveryMapCard(
                              status: currentStatus,
                              minutes: eta,
                            ),
                            const SizedBox(height: 8),
                            Divider(color: Colors.grey.shade200, height: 28),
                            _detailRow('Order ID', orderId),
                            _detailRow('Items', foodName),
                            _detailRow('Amount', amount),
                            if (date.isNotEmpty) _detailRow('Placed', date),
                            _detailRow(
                              'Delivery time',
                              currentStatus == 'Preparing'
                                  ? '$eta min'
                                  : currentStatus == 'Delivered'
                                      ? 'Delivered'
                                      : 'Cancelled',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (canCancel)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        FoodStore.instance.cancelOrder(orderId);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Order $orderId cancelled'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.cancel_outlined),
                      label: const Text(
                        'Cancel order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kZomatoRed,
                        side: const BorderSide(color: kZomatoRed, width: 1.5),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),
                if (canCancel) const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      'Go Back',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kZomatoRed,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class DeliveryMapCard extends StatelessWidget {
  final String status;
  final int minutes;

  const DeliveryMapCard({
    super.key,
    required this.status,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    final preparing = status == 'Preparing';
    final title = preparing
        ? 'Arriving in $minutes min'
        : status == 'Delivered'
            ? 'Delivered to your address'
            : 'Delivery cancelled';

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final progress = preparing
              ? 0.42
              : status == 'Delivered'
                  ? 0.88
                  : 0.18;
          final scooterLeft =
              18 + (constraints.maxWidth - 72) * progress;
          final scooterBottom = preparing ? 78.0 : 22.0;

          return Stack(
            children: [
              const Positioned.fill(
                child: CustomPaint(painter: _MapPainter()),
              ),
              Positioned(
                top: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        preparing
                            ? Icons.delivery_dining
                            : status == 'Delivered'
                                ? Icons.check_circle_outline
                                : Icons.cancel_outlined,
                        color: preparing ? kZomatoRed : statusColor(status),
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                bottom: 22,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: kZomatoRed,
                  child: Icon(Icons.storefront, color: Colors.white, size: 16),
                ),
              ),
              Positioned(
                left: scooterLeft,
                bottom: scooterBottom,
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.delivery_dining,
                    color: kZomatoRed,
                    size: 22,
                  ),
                ),
              ),
              const Positioned(
                right: 18,
                bottom: 22,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: kZomatoGreen,
                  child: Icon(Icons.home_outlined, color: Colors.white, size: 16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  const _MapPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final road = Paint()
      ..color = const Color(0xFFC8E6C9)
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final route = Paint()
      ..color = kZomatoRed
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(20, size.height * 0.72),
      Offset(size.width - 20, size.height * 0.72),
      road,
    );
    canvas.drawLine(
      Offset(size.width * 0.35, 70),
      Offset(size.width * 0.35, size.height * 0.72),
      road,
    );

    final path = Path()
      ..moveTo(34, size.height * 0.72)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.35,
        size.width - 34,
        size.height * 0.72,
      );
    canvas.drawPath(path, route);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================
// FOOD DETAILS — Swiggy-style what's in it
// ============================================================

class FoodDetailsScreen extends StatefulWidget {
  final Food food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  int quantity = 1;

  void _order(FoodStore store, Food food) {
    final order = store.placeOrder(food, quantity);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(
          orderId: order.id,
          foodName: order.food,
          status: order.status,
          restaurant: order.restaurant,
          amount: order.amount,
          date: order.date,
          image: order.image,
          icon: order.icon,
        ),
      ),
    );
  }

  Widget _hero(Food food, {required double height, BorderRadius? radius}) {
    final image = Image.asset(
      food.image,
      fit: BoxFit.cover,
      width: double.infinity,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return ColoredBox(
          color: kBrandSoft,
          child: Icon(food.icon, size: 80, color: kZomatoRed),
        );
      },
    );
    if (radius == null) return image;
    return ClipRRect(borderRadius: radius, child: image);
  }

  Widget _details(Food food, FoodStore store, int total) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            height: 1.15,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          food.restaurant,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (food.hasOffer) ...[
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: kBrandSoft,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kZomatoRed.withValues(alpha: 0.25)),
            ),
            child: Row(
              children: [
                OfferBadge(label: food.offer!),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    food.offer!.toUpperCase().contains('BOGO')
                        ? 'Buy 1 get 1 free on this dish'
                        : '${food.offer} applied on this dish',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 14),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: kZomatoGreen,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '${food.rating} ★',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            if (food.hasOffer &&
                food.discountedTotal(1) < food.priceValue) ...[
              Text(
                food.price,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '₹${food.discountedTotal(1)}',
                style: const TextStyle(
                  fontSize: 24,
                  color: kZomatoRed,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ] else
              Text(
                food.price,
                style: const TextStyle(
                  fontSize: 24,
                  color: kZomatoRed,
                  fontWeight: FontWeight.w800,
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          food.description,
          style: TextStyle(
            color: Colors.grey.shade700,
            height: 1.5,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 22),
        const Text(
          "What's in this dish",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final item in food.ingredients)
              Chip(
                label: Text(item),
                backgroundColor: kBrandSoft,
                side: const BorderSide(color: kLine),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kLine),
          ),
          child: Row(
            children: [
              const Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 12),
              _QtyButton(
                icon: Icons.remove,
                onTap: () {
                  if (quantity > 1) setState(() => quantity--);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              _QtyButton(
                icon: Icons.add,
                onTap: () {
                  if (quantity < 10) setState(() => quantity++);
                },
              ),
              const Spacer(),
              Text(
                '₹$total',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () => _order(store, food),
            icon: const Icon(Icons.shopping_bag_outlined),
            label: Text(
              food.hasOffer
                  ? 'Order now • ₹$total  (${food.offer})'
                  : 'Order now • ₹$total',
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kZomatoRed,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        final liked = store.isLiked(food.name);
        final total = food.discountedTotal(quantity);
        final wide = MediaQuery.sizeOf(context).width >= 900;

        return Scaffold(
          backgroundColor: kPageBg,
          appBar: AppBar(
            title: Row(
              children: [
                const BiteLogo(size: 26, inverted: true),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(food.name, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            backgroundColor: kZomatoRed,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                tooltip: liked ? 'Remove from wishlist' : 'Add to wishlist',
                onPressed: () => store.toggleLike(food),
                icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
              ),
            ],
          ),
          body: pageShell(
            context: context,
            maxWidth: 1080,
            child: wide
                ? SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: _hero(
                            food,
                            height: 420,
                            radius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 28),
                        Expanded(
                          flex: 5,
                          child: _details(food, store, total),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      _hero(
                        food,
                        height: 240,
                        radius: BorderRadius.circular(18),
                      ),
                      const SizedBox(height: 18),
                      _details(food, store, total),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kZomatoRed.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: kZomatoRed, size: 20),
        ),
      ),
    );
  }
}

// ============================================================
// WISHLIST
// ============================================================

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final items = FoodStore.instance.wishlist;

        if (items.isEmpty) {
          return pageShell(
            context: context,
            child: const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 56, color: Colors.grey),
                  SizedBox(height: 12),
                  Text(
                    'Your wishlist is empty',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Tap the heart on a dish to save it here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          );
        }

        final width = MediaQuery.sizeOf(context).width;
        final phone = width < 700;

        return pageShell(
          context: context,
          child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'Wishlist',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  '${items.length} saved items',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: phone ? 220 : 360,
                mainAxisExtent: phone ? 300 : 370,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => FoodCard(food: items[index]),
                childCount: items.length,
              ),
            ),
          ],
        ),
        );
      },
    );
  }
}

// ============================================================
// OFFERS — stays in shell so sidebar remains
// ============================================================

class OffersPage extends StatelessWidget {
  final bool showHeading;

  const OffersPage({super.key, this.showHeading = true});

  @override
  Widget build(BuildContext context) {
    final dishOffers = kFoods.where((food) => food.hasOffer).toList();

    Widget offerCard(Food food) {
      return Card(
        elevation: 0,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: kLine),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailsScreen(food: food),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        food.image,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return ColoredBox(
                            color: kBrandSoft,
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(food.icon, color: kZomatoRed),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            food.restaurant,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OfferBadge(label: food.offer!),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  food.offer!.toUpperCase().contains('BOGO')
                      ? 'Buy 1 get 1 free on ${food.name}.'
                      : '${food.offer} on ${food.name} at ${food.restaurant}.',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    height: 1.35,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen(food: food),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kZomatoRed,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Use offer'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return pageShell(
      context: context,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 800 ? 2 : 1;
          return CustomScrollView(
            slivers: [
              if (showHeading)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 14),
                    child: Text(
                      'Offers',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ),
                ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  mainAxisExtent: columns == 1 ? 200 : 210,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => offerCard(dishOffers[index]),
                  childCount: dishOffers.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: AppBar(
        title: const Text('Offers'),
        backgroundColor: kZomatoRed,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: const OffersPage(showHeading: false),
    );
  }
}

// ============================================================
// SETTINGS
// ============================================================

class SettingsPage extends StatelessWidget {
  final VoidCallback onOpenAccount;

  const SettingsPage({super.key, required this.onOpenAccount});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;

        return pageShell(
          context: context,
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Manage your Bite account',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final twoCol = constraints.maxWidth >= 640;
                final tiles = [
                  _tile(
                    icon: Icons.person_outline,
                    title: 'Account',
                    subtitle: store.userName,
                    onTap: onOpenAccount,
                  ),
                  _tile(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: store.orderAlerts
                        ? 'Order alerts on'
                        : 'Order alerts off',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const NotificationsSettingsPage(),
                      ),
                    ),
                  ),
                  _tile(
                    icon: Icons.location_on_outlined,
                    title: 'Saved addresses',
                    subtitle: 'Deliver to your saved places',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressesSettingsPage(),
                      ),
                    ),
                  ),
                  _tile(
                    icon: Icons.payments_outlined,
                    title: 'Payments',
                    subtitle: store.paymentMethod,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentsSettingsPage(),
                      ),
                    ),
                  ),
                  _tile(
                    icon: Icons.help_outline,
                    title: 'Help',
                    subtitle: 'FAQs and support',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpSettingsPage(),
                      ),
                    ),
                  ),
                ];

                if (!twoCol) {
                  return Column(children: tiles);
                }

                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final tile in tiles)
                      SizedBox(
                        width: (constraints.maxWidth - 12) / 2,
                        child: tile,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        );
      },
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: kZomatoRed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: kZomatoRed, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        return Scaffold(
          backgroundColor: kPageBg,
          appBar: AppBar(
            title: const Text('Notifications'),
            backgroundColor: kZomatoRed,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: pageShell(
            context: context,
            maxWidth: 720,
            child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SwitchListTile(
                title: const Text('Order alerts'),
                subtitle: const Text('Preparing, delivered and cancelled'),
                value: store.orderAlerts,
                activeThumbColor: kZomatoRed,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                tileColor: Colors.white,
                onChanged: store.setOrderAlerts,
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: const Text('Offer alerts'),
                subtitle: const Text('Discounts and free delivery'),
                value: store.offerAlerts,
                activeThumbColor: kZomatoRed,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                tileColor: Colors.white,
                onChanged: store.setOfferAlerts,
              ),
            ],
          ),
          ),
        );
      },
    );
  }
}

class AddressesSettingsPage extends StatelessWidget {
  const AddressesSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        return Scaffold(
          backgroundColor: kPageBg,
          appBar: AppBar(
            title: const Text('Saved addresses'),
            backgroundColor: kZomatoRed,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: pageShell(
            context: context,
            maxWidth: 720,
            child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Text(
                'Delivering to',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              for (final address in store.addresses)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => store.setSelectedAddress(address),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: store.selectedAddress == address
                                ? kZomatoRed
                                : Colors.grey.shade200,
                            width: store.selectedAddress == address ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: kZomatoRed.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                address.toLowerCase().startsWith('work')
                                    ? Icons.work_outline
                                    : Icons.home_outlined,
                                color: kZomatoRed,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address.contains('—')
                                        ? address.split('—').first.trim()
                                        : address,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    address.contains('—')
                                        ? address.split('—').last.trim()
                                        : 'Saved address',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              store.selectedAddress == address
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: store.selectedAddress == address
                                  ? kZomatoRed
                                  : Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 4),
              OutlinedButton.icon(
                onPressed: () async {
                  final controller = TextEditingController();
                  final added = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('New address'),
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Home — Connaught Place, Delhi',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, controller.text.trim()),
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                  if (added != null && added.isNotEmpty) {
                    store.addAddress(added);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add address'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: kZomatoRed,
                  side: BorderSide(color: Colors.grey.shade300),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
          ),
        );
      },
    );
  }
}

class PaymentsSettingsPage extends StatelessWidget {
  const PaymentsSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const methods = [
      (Icons.qr_code_2, 'UPI', 'Google Pay, PhonePe, Paytm'),
      (Icons.credit_card_outlined, 'Credit / Debit card', 'Visa, Mastercard, RuPay'),
      (Icons.payments_outlined, 'Cash on delivery', 'Pay when your order arrives'),
    ];

    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        return Scaffold(
          backgroundColor: kPageBg,
          appBar: AppBar(
            title: const Text('Payments'),
            backgroundColor: kZomatoRed,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          body: pageShell(
            context: context,
            maxWidth: 720,
            child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Text(
                'Choose a payment method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(
                'Used when you place an order',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              const SizedBox(height: 16),
              for (final method in methods)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () => store.setPaymentMethod(method.$2),
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: store.paymentMethod == method.$2
                                ? kZomatoRed
                                : Colors.grey.shade200,
                            width: store.paymentMethod == method.$2 ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: kZomatoRed.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(method.$1, color: kZomatoRed),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    method.$2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    method.$3,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              store.paymentMethod == method.$2
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: store.paymentMethod == method.$2
                                  ? kZomatoRed
                                  : Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          ),
        );
      },
    );
  }
}

class HelpSettingsPage extends StatelessWidget {
  const HelpSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: kZomatoRed,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: pageShell(
        context: context,
        maxWidth: 720,
        child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _helpCard(
            'How do I place an order?',
            'Open a dish, choose quantity, then tap Order now. It appears in Your orders.',
          ),
          _helpCard(
            'How do I update my address?',
            'Open Settings → Saved addresses, or Account, then save your delivery address.',
          ),
          _helpCard(
            'Where is my wishlist?',
            'Tap the heart on a dish, then open the heart icon in the top bar.',
          ),
        ],
      ),
      ),
    );
  }

  Widget _helpCard(String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(body, style: TextStyle(color: Colors.grey.shade700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ACCOUNT
// ============================================================

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController phone;
  late final TextEditingController address;

  @override
  void initState() {
    super.initState();
    final store = FoodStore.instance;
    name = TextEditingController(text: store.userName);
    email = TextEditingController(text: store.userEmail);
    phone = TextEditingController(text: store.userPhone);
    address = TextEditingController(text: store.selectedAddress);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FoodStore.instance,
      builder: (context, _) {
        final store = FoodStore.instance;
        return pageShell(
          context: context,
          maxWidth: 720,
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFFFEBEE),
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                        color: kZomatoRed,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      store.userName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      store.userPhone,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: kZomatoRed,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            store.selectedAddress,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Personal Information',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phone,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: address,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                store.saveAccount(
                  name: name.text.trim(),
                  email: email.text.trim(),
                  phone: phone.text.trim(),
                );
                store.setSelectedAddress(
                  address.text.trim().isEmpty
                      ? store.selectedAddress
                      : address.text.trim(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account saved')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kZomatoRed,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Save'),
            ),
            const SizedBox(height: 16),
            _accountLink(
              icon: Icons.receipt_long_outlined,
              title: 'Orders',
              subtitle: '${store.orders.length} recent orders',
            ),
            _accountLink(
              icon: Icons.settings_outlined,
              title: 'Settings',
              subtitle: 'Notifications, payments and help',
            ),
            _accountLink(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Sign out of Bite',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out of this device')),
                );
              },
            ),
          ],
        ),
        );
      },
    );
  }

  Widget _accountLink({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          leading: Icon(icon, color: kZomatoRed),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
