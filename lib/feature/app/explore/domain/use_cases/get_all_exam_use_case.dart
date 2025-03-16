import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';
import 'package:online_exam/feature/app/explore/domain/repositories/exam_repo.dart';

@injectable
class GetAllExamUseCase {
  ExamRepo examRepo;
  GetAllExamUseCase({required this.examRepo});

  Future<Either<Failures, AllExamEntity>> call(){
    return examRepo.getAllExam();
  }
}