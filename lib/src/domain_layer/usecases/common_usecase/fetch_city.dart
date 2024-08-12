import '../../../../core/data_layer_exports.dart';

import '../../entities/common_usecase_entites/city_entities.dart';
import '../../repositories/common_api_repository.dart';

class FetchCity implements UsecaseWithParams<List<CityEntites>, String> {
  const FetchCity(
    this._repository,
  );

  final CommonApiRepository _repository;

  @override
  ResultFutureT<List<CityEntites>> call(String id) async {
    final result = await _repository.getCityRepo(id);

    return result.fold(
      (l) => Left(l),
      (r) async {
        if (r.statusCode == "200") {
          return Right(r.data?.cityList
                  ?.map(
                    (e) =>
                        CityEntites(name: e.name ?? "N/A", id: e.id ?? "N/A"),
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
