part of '../../jeebly_eat_imports.dart';

class EatCategories extends StatefulWidget {
  const EatCategories({super.key});

  static const String _serviceId = '1';

  @override
  State<EatCategories> createState() => _EatCategoriesState();
}

class _EatCategoriesState extends State<EatCategories> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const FetchCategories(serviceId: EatCategories._serviceId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, BaseState<CategoryModel>>(
      builder: (context, state) {
        // Loading
        if (state.status == Status.loading) {
          return SizedBox(
            height: 72.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        // Failure
        if (state.status == Status.failure) {
          return SizedBox(
            height: 72.h,
            child: Center(child: Text(state.errorMessage ?? '')),
          );
        }

        // Empty
        if (state.items.isEmpty) return const SizedBox.shrink();

        // Success
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "categories",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 90.h,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => CategoryCard(item: state.items[index]),
                  separatorBuilder: (_, index) => Gap(9.w),
                  itemCount: state.items.length),
            ),
          ],
        );
        //   Item(
        //   title: AppLocalizations.of(context)!.categories,
        //   imageHeight: 72.h,
        //   itemImages: state.items
        //       .map((category) =>
        //   //     ItemSingleImage(
        //   //   imageHeight: 62.h,
        //   //   imageWidth: 123.w,
        //   //   imageUrl: '',
        //   //   centerText: Localizations.localeOf(context).languageCode == 'ar'
        //   //       ? category.nameAr
        //   //       : category.nameEn,
        //   //   type: 'category',
        //   // )
        //
        //
        //   )
        //       .toList(),
        // );
      },
    );
  }
}


// build category item with image and center text

class CategoryCard extends StatelessWidget {
  final CategoryModel item;

  const CategoryCard({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        context.push(RoutesNames.eatRestaurants,extra: item.id);

        // context.read<CategoryBloc>().add(const FetchRestaurants(serviceId: EatCategories._serviceId));
      },
      child: SizedBox(
        height: 60,
      width: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background Image
              Image.network(
                "${Endpoints.baseUrl}${item.logo}",
                width: double.infinity,
                height:60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  height:60,
                  color: Colors.grey[400],
                ),
              ),
              //. blur widget
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                child: ColoredBox(color: Colors.black12),
              ),
              // Centered Text
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
            context.isArabic ? item.nameAr: item.nameEn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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