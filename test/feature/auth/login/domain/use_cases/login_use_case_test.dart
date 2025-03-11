import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/auth/login/domain/entities/login_response_entity.dart';
import 'package:online_exam/feature/auth/login/domain/repositories/auth_repo.dart';
import 'package:online_exam/feature/auth/login/domain/use_cases/login_use_case.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepo mockLogin;
  setUpAll(
    () {
      mockLogin = MockAuthRepo();
      loginUseCase = LoginUseCase(authRepo: mockLogin);
    },
  );

  test(
    'Test for login success',
    () async {
      String email = 'asd@gmail.com';
      String password = '123456';
      //Arrange
      provideDummy<LoginResponseEntity>(LoginResponseEntity());

      when(mockLogin.login(any, any)).thenAnswer(
        (realInvocation) async => Right(LoginResponseEntity()),
      );
      //Act
      final result = await loginUseCase.call(email, password);

      //Assert
      expect(result, isA<Right<Failures, LoginResponseEntity>>());
      expect(result.getOrElse(() => throw Exception()), isA<LoginResponseEntity>());
      verify(mockLogin.login(email, password)).called(1);
    },
  );

  test(
    'Test for login error',
        () async {
      String email = 'asd@gmail.com';
      String password = '123456';

      //Arrange
      provideDummy<Failures>(Failures(errorMessage: "An error occurred"));

      when(mockLogin.login(any, any)).thenAnswer(
            (realInvocation) async => Left(Failures(errorMessage: "Invalid credentials")),
      );

      //Act
      final result = await loginUseCase.call(email, password);

      //Assert
      expect(result, isA<Left<Failures, LoginResponseEntity>>());


      result.fold(
            (failure) => expect(failure, isA<Failures>()),
            (success) => fail("Expected Left but got Right"),
      );

      verify(mockLogin.login(email, password)).called(1);
    },
  );

}
