import '../../../core/app_exports.dart';

snackbar(
    {required String title,
    required String message,
    MsgType type = MsgType.success}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: MsgType.success == type
        ? Colors.green
        : MsgType.warning == type
            ? const Color(0xFFD8712A)
            : Colors.red,
    colorText: MsgType.success == type ? Colors.white : Colors.white,
    icon: MsgType.warning == type
        ? const Icon(
            Icons.warning,
            color: Colors.yellow,
          )
        : MsgType.failure == type
            ? const Icon(
                Icons.error,
                color: Colors.white,
              )
            : null,
  );
}
