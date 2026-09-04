import 'package:flutter/material.dart';
import 'analytics.dart';
import 'projects.dart';
import 'team.dart';
import 'settings.dart';

void main() {
  runApp(const NebulaDashboard());
}

class NebulaDashboard extends StatelessWidget {
  const NebulaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nebula Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF314E78),
          brightness: Brightness.light,
        ),
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selected = 0;
  bool glowing = false;

  final List<String> menu = [
    'Overview',
    'Analytics',
    'Projects',
    'Team',
    'Settings',
  ];

  final List<IconData> menuIcons = [
    Icons.dashboard_rounded,
    Icons.auto_graph_rounded,
    Icons.layers_rounded,
    Icons.groups_rounded,
    Icons.settings_rounded,
  ];

  final List<Map<String, dynamic>> stats = [
    {
      'title': 'TOTAL REVENUE',
      'value': '\$84.6K',
      'change': '+18.4%',
      'icon': Icons.account_balance_wallet_rounded,
    },
    {
      'title': 'ACTIVE USERS',
      'value': '12.8K',
      'change': '+24.7%',
      'icon': Icons.people_alt_rounded,
    },
    {
      'title': 'PROJECTS',
      'value': '148',
      'change': '+9.2%',
      'icon': Icons.rocket_launch_rounded,
    },
    {
      'title': 'CONVERSION',
      'value': '76.8%',
      'change': '+12.1%',
      'icon': Icons.bolt_rounded,
    },
  ];

  void openPage(int index) {
    setState(() {
      selected = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AnalyticsPage(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProjectsPage(),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TeamPage(),
        ),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = width < 700;
    final tablet = width >= 700 && width < 1100;
    final columns = mobile ? 1 : tablet ? 2 : 4;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (!mobile) _sideBar(tablet),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(mobile ? 18 : 30),
                children: [
                  _topBar(mobile),
                  const SizedBox(height: 25),
                  _heroSection(mobile),
                  const SizedBox(height: 25),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: stats.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: mobile ? 2.6 : 1.45,
                    ),
                    itemBuilder: (context, index) {
                      return _animatedStatCard(stats[index], index);
                    },
                  ),
                  const SizedBox(height: 25),
                  if (mobile)
                    Column(
                      children: [
                        _performanceCard(),
                        const SizedBox(height: 18),
                        _activityCard(),
                      ],
                    )
                  else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _performanceCard(),
                        ),
                        const SizedBox(width: 18),
                        Flexible(
                          flex: 2,
                          child: _activityCard(),
                        ),
                      ],
                    ),
                  const SizedBox(height: 25),
                  _projectSection(mobile),
                  const SizedBox(height: 25),
                  _bottomSection(mobile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sideBar(bool tablet) {
    return Container(
      width: tablet ? 88 : 235,
      margin: const EdgeInsets.all(18),
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF162238),
            Color(0xFF203552),
            Color(0xFF142B3D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40243B53),
            blurRadius: 30,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  height: 58,
                  width: 58,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFE9C46A),
                        Color(0xFFF4A261),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x66E9C46A),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.auto_awesome_rounded,
                    color: Color(0xFF162238),
                    size: 30,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          if (!tablet)
            const Text(
              'NEBULA',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
                color: Colors.white,
              ),
            ),
          const SizedBox(height: 35),
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final active = selected == index;

                return GestureDetector(
                  onTap: () => openPage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutBack,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      gradient: active
                          ? const LinearGradient(
                              colors: [
                                Color(0xFFE9C46A),
                                Color(0xFFF4A261),
                              ],
                            )
                          : null,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: active
                          ? const [
                              BoxShadow(
                                color: Color(0x47E9C46A),
                                blurRadius: 18,
                              ),
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          menuIcons[index],
                          color: active
                              ? const Color(0xFF162238)
                              : const Color(0xFFA9B8CA),
                        ),
                        if (!tablet) ...[
                          const SizedBox(width: 12),
                          Text(
                            menu[index],
                            style: TextStyle(
                              color: active
                                  ? const Color(0xFF162238)
                                  : const Color(0xFFA9B8CA),
                              fontWeight: active
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 105,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: const DecorationImage(
                image: AssetImage('lib/assets/office.jpg'),
                fit: BoxFit.cover,
                opacity: 0.35,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.nightlight_round,
                size: 35,
                color: Color(0xFFE9C46A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar(bool mobile) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GOOD MORNING, PARTH ✦',
                style: TextStyle(
                  color: const Color(0xFFC76D52),
                  fontSize: mobile ? 11 : 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Your command centre',
                style: TextStyle(
                  fontSize: mobile ? 24 : 31,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF162238),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color(0xFFD8DEE8),
            ),
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                glowing = !glowing;
              });
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                glowing
                    ? Icons.notifications_active_rounded
                    : Icons.notifications_none_rounded,
                key: ValueKey<bool>(glowing),
                color: glowing
                    ? const Color(0xFFC76D52)
                    : const Color(0xFF52647A),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('lib/assets/laptop.jpg'),
        ),
      ],
    );
  }

  Widget _heroSection(bool mobile) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 25 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        height: mobile ? 365 : 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF203A5F),
              Color(0xFF315C73),
              Color(0xFF39756B),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40315C73),
              blurRadius: 35,
              offset: Offset(0, 15),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -60,
              top: -70,
              child: Container(
                height: 230,
                width: 230,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0x1FE9C46A),
                ),
              ),
            ),
            Positioned(
              right: mobile ? -20 : 25,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.circular(32),
                ),
                child: Image.asset(
                  'lib/assets/dashboard.jpg',
                  width: mobile ? 170 : 310,
                  height: mobile ? 175 : 245,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(mobile ? 24 : 35),
              child: SizedBox(
                width: mobile ? 220 : 430,
                height: mobile ? 310 : 240,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x29E9C46A),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0x80E9C46A),
                        ),
                      ),
                      child: const Text(
                        '✦ LIVE SYSTEM',
                        style: TextStyle(
                          color: Color(0xFFF7D98A),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Build the future\nfrom one screen.',
                      style: TextStyle(
                        fontSize: mobile ? 27 : 38,
                        height: 1.05,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Everything important is moving in the right direction.',
                      style: TextStyle(
                        color: const Color(0xFFD8E2E8),
                        fontSize: mobile ? 12 : 15,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    FilledButton.icon(
                      onPressed: () {
                        setState(() {
                          glowing = !glowing;
                        });
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFFE9C46A),
                        foregroundColor: const Color(0xFF203A5F),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(Icons.insights_rounded),
                      label: const Text('VIEW INSIGHTS'),
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

  Widget _animatedStatCard(
    Map<String, dynamic> data,
    int index,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + index * 150),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFD9E0EA),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14253B53),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE9C46A),
                    Color(0xFFF4A261),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: Icon(
                data['icon'] as IconData,
                color: const Color(0xFF203A5F),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['title'] as String,
                    style: const TextStyle(
                      color: Color(0xFF78879A),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    data['value'] as String,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF162238),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data['change'] as String,
                    style: const TextStyle(
                      color: Color(0xFF278C72),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
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

  Widget _performanceCard() {
    final values = [
      0.35,
      0.55,
      0.42,
      0.72,
      0.61,
      0.88,
      0.76,
      0.95,
    ];

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFD9E0EA),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F253B53),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PERFORMANCE PULSE',
                      style: TextStyle(
                        color: Color(0xFF78879A),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '92.4%',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF162238),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0x19278C72),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.trending_up_rounded,
                  color: Color(0xFF278C72),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 170,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: values.map((value) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: value),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOutBack,
                      builder: (context, animated, child) {
                        return FractionallySizedBox(
                          heightFactor: animated,
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF203A5F),
                                  Color(0xFF39756B),
                                  Color(0xFFE9C46A),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('MON', style: TextStyle(color: Color(0xFF78879A))),
              Text('TUE', style: TextStyle(color: Color(0xFF78879A))),
              Text('WED', style: TextStyle(color: Color(0xFF78879A))),
              Text('THU', style: TextStyle(color: Color(0xFF78879A))),
              Text('FRI', style: TextStyle(color: Color(0xFF78879A))),
              Text('SAT', style: TextStyle(color: Color(0xFF78879A))),
              Text('SUN', style: TextStyle(color: Color(0xFF78879A))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _activityCard() {
    final activities = [
      [
        'Revenue target reached',
        Icons.emoji_events_rounded,
        '2m ago',
      ],
      [
        'New project created',
        Icons.rocket_launch_rounded,
        '18m ago',
      ],
      [
        'Team sync completed',
        Icons.groups_rounded,
        '42m ago',
      ],
      [
        'Analytics updated',
        Icons.auto_graph_rounded,
        '1h ago',
      ],
    ];

    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFD9E0EA),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F253B53),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'RECENT ACTIVITY',
            style: TextStyle(
              color: Color(0xFF78879A),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          ...activities.map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 13),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0x19203A5F),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      item[1] as IconData,
                      size: 20,
                      color: const Color(0xFFC76D52),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item[0] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF26364A),
                      ),
                    ),
                  ),
                  Text(
                    item[2] as String,
                    style: const TextStyle(
                      color: Color(0xFF78879A),
                      fontSize: 10,
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

  Widget _projectSection(bool mobile) {
    final projects = [
      [
        'NOVA AI',
        'AI Platform',
        'lib/assets/team.jpg',
        0.82,
      ],
      [
        'ORBIT',
        'Mobile Experience',
        'lib/assets/workspace.jpg',
        0.64,
      ],
      [
        'AURORA',
        'Data Visualisation',
        'lib/assets/laptop.jpg',
        0.91,
      ],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ACTIVE PROJECTS',
          style: TextStyle(
            color: Color(0xFF78879A),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 14),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mobile ? 1 : 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: mobile ? 2.1 : 1.35,
          ),
          itemBuilder: (context, index) {
            final project = projects[index];

            return TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(
                milliseconds: 600 + index * 150,
              ),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFFD9E0EA),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0F253B53),
                      blurRadius: 18,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        project[2] as String,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project[0] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF162238),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              project[1] as String,
                              style: const TextStyle(
                                color: Color(0xFF78879A),
                                fontSize: 11,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10),
                                    child: LinearProgressIndicator(
                                      value: project[3] as double,
                                      minHeight: 7,
                                      backgroundColor:
                                          const Color(0xFFE3E8EF),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Color(0xFFC76D52),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${((project[3] as double) * 100).round()}%',
                                  style: const TextStyle(
                                    color: Color(0xFFC76D52),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
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
          },
        ),
      ],
    );
  }

  Widget _bottomSection(bool mobile) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF203A5F),
            Color(0xFF315C73),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33203A5F),
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bottomText(),
                const SizedBox(height: 20),
                _bottomImage(),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _bottomText(),
                ),
                Flexible(
                  flex: 2,
                  child: _bottomImage(),
                ),
              ],
            ),
    );
  }

  Widget _bottomText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TEAM ENERGY',
          style: TextStyle(
            color: Color(0xFFE9C46A),
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Your team is in\ncreative overdrive.',
          style: TextStyle(
            fontSize: 27,
            height: 1.1,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          '12 members are active right now. Keep the momentum going.',
          style: TextStyle(
            color: Color(0xFFD8E2E8),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        FilledButton(
          onPressed: () {
            openPage(3);
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFE9C46A),
            foregroundColor: const Color(0xFF203A5F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'OPEN TEAM SPACE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _bottomImage() {
    return Container(
      height: 170,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        image: const DecorationImage(
          image: AssetImage('lib/assets/workspace.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          gradient: const LinearGradient(
            colors: [
              Color(0x1A203A5F),
              Color(0xBF203A5F),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.groups_3_rounded,
            size: 60,
            color: Color(0xFFE9C46A),
          ),
        ),
      ),
    );
  }
}