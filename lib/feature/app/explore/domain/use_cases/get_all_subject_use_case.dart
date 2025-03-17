
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';

import '../../../../../core/utils/failures.dart';
import '../repositories/exam_repo.dart';

@injectable
class GetAllSubjectEntity {
  ExamRepo examRepo;
  GetAllSubjectEntity({required this.examRepo});

  Future<Either<Failures, AllSubjectEntity>> call(){
    return examRepo.getAllSubject();
  }
}