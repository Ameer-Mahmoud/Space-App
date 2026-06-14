import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';
import 'package:space/data/planet_data.dart';
import 'package:space/screens/detail_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int currentIndex = 0;
  late AnimationController _colorCtrl;
  late Animation<Color?> _bgAnim;
  Color _currentColor = planets[0].accentColor;
  Color _nextColor = planets[0].accentColor;

  @override
  void initState() {
    super.initState();
    _colorCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _bgAnim = ColorTween(begin: _currentColor, end: _nextColor)
        .animate(_colorCtrl);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _colorCtrl.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _currentColor = planets[currentIndex].accentColor;
    _nextColor = planets[index].accentColor;
    _bgAnim = ColorTween(begin: _currentColor, end: _nextColor)
        .animate(_colorCtrl);
    _colorCtrl.forward(from: 0);
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBuilder(
        animation: _colorCtrl,
        builder: (context, child) {
          final accent = _bgAnim.value ?? planets[currentIndex].accentColor;
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 1.2,
                    colors: [
                      accent.withOpacity(0.18),
                      AppColors.background,
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TopBar(),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Which planet",
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "to explore?",
                            style: AppTextStyles.title,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: planets.length,
                        onPageChanged: _onPageChanged,
                        itemBuilder: (context, index) {
                          return _PlanetCard(
                            index: index,
                            currentIndex: currentIndex,
                            pageController: _pageController,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    _DotsIndicator(
                      count: planets.length,
                      current: currentIndex,
                      accent: accent,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _PlanetName(
                        name: planets[currentIndex].name,
                        accent: accent,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _NavigationRow(
                      currentIndex: currentIndex,
                      accent: accent,
                      onBack: () {
                        if (currentIndex > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      onForward: () {
                        if (currentIndex < planets.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      onExplore: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, a, b) =>
                                DetailPage(planet: planets[currentIndex]),
                            transitionsBuilder: (_, a, b, child) =>
                                FadeTransition(opacity: a, child: child),
                            transitionDuration:
                                const Duration(milliseconds: 350),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 20),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.cardBg,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text("Explore", style: AppTextStyles.title),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class _PlanetCard extends StatelessWidget {
  final int index;
  final int currentIndex;
  final PageController pageController;

  const _PlanetCard({
    required this.index,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;
    return AnimatedScale(
      scale: isActive ? 1.0 : 0.85,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: isActive ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 300),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(
            planets[index].image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int current;
  final Color accent;

  const _DotsIndicator({
    required this.count,
    required this.current,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(count, (i) {
          final isActive = i == current;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isActive ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? accent : AppColors.divider,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }
}

class _PlanetName extends StatelessWidget {
  final String name;
  final Color accent;

  const _PlanetName({required this.name, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
        ),
        const SizedBox(width: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, anim) =>
              FadeTransition(opacity: anim, child: child),
          child: Text(
            name,
            key: ValueKey(name),
            style: AppTextStyles.title.copyWith(fontSize: 28),
          ),
        ),
      ],
    );
  }
}

class _NavigationRow extends StatelessWidget {
  final int currentIndex;
  final Color accent;
  final VoidCallback onBack;
  final VoidCallback onForward;
  final VoidCallback onExplore;

  const _NavigationRow({
    required this.currentIndex,
    required this.accent,
    required this.onBack,
    required this.onForward,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          _NavBtn(
            icon: Icons.arrow_back_rounded,
            onTap: onBack,
            enabled: currentIndex > 0,
            accent: accent,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onExplore,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accent, accent.withOpacity(0.7)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: AppTextStyles.fontFamily,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _NavBtn(
            icon: Icons.arrow_forward_rounded,
            onTap: onForward,
            enabled: currentIndex < planets.length - 1,
            accent: accent,
          ),
        ],
      ),
    );
  }
}

class _NavBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;
  final Color accent;

  const _NavBtn({
    required this.icon,
    required this.onTap,
    required this.enabled,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: enabled ? accent.withOpacity(0.15) : AppColors.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: enabled ? accent.withOpacity(0.4) : AppColors.divider,
          ),
        ),
        child: Icon(
          icon,
          color: enabled ? accent : AppColors.textSecondary,
          size: 22,
        ),
      ),
    );
  }
}
