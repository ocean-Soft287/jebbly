part of '../../jeebly_eat_imports.dart';

class CategoryBloc extends Bloc<CategoryEvent, BaseState<CategoryModel>> {
  final CategoryDataSource _categoryDataSource;

  CategoryBloc(this._categoryDataSource) : super(const BaseState()) {
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchCategories(
      FetchCategories event,
      Emitter<BaseState<CategoryModel>> emit,
      ) async {
    emit(state.copyWith(status: Status.loading));

    final result = await _categoryDataSource.getCategories(
      serviceId: event.serviceId,
    );

    result.fold(
          (failure) => emit(state.copyWith(
        status: Status.failure,
        errorMessage: failure.message,
      )),
          (categories) => emit(state.copyWith(
        status: Status.success,
        items: categories,
      )),
    );
  }
}