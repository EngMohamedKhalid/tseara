part of 'profile_cubit.dart';
abstract class ProfileState extends Equatable {
  const ProfileState();
}
final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ChangeTheme extends ProfileState {
  @override
  List<Object> get props => [];
}


final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}