part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}
final class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}
final class CategorySearchLoading extends CategoryState {
  @override
  List<Object> get props => [];
}


