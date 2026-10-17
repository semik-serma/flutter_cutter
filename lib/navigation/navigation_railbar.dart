import 'package:flutter/material.dart';

class NavigationRailBarWidget extends StatefulWidget {
  const NavigationRailBarWidget({super.key});

  @override
  State<NavigationRailBarWidget> createState() =>
      _NavigationRailBarWidgetState();
}

class _NavigationRailBarWidgetState extends State<NavigationRailBarWidget> {
  int selectedIndex = 0;
  bool isExpanded = true;

  // --- Design tokens -------------------------------------------------
  static const Color primary = Color(0xFF4F46E5);
  static const Color primarySoft = Color(0xFFEEF2FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF8FAFC);
  static const Color border = Color(0xFFE2E8F0);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textMuted = Color(0xFF64748B);
  static const Color success = Color(0xFF10B981);

  final List<_NavItem> navItems = const [
    _NavItem(
      title: 'Dashboard',
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard_rounded,
    ),
    _NavItem(
      title: 'Search',
      icon: Icons.search_rounded,
      selectedIcon: Icons.manage_search_rounded,
    ),
    _NavItem(
      title: 'Orders',
      icon: Icons.shopping_bag_outlined,
      selectedIcon: Icons.shopping_bag_rounded,
    ),
    _NavItem(
      title: 'Profile',
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
    _NavItem(
      title: 'Settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
    ),
  ];

  late final List<Widget> pages = [
    const _DashboardPage(),
    const _SimplePage(
      title: 'Search',
      description: 'Search your information',
      icon: Icons.search_rounded,
    ),
    const _SimplePage(
      title: 'Orders',
      description: 'Manage your orders',
      icon: Icons.shopping_bag_rounded,
    ),
    const _SimplePage(
      title: 'Profile',
      description: 'Manage your profile',
      icon: Icons.person_rounded,
    ),
    const _SimplePage(
      title: 'Settings',
      description: 'Manage application settings',
      icon: Icons.settings_rounded,
    ),
  ];

  void toggleRail() => setState(() => isExpanded = !isExpanded);

  void selectPage(int index) {
    if (selectedIndex == index) return;
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool compact = constraints.maxWidth < 950;
        final bool expanded = isExpanded && !compact;

        return Scaffold(
          backgroundColor: background,
          body: SafeArea(
            child: Row(
              children: [
                _buildNavigationRail(expanded, compact),
                Container(width: 1, color: border),
                Expanded(
                  child: Column(
                    children: [
                      _buildTopBar(),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 280),
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeInCubic,
                          layoutBuilder: (current, previous) {
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                ...previous,
                                if (current != null) current,
                              ],
                            );
                          },
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.02),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          child: KeyedSubtree(
                            key: ValueKey(selectedIndex),
                            child: pages[selectedIndex],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationRail(bool expanded, bool compact) {
    return Container(
      decoration: const BoxDecoration(
        color: surface,
        boxShadow: [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: selectPage,
        extended: expanded,
        labelType: NavigationRailLabelType.none,
        minWidth: 76,
        minExtendedWidth: 252,
        groupAlignment: -1,
        scrollable: true,
        backgroundColor: surface,
        useIndicator: true,
        indicatorColor: primarySoft,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        selectedIconTheme: const IconThemeData(color: primary, size: 23),
        unselectedIconTheme: const IconThemeData(color: textMuted, size: 22),
        selectedLabelTextStyle: const TextStyle(
          color: primary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
        unselectedLabelTextStyle: const TextStyle(
          color: textMuted,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 28),
          child: Row(
            mainAxisAlignment: expanded
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (expanded) ...[
                const SizedBox(width: 20),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primary, Color(0xFF7C7FF2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.bolt_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
              IconButton(
                tooltip: compact
                    ? 'Compact navigation'
                    : expanded
                    ? 'Collapse navigation'
                    : 'Expand navigation',
                onPressed: compact ? null : toggleRail,
                icon: AnimatedRotation(
                  turns: expanded ? 0 : 0.5,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.menu_open_rounded,
                    size: 24,
                    color: textMuted,
                  ),
                ),
              ),
              if (expanded) const SizedBox(width: 4),
            ],
          ),
        ),
        destinations: navItems.map((item) {
          return NavigationRailDestination(
            padding: const EdgeInsets.symmetric(vertical: 4),
            icon: Tooltip(message: item.title, child: Icon(item.icon)),
            selectedIcon: Icon(item.selectedIcon),
            label: Text(item.title),
          );
        }).toList(),
        trailing: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 8),
          child: expanded
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Text(
                          'All systems normal',
                          style: TextStyle(
                            fontSize: 12,
                            color: textMuted,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: success,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      decoration: const BoxDecoration(
        color: surface,
        border: Border(bottom: BorderSide(color: border)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              navItems[selectedIndex].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: textPrimary,
                letterSpacing: -0.3,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 360),
              height: 42,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: border),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 14),
                  Icon(Icons.search_rounded, size: 19, color: textMuted),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: textMuted, fontSize: 14),
                      ),
                      style: TextStyle(fontSize: 14, color: textPrimary),
                    ),
                  ),
                  SizedBox(width: 14),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          _IconBadgeButton(
            icon: Icons.notifications_none_rounded,
            tooltip: 'Notifications',
            showDot: true,
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('No notifications')));
            },
          ),
          const SizedBox(width: 16),
          Container(width: 1, height: 28, color: border),
          const SizedBox(width: 16),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primary, Color(0xFF7C7FF2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.person_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBadgeButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final bool showDot;
  final VoidCallback onPressed;

  const _IconBadgeButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          tooltip: tooltip,
          icon: Icon(icon, color: const Color(0xFF475569)),
          onPressed: onPressed,
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFFF8FAFC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        if (showDot)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;
  final IconData selectedIcon;

  const _NavItem({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        const Text(
          'Welcome back, Semik 👋',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Here is an overview of your workspace.',
          style: TextStyle(color: Color(0xFF64748B), fontSize: 15),
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final bool stack = constraints.maxWidth < 620;
            final cards = const [
              _StatCard(
                title: 'Total Orders',
                value: '1,240',
                delta: '+12.4%',
                positive: true,
                icon: Icons.shopping_bag_outlined,
                tint: Color(0xFF4F46E5),
              ),
              _StatCard(
                title: 'Customers',
                value: '840',
                delta: '+4.1%',
                positive: true,
                icon: Icons.people_outline_rounded,
                tint: Color(0xFF0EA5E9),
              ),
              _StatCard(
                title: 'Revenue',
                value: 'Rs. 58K',
                delta: '-2.3%',
                positive: false,
                icon: Icons.payments_outlined,
                tint: Color(0xFF10B981),
              ),
            ];
            if (stack) {
              return Column(
                children: [
                  for (final c in cards) ...[c, const SizedBox(height: 16)],
                ],
              );
            }
            return Row(
              children: [
                for (int i = 0; i < cards.length; i++) ...[
                  Expanded(child: cards[i]),
                  if (i != cards.length - 1) const SizedBox(width: 16),
                ],
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Workspace Overview',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your dashboard is ready. Select a destination using the '
                'navigation rail to explore.',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String delta;
  final bool positive;
  final IconData icon;
  final Color tint;

  const _StatCard({
    required this.title,
    required this.value,
    required this.delta,
    required this.positive,
    required this.icon,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: tint.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, color: tint, size: 21),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: positive
                      ? const Color(0xFFECFDF5)
                      : const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  delta,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: positive
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(color: Color(0xFF64748B), fontSize: 13.5),
          ),
        ],
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _SimplePage({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEEF2FF), Color(0xFFE0E7FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Icon(icon, size: 44, color: const Color(0xFF4F46E5)),
            ),
            const SizedBox(height: 22),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 14.5),
            ),
          ],
        ),
      ),
    );
  }
}
