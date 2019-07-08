enum Environment { DEV, STAGING, PROD }

class Constants {
  static Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.qaConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get baseurl {
    return _config[_Config.base_url];
  }

  static get whereami {
    return _config[_Config.where_am_i];
  }
}

class _Config {
  static const base_url = "SERVER_URL";
  static const where_am_i = "WHERE_AM_I";

  static Map<String, dynamic> debugConstants = {
    base_url: "https://matrimony-demo.flyweightsoftwares.com/api/",
    where_am_i: "local",
  };

  static Map<String, dynamic> qaConstants = {
    base_url: "https://staging1.example.com/",
    where_am_i: "staging",
  };

  static Map<String, dynamic> prodConstants = {
    base_url: "https://itsallwidgets.com/",
    where_am_i: "prod"
  };
}