enum IconsEnum {
  googleSignIn("${_root}google_sign_in.png"),
  like("${_root}like.png"),
  likeTapped("${_root}like_tapped.png"),
  locked("${_root}locked.png"),
  openLock("${_root}open_lock.png"),
  ;

  static const String _root = "lib/core/assets/icons/";

  final String path;

  const IconsEnum(this.path);
}
