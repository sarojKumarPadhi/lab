class LocalUserEntities {
  final String? mobile;
  final String? userUid;
  final String? deviceToken;
  final int? registrationStep;
  final bool? accountStatus;
  LocalUserEntities(
      {required this.mobile,
      required this.userUid,
      required this.deviceToken,
      required this.registrationStep,
      required this.accountStatus});
}
