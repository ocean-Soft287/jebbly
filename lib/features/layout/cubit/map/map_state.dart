sealed class MapState {}

final class MapInitial extends MapState {}

final class SearchSuccessState extends MapState {}

final class LocationUpdatedState extends MapState {}

final class MapControllerUpdatedState extends MapState {}

final class SearchFailureState extends MapState {
  final String errorMessage;
  SearchFailureState(this.errorMessage);
}