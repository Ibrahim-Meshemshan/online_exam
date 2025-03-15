import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';


import '../../../../auth/login/domain/entities/login_response_entity.dart';
import '../../domain/entity/change_password_entity.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/use_case/change_password_use_case.dart';
import '../../domain/use_case/edit_profile_use_case.dart';
import '../../domain/use_case/get_profile_use_case.dart';

part 'profile_view_model_state.dart';

@injectable
class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  GetProfileUseCase getProfile;
  EditProfileUseCase editProfileUseCase;
  ChangePasswordUseCase changePasswordUseCase;

  ProfileViewModelCubit(
      {required this.getProfile,
      required this.editProfileUseCase,
      required this.changePasswordUseCase})
      : super(ProfileViewModelInitial());

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);
  bool currentIsObscurePassword = true;
  bool newIsObscurePassword = true;
  bool confirmIsObscurePassword = true;

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  UserEntityProfile ? profile;
  
  bool checkValidEmail(String? email) {
    if (email == null) return false;
    var regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }


  void getProfileCubit() async {
    emit(ProfileViewModelLoading());
    var either = await getProfile.call();
    either.fold(
      (failure) {
        emit(ProfileViewModelError(failures: failure));
      },
      (response) {
        profile = response.user;
        emit(ProfileViewModelSuccess(profileEntity: response));
      },
    );
  }

  void updateProfile({required String lastName}) async {
    emit(ProfileViewModelLoading());
    var either = await editProfileUseCase.call(lastNameController.text);
    either.fold(
      (failure) {
        emit(ProfileViewModelError(failures: failure));
      },
      (response) {
        profile = response.user;
        emit(ProfileViewModelSuccess(profileEntity: response));
      },
    );
  }


  void changePassword(String oldPassword, newPassword, confirmPassword) async {
    emit(ChangePasswordViewModelLoading());
    var either = await changePasswordUseCase.call(passwordController.text,
        newPasswordController.text, rePasswordController.text);
    either.fold((l) {
      emit(ChangePasswordViewModelError(failures: l));
    }, (r) {
      emit(ChangePasswordViewModelSuccess(changePasswordEntity: r));
    });
  }

}
