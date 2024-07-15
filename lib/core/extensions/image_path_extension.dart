extension ImagePathExtension on String {
  static const String _baseIconPath = "lib/core/assets/icons/";
  static const String _baseImagePath = "lib/core/assets/images/";

  String get toPngIcon => "$_baseIconPath$this.png";
  String get toPngImage => "$_baseImagePath$this.png";
}
