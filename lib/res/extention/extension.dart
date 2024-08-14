// ignore: import_of_legacy_library_into_null_safe

extension StringExtension on String {
  /// this is for mobile
  String get mobilesvg => 'assets/svg/$this.svg';

  String get mobilepng => 'assets/images/mobile/$this.png';

  String get mobilegif => 'assets/images/mobile/$this.gif';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
