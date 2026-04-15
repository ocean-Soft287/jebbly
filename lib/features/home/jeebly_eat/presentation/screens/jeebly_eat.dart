part of '../../jeebly_eat_imports.dart';

class JeeblyEat extends StatefulWidget {
  const JeeblyEat({super.key});

  @override
  State<JeeblyEat> createState() => _JeeblyEatState();
}

class _JeeblyEatState extends State<JeeblyEat> {
  @override
  void initState() {
    super.initState();
    // Create scroll controller without pagination listeners
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            EatCategories(),
            Gap(12.h),
            HighRatedRestaurants(),
            Gap(12.h),
            AllRestaurants()
          ],
        ),
      ),
    );
  }
}
