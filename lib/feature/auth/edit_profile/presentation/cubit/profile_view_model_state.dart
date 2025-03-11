part of 'profile_view_model_cubit.dart';

class ProfileViewModelState {}

final class ProfileViewModelInitial extends ProfileViewModelState {}

final class ProfileViewModelLoading extends ProfileViewModelState {}

final class ProfileViewModelError extends ProfileViewModelState {
  Failures failures;
  ProfileViewModelError({required this.failures});
}

final class ProfileViewModelSuccess extends ProfileViewModelState {
  ProfileEntity profileEntity;
  ProfileViewModelSuccess({required this.profileEntity});
}
