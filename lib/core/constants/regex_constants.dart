class RegexConstants {
  // 10-digits only
  static const String phoneNumberRegex = r'^(?:[+0]9)?[0-9]{10}$';
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String digitsOnly = r'^\d+$';
  static const String phoneNumberWithCountryCode =
      r'^\+(?:[0-9] ?){6,14}[0-9]$';
}
