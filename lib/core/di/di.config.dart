// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/app/explore/data/data_sources/contract/get_all_question_contract.dart'
    as _i959;
import '../../feature/app/explore/data/data_sources/contract/remote_data_source_exam_contract.dart'
    as _i789;
import '../../feature/app/explore/data/data_sources/remote/get_all_question_impl.dart'
    as _i507;
import '../../feature/app/explore/data/data_sources/remote/remote_data_source_exam_impl.dart'
    as _i598;
import '../../feature/app/explore/data/repositories/exam_question_repo_impl.dart'
    as _i564;
import '../../feature/app/explore/data/repositories/exam_repo_impl.dart'
    as _i368;
import '../../feature/app/explore/domain/repositories/exam_question_repo.dart'
    as _i206;
import '../../feature/app/explore/domain/repositories/exam_repo.dart' as _i449;
import '../../feature/app/explore/domain/use_cases/get_all_exam_use_case.dart'
    as _i9;
import '../../feature/app/explore/domain/use_cases/get_all_questions_use_case.dart'
    as _i635;
import '../../feature/app/explore/domain/use_cases/get_all_exam_on_subject_use_case.dart'
    as _i630;
import '../../feature/app/explore/domain/use_cases/get_all_subject_use_case.dart'
    as _i617;
import '../../feature/app/explore/presentation/cubit/exam_cubit.dart' as _i168;
import '../../feature/app/explore/presentation/cubit/question/question_cubit.dart'
    as _i35;
import '../../feature/app/profile/data/data_source/contract/remote_data_source_contract.dart'
    as _i937;
import '../../feature/app/profile/data/data_source/remote/remote_data_source_impl.dart'
    as _i650;
import '../../feature/app/profile/data/repository/profile_repo_impl.dart'
    as _i233;
import '../../feature/app/profile/domain/repository/profile_repo.dart' as _i682;
import '../../feature/app/profile/domain/use_case/change_password_use_case.dart'
    as _i443;
import '../../feature/app/profile/domain/use_case/edit_profile_use_case.dart'
    as _i975;
import '../../feature/app/profile/domain/use_case/get_profile_use_case.dart'
    as _i385;
import '../../feature/app/profile/presentation/cubit/profile_view_model_cubit.dart'
    as _i348;
import '../../feature/auth/confirmation/email_verification/data/data_sources/remote_email_verify_data_source_contract.dart'
    as _i882;
import '../../feature/auth/confirmation/email_verification/data/data_sources/remote_email_verify_data_source_impl.dart'
    as _i974;
import '../../feature/auth/confirmation/email_verification/data/repositories/email_verify_repo_impl.dart'
    as _i897;
import '../../feature/auth/confirmation/email_verification/domain/repositories/email_verify_repo_contract.dart'
    as _i673;
import '../../feature/auth/confirmation/email_verification/domain/use_cases/email_verify_use_case.dart'
    as _i484;
import '../../feature/auth/confirmation/email_verification/presentation/cubit/email_verify_cubit.dart'
    as _i398;
import '../../feature/auth/confirmation/forget_password/data/data_sources/forget_data_source_contract.dart'
    as _i408;
import '../../feature/auth/confirmation/forget_password/data/data_sources/forget_data_source_impl.dart'
    as _i458;
import '../../feature/auth/confirmation/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i428;
import '../../feature/auth/confirmation/forget_password/domain/repositories/forget_password_repo_contract.dart'
    as _i541;
import '../../feature/auth/confirmation/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i774;
import '../../feature/auth/confirmation/forget_password/presentation/cubit/forget_password_cubit.dart'
    as _i322;
import '../../feature/auth/login/data/data_sources/contract/remote_data_source_contract.dart'
    as _i732;
import '../../feature/auth/login/data/data_sources/remote/remote_data_source_impl.dart'
    as _i447;
import '../../feature/auth/login/data/repositories/auth_repo_impl.dart'
    as _i394;
import '../../feature/auth/login/domain/repositories/auth_repo.dart' as _i218;
import '../../feature/auth/login/domain/use_cases/login_use_case.dart' as _i763;
import '../../feature/auth/login/presentation/cubit/login_view_model_cubit.dart'
    as _i644;
import '../../feature/auth/register/data/datasources/contract/contract_data_sourc.dart'
    as _i1053;
import '../../feature/auth/register/data/datasources/remote/remote_data_source.dart'
    as _i1057;
import '../../feature/auth/register/data/repositories/register_repo_impl.dart'
    as _i811;
import '../../feature/auth/register/domain/repositories/register_repo.dart'
    as _i516;
import '../../feature/auth/register/domain/usecases/register_usecase.dart'
    as _i194;
import '../../feature/auth/register/presentation/cubit/register_cubit.dart'
    as _i469;
