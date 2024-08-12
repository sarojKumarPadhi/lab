import '../../../../core/utils/enums.dart';

class CommonEntites<T> {
  final String? msg;
  final T? data;
  MsgType msgType;
  CommonEntites({
    this.msg,
    this.data,
    this.msgType = MsgType.success,
  });
}
