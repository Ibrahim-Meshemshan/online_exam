import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/data/data_sources/contract/remote_data_source_exam_contract.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';

@Injectable(as: RemoteDataSourceExamContract)
class RemoteDataSourceExamImpl implements RemoteDataSourceExamContract {
  ApiManager apiManager;

  RemoteDataSourceExamImpl({required this.apiManager});

  @override
  Future<Either<Failures, AllExamOnSubjectEntity>> getAllExamOnSubject(String subjectId) async {
    var either = await apiManager.getAllExamOnSubject(subjectId);
    return either.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }



  @override
  Future<Either<Failures, AllSubjectEntity>> getAllSubject() async {
    var either = await apiManager.getAllSubject();
    return either.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
