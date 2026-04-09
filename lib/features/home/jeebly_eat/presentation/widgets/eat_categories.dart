part of '../../jeebly_eat_imports.dart';

class EatCategories extends StatefulWidget {
  const EatCategories({super.key});

  // ← base URL لإكمال مسار الصورة القادمة من الـ API
  static const String _baseImageUrl = Endpoints.baseUrl;
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
        return Item(
          title: AppLocalizations.of(context)!.categories,
          imageHeight: 72.h,
          itemImages: state.items
              .map((category) => ItemSingleImage(
            imageHeight: 62.h,
            imageWidth: 123.w,
            imageUrl: '${EatCategories._baseImageUrl}${category.logo}',
            centerText: Localizations.localeOf(context).languageCode == 'ar'
                ? category.nameAr
                : category.nameEn,
            type: 'category',
          ))
              .toList(),
        );
      },
    );
  }
}

