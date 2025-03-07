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
    gh.singleton<_i732.RemoteDataSourceContract>(
        () => _i447.RemoteDataSourceImpl(apiManager: gh<_i266.ApiManager>()));
    gh.factory<_i1053.ContractDataSource>(
        () => _i1057.RemoteRegisterDataSource(gh<_i266.ApiManager>()));
    gh.factory<_i516.RegisterRepo>(
        () => _i811.RegisterRepoImpl(gh<_i1053.ContractDataSource>()));
    gh.factory<_i218.AuthRepo>(() => _i394.AuthRepoImpl(
        remoteDataSourceContract: gh<_i732.RemoteDataSourceContract>()));
    gh.factory<_i763.LoginUseCase>(
        () => _i763.LoginUseCase(authRepo: gh<_i218.AuthRepo>()));
    gh.factory<_i644.AuthViewModelCubit>(
        () => _i644.AuthViewModelCubit(loginUseCase: gh<_i763.LoginUseCase>()));
    gh.factory<_i194.RegisterUseCase>(
        () => _i194.RegisterUseCase(gh<_i516.RegisterRepo>()));
    gh.factory<_i469.RegisterCubit>(() =>
        _i469.RegisterCubit(registerUseCase: gh<_i194.RegisterUseCase>()));
    return this;
  }
}
