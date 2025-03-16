import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/data/data_sources/remote_data_source_exam_contract.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';

@Injectable(as: RemoteDataSourceExamContract)
class RemoteDataSourceExamImpl implements RemoteDataSourceExamContract {
  ApiManager apiManager;

  RemoteDataSourceExamImpl({required this.apiManager});

  @override
  Future<Either<Failures, AllExamEntity>> getAllExam() async {
    var either = await apiManager.getAllExam();
    return either.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
