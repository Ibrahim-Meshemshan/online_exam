import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';
import 'package:online_exam/feature/app/explore/domain/repositories/exam_repo.dart';

@injectable
class GetAllExamOnSubjectUseCase {
  ExamRepo examRepo;
  GetAllExamOnSubjectUseCase({required this.examRepo});

  Future<Either<Failures, AllExamOnSubjectEntity>> call(String subject){
    return examRepo.getAllExamOnSubject(subject);
  }
}