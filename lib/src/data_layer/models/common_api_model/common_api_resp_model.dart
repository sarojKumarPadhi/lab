class CommonApiResp<T> {
  final String? statusCode;
  final String? msg;
  final T? data;

  CommonApiResp({
    this.statusCode,
    this.msg,
    this.data,
  });

  factory CommonApiResp.fromJson(
      Map<String, dynamic> json, T? Function(Map<String, dynamic>?) fromJsonT) {
    return CommonApiResp<T>(
      statusCode: json['statusCode'],
      msg: json['msg'],
      data: fromJsonT(json['data']),
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) toJsonT) {
    return {
      'statusCode': statusCode,
      'msg': msg,
      'data': toJsonT(data),
    };
  }
}
