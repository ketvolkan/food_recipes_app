// ignore_for_file: constant_identifier_names

enum AppRoutes {
  splash,
  settings,
  profile,
  login,
  register,
  home,
  favorite,
  notif;

  String get path {
    switch (this) {
      case AppRoutes.splash:
        return "/splash";
      case AppRoutes.home:
        return "/home";
      case AppRoutes.settings:
        return "/settings";
      case AppRoutes.notif:
        return "/notif";
      case AppRoutes.favorite:
        return "/favorite";
      default:
        return "/login";
    }
  }
}
