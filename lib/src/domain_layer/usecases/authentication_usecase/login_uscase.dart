import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../../entities/authentication_entities/login_entities.dart';
import '../../repositories/authentication_repository.dart';

class LoginUserUseCase
    extends UsecaseWithParams<LoginEntities, LoginUserParams> {
  const LoginUserUseCase(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFutureT<LoginEntities> call(LoginUserParams params) async {
    final result = await _repository.loginUser(mobile: params.mobile);

    return result.fold(
      (l) => Left(l),
      (r) => Right(LoginEntities(
          verificationId: r.data?.verificationId ?? "",
          resendToken: r.data?.resendToken,
          mobileNo: params.mobile)),
    );
  }
}

class LoginUserParams extends Equatable {
  final String mobile;
  const LoginUserParams(this.mobile);
  // const CreateUserParams.empty()
  //     : this(
  //           createdAt: '_empty.createdAt',
  //           name: '_empty.name',
  //           avatar: '_empty.avatar');

  @override
  List<Object?> get props => [mobile];
}
