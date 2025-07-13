import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeebly_mobile/features/home/categories/cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  int selectedCategoryIndex = 0;
  selectCategory(int index) {
    selectedCategoryIndex = index;
    emit(SelectedCategoryChangedState());
  }
}
