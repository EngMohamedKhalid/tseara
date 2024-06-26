part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}
final class HomeCategoriesLoaded extends HomeState {
  @override
  List<Object> get props => [];
}
final class HomeFavLoaded extends HomeState {
  @override
  List<Object> get props => [];
}
final class HomeFavInitial extends HomeState {
  @override
  List<Object> get props => [];
}