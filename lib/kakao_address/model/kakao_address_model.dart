abstract class KakaoAddressModelBase {}

class KakaoAddressModelLoading extends KakaoAddressModelBase {}

class KakaoAddressModel extends KakaoAddressModelBase {
  final String postCode;
  final String address;
  final String roadAddress;
  final String jibunAddress;
  final String region;
  final double latitude;
  final double longitude;

  KakaoAddressModel({
    required this.postCode,
    required this.address,
    required this.roadAddress,
    required this.jibunAddress,
    required this.region,
    required this.latitude,
    required this.longitude,
  });
}
