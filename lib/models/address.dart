class Address {
  final String? street;
  final String? locality;
  final String? administrativeArea;
  final String? postalCode;
  final String? country;

  Address(
      {this.street,
      this.locality,
      this.administrativeArea,
      this.postalCode,
      this.country});


  Address fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String?,
      locality: json['locality'] as String?,
      administrativeArea: json['administrativeArea'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
    );
  }
}