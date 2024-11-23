enum Endpoints {
  common;

  String get path {
    switch (this) {
      case Endpoints.common:
        return "/common";
    }
  }
}
