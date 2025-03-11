import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/entity/profile_entity.dart';
import 'package:online_exam/feature/auth/edit_profile/domain/use_case/get_profile_use_case.dart';

part 'profile_view_model_state.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  GetProfileUseCase getProfile;

  ProfileViewModelCubit({required this.getProfile})
      : super(ProfileViewModelInitial());

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UserEntity? profile;

  void getProfileCubit() async {
    emit(ProfileViewModelLoading());
    var either = await getProfile.call();
    either.fold(
      (failure) {
        if (failure is NetworkError) {
          print('Network Error Message: ${failure.errorMessage}');
        } else if (failure is ServerError) {
          print('Server Error Message: ${failure.errorMessage}');
        }
        emit(ProfileViewModelError(failures: failure));
      },
      (response) {
        profile = response.user;
        emit(ProfileViewModelSuccess(profileEntity: response));
      },
    );
  }
}