import '../api_manager/api_manager.dart' as _i266;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i266.ApiManager>(() => _i266.ApiManager());
    gh.factory<_i959.ExamQuestionsContract>(
        () => _i507.ExamQuestionFetcherImpl(gh<_i266.ApiManager>()));
    gh.factory<_i789.RemoteDataSourceExamContract>(() =>
        _i598.RemoteDataSourceExamImpl(apiManager: gh<_i266.ApiManager>()));
    gh.singleton<_i882.RemoteVerifyDatasourceContract>(
        () => _i974.RemoteVerifyDatasourceImpl(gh<_i266.ApiManager>()));
    gh.singleton<_i732.RemoteDataSourceContract>(
        () => _i447.RemoteDataSourceImpl(apiManager: gh<_i266.ApiManager>()));
    gh.factory<_i206.ExamQuestionFetcherRepo>(() =>
        _i564.ExamQuestionFetcherRepoImpl(gh<_i959.ExamQuestionsContract>()));
    gh.singleton<_i937.RemoteDataSourceContractProfile>(() =>
        _i650.RemoteDataSourceProfileImpl(apiManager: gh<_i266.ApiManager>()));
    gh.factory<_i449.ExamRepo>(() => _i368.ExamRepoImpl(
        remoteDataSourceExamContract:
            gh<_i789.RemoteDataSourceExamContract>()));
    gh.factory<_i682.ProfileRepo>(() => _i233.ProfileRepoImpl(
        remoteDataSourceContract: gh<_i937.RemoteDataSourceContractProfile>()));
    gh.factory<_i9.GetAllExamUseCase>(
        () => _i9.GetAllExamUseCase(examRepo: gh<_i449.ExamRepo>()));
    gh.factory<_i443.ChangePasswordUseCase>(() =>
        _i443.ChangePasswordUseCase(profileRepo: gh<_i682.ProfileRepo>()));
    gh.factory<_i975.EditProfileUseCase>(
        () => _i975.EditProfileUseCase(profileRepo: gh<_i682.ProfileRepo>()));
    gh.factory<_i385.GetProfileUseCase>(
        () => _i385.GetProfileUseCase(profileRepo: gh<_i682.ProfileRepo>()));
    gh.factory<_i1053.ContractDataSource>(
        () => _i1057.RemoteRegisterDataSource(gh<_i266.ApiManager>()));
    gh.factory<_i168.ExamCubit>(
        () => _i168.ExamCubit(getAllExamUseCase: gh<_i9.GetAllExamUseCase>()));
    gh.singleton<_i408.RemoteForgetDatasourceContract>(() =>
        _i458.RemoteForgetDatasourceImpl(apiManager: gh<_i266.ApiManager>()));
    gh.singleton<_i541.ForgetPasswordRepoContract>(() =>
        _i428.ForgetPasswordRepoImpl(
            gh<_i408.RemoteForgetDatasourceContract>()));
    gh.factory<_i516.RegisterRepo>(
        () => _i811.RegisterRepoImpl(gh<_i1053.ContractDataSource>()));
    gh.factory<_i635.GetAllQuestionsUseCase>(() =>
        _i635.GetAllQuestionsUseCase(gh<_i206.ExamQuestionFetcherRepo>()));
    gh.factory<_i35.QuestionCubit>(
        () => _i35.QuestionCubit(gh<_i635.GetAllQuestionsUseCase>()));
    gh.factory<_i218.AuthRepo>(() => _i394.AuthRepoImpl(
        remoteDataSourceContract: gh<_i732.RemoteDataSourceContract>()));
    gh.singleton<_i673.VerifyEmailRepoContract>(() =>
        _i897.VerifyEmailRepoImpl(gh<_i882.RemoteVerifyDatasourceContract>()));
    gh.factory<_i484.VerifyEmailUseCase>(() => _i484.VerifyEmailUseCase(
        verifyEmailRepoContract: gh<_i673.VerifyEmailRepoContract>()));
    gh.factory<_i774.ForgetPasswordUseCase>(() => _i774.ForgetPasswordUseCase(
        forgetPasswordRepoContract: gh<_i541.ForgetPasswordRepoContract>()));
    gh.factory<_i348.ProfileViewModelCubit>(() => _i348.ProfileViewModelCubit(
          getProfile: gh<_i385.GetProfileUseCase>(),
          editProfileUseCase: gh<_i975.EditProfileUseCase>(),
          changePasswordUseCase: gh<_i443.ChangePasswordUseCase>(),
        ));
    gh.factory<_i398.EmailVerificationViewModel>(
        () => _i398.EmailVerificationViewModel(gh<_i484.VerifyEmailUseCase>()));
    gh.factory<_i763.LoginUseCase>(
        () => _i763.LoginUseCase(authRepo: gh<_i218.AuthRepo>()));
    gh.factory<_i644.AuthViewModelCubit>(
        () => _i644.AuthViewModelCubit(loginUseCase: gh<_i763.LoginUseCase>()));
    gh.factory<_i449.ExamRepo>(() => _i368.ExamRepoImpl(
        remoteDataSourceExamContract:
            gh<_i665.RemoteDataSourceExamContract>()));
    gh.factory<_i617.GetAllSubjectEntity>(
        () => _i617.GetAllSubjectEntity(examRepo: gh<_i449.ExamRepo>()));
    gh.factory<_i630.GetAllExamOnSubjectUseCase>(
        () => _i630.GetAllExamOnSubjectUseCase(examRepo: gh<_i449.ExamRepo>()));
    gh.factory<_i168.ExamCubit>(() => _i168.ExamCubit(
          getAllExamOnSubjectUseCase: gh<_i630.GetAllExamOnSubjectUseCase>(),
          getAllSubjectEntity: gh<_i617.GetAllSubjectEntity>(),
        ));
    gh.factory<_i194.RegisterUsecase>(
        () => _i194.RegisterUsecase(gh<_i516.RegisterRepo>()));
    gh.factory<_i469.RegisterCubit>(
        () => _i469.RegisterCubit(gh<_i194.RegisterUsecase>()));
    gh.factory<_i322.ForgetPasswordCubit>(
        () => _i322.ForgetPasswordCubit(gh<_i774.ForgetPasswordUseCase>()));
    return this;
  }
}
