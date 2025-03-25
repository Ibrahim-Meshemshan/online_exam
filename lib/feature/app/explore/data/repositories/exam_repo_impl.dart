import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/data/data_sources/remote_data_source_exam_contract.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';
import 'package:online_exam/feature/app/explore/domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  RemoteDataSourceExamContract remoteDataSourceExamContract;

  ExamRepoImpl({required this.remoteDataSourceExamContract});





  @override
  Future<Either<Failures, AllSubjectEntity>> getAllSubject() {
    return remoteDataSourceExamContract.getAllSubject();
  }

  @override
  Future<Either<Failures, AllExamOnSubjectEntity>> getAllExamOnSubject(String subject) {
    return remoteDataSourceExamContract.getAllExamOnSubject(subject);
  }
}
