class UserDetailEntities {
  final bool accountStatus;
  final String deviceToken;
  final String phoneNumber;
  final int registrationStep;
  final String country;
  final String state;
  final String district;
  final String city;
  final String pinCode;
  final String accountNumber;
  final String ifscCode;
  final String bankName;
  final String branchName;
  final String name;
  final String age;
  final String gender;
  final bool aadhar;
  final bool bankPassbook;
  final bool bike;
  final bool educationCertificate;
  final bool panCard;
  final bool selfie;
  final String aadharUrl;
  final String bankPassbookUrl;
  final String bikeUrl1;
  final String bikeUrl2;
  final String educationCertificateUrl;
  final String panCardUrl;
  final String selfie1Url;
  final String selfie2Url;
  UserDetailEntities({
    String? phoneNumber,
    String? deviceToken,
    int? registrationStep,
    bool? accountStatus,
    String? country,
    String? state,
    String? district,
    String? city,
    String? pinCode,
    String? accountNumber,
    String? ifscCode,
    String? bankName,
    String? branchName,
    String? name,
    String? age,
    String? gender,
    bool? aadhar,
    bool? bankPassbook,
    bool? bike,
    bool? educationCertificate,
    bool? panCard,
    bool? selfie,
    String? aadharUrl,
    String? bankPassbookUrl,
    String? bikeUrl1,
    String? bikeUrl2,
    String? educationCertificateUrl,
    String? panCardUrl,
    String? selfie1Url,
    String? selfie2Url,
  })  : accountStatus = accountStatus ?? false,
        deviceToken = deviceToken ?? "N/A",
        phoneNumber = phoneNumber ?? "N/A",
        registrationStep = registrationStep ?? 0,
        country = country ?? "N/A",
        state = state ?? "N/A",
        district = district ?? "N/A",
        city = city ?? "N/A",
        pinCode = pinCode ?? "N/A",
        accountNumber = accountNumber ?? "N/A",
        ifscCode = ifscCode ?? "N/A",
        bankName = bankName ?? "N/A",
        branchName = branchName ?? "N/A",
        name = name ?? "",
        age = age ?? "N/A",
        gender = gender ?? "N/A",
        aadhar = aadhar ?? false,
        bankPassbook = bankPassbook ?? false,
        bike = bike ?? false,
        educationCertificate = educationCertificate ?? false,
        panCard = panCard ?? false,
        selfie = selfie ?? false,
        aadharUrl = aadharUrl ?? "N/A",
        bankPassbookUrl = bankPassbookUrl ?? "N/A",
        bikeUrl1 = bikeUrl1 ?? "N/A",
        bikeUrl2 = bikeUrl2 ?? "N/A",
        educationCertificateUrl = educationCertificateUrl ?? "N/A",
        panCardUrl = panCardUrl ?? "N/A",
        selfie1Url = selfie1Url ?? "N/A",
        selfie2Url = selfie2Url ?? "N/A";
}
