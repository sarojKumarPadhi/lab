import '../../../../core/data_layer_exports.dart';

import '../../entities/common_usecase_entites/bank_entities.dart';
import '../../repositories/common_api_repository.dart';

class FetchBanks implements UsecaseWithoutParams<List<BankEntites>> {
  const FetchBanks(
    this._repository,
  );

  final CommonApiRepository _repository;

  @override
  ResultFutureT<List<BankEntites>> call() async {
    final result = await _repository.getBanksRepo();

    return result.fold(
      (l) => Left(l),
      (r) async {
        if (r.statusCode == "200") {
          return Right(r.data?.bankList
                  ?.map(
                    (e) =>
                        BankEntites(name: e.name ?? "N/A", id: e.id ?? "N/A"),
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
