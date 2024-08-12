import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data_layer_exports.dart';
import '../../repositories/common_api_repository.dart';

class UploadDocUseCase
    implements UsecaseWithParams<List<String>, UploadDocParam> {
  UploadDocUseCase(this._commonApiRepository);
  final CommonApiRepository _commonApiRepository;
  @override
  ResultFutureT<List<String>> call(UploadDocParam params) async {
    return await _commonApiRepository.uploadDocRepo(params.data).then(
      (value) {
        return value.fold(
          (l) => Left(l),
          (r) => Right(r.data?.url ?? []),
        );
      },
    );
  }
}

class UploadDocParam extends Equatable {
  final List<File> data;

  const UploadDocParam({required this.data});

  @override
  List<Object?> get props => [data];
}
