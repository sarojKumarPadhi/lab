import '../../../../core/data_layer_exports.dart';

import '../../entities/common_usecase_entites/state_entities.dart';
import '../../repositories/common_api_repository.dart';

class FetchState implements UsecaseWithoutParams<List<StateEntities>> {
  const FetchState(
    this._repository,
  );

  final CommonApiRepository _repository;

  @override
  ResultFutureT<List<StateEntities>> call() async {
    final result = await _repository.getStateRepo();

    return result.fold(
      (l) => Left(l),
      (r) async {
        if (r.statusCode == "200") {
          return Right(r.data?.stateList
                  ?.map(
                    (e) =>
                        StateEntities(name: e.name ?? "N/A", id: e.id ?? "N/A"),
                  )
                  .toList() ??
              []);
        } else {
          return Left(ApiFailure(message: r.msg, code: r.statusCode));
        }
      },
    );
  }
}
