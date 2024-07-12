extension ImagePathExtension on String {
  static String _baseIconPath = "lib/core/assets/icons/";
  static String _baseImagePath = "lib/core/assets/images/";

  String get toPngIcon => "$_baseIconPath$this.png";
  String get toPngImage => "$_baseImagePath$this.png";
}
