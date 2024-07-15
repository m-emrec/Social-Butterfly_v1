enum AssetsEnum {
  googleSignIn("${_rootIconPath}google_sign_in.png"),
  like("${_rootIconPath}like.png"),
  likeTapped("${_rootIconPath}like_tapped.png"),
  locked("${_rootIconPath}locked.png"),
  openLock("${_rootIconPath}open_lock.png"),
  comment("${_rootIconPath}comment.png"),
  authBackgroundImage("${_rootImagePath}auth_bg_image.png"),
  loadingAnimation("${_rootAnimationPath}loading_indicator.riv"),
  appLogoIcon("${_rootIconPath}logo.png"),
  ;

  static const String _rootIconPath = "lib/core/assets/icons/";
  static const String _rootImagePath = "lib/core/assets/images/";
  static const String _rootAnimationPath = "lib/core/assets/animations/";
  final String path;

  /// This enum contains Asset paths.
  const AssetsEnum(this.path);
}
