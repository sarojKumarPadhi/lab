Map<String, dynamic> firebaseCommonResp(Map<String, dynamic>? data,
        {String statusCode = "200", String msg = "success"}) =>
    {'statusCode': statusCode, 'msg': msg, 'data': data};
