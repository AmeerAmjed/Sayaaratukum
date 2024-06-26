class Constants {
  static const String websiteLink = "https://api.saiaratcom.com/";
  static const String baseUrl = "https://saiaratcom.com/";
  static const double zero = .0;

  static const double spacing = 2.0;
  static const double spacingSmall = 4.0;
  static const double spacingXSmall = 8.0;
  static const double spacingXXSmall = 12.0;
  static const double spacing4 = 4.0;
  static const double spacing16 = 16.0;
  static const double spacing12 = 12.0;
  static const double spacing8 = 8.0;
  static const double spacing32 = 32.0;
  static const double spacingXMedium = 20.0;
  static const double spacingLarge = 24.0;
  static const double spacingXLarge = 42.0;
  static const double spacingExtraXLarge = 72.0;

  static const double radiusSmall = 4.0;
  static const double radiusFull = 25.0;

  static const String fontFamily = "poppins";

  static const double fontSizePrimary = 14.0;
  static const double fontSizeSecondary = 16.0;
  static const double fontSizeCaption = 12.0;

  static const double fontSizeSecondaryX = 24.0;
  static const double fontSizeTitle = 28.0;
  static const double fontSizeTitleExtra = 38.0;
  static const double fontSize10 = 10.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize38 = 38.0;

  static const double elevationCard = 2.0;

  static const double sizeSmallIcons = 12.0;
  static const double sizeSmallXIcons = 18.0;
  static const double sizeMediumIcons = 24.0;
  static const double sizeMediumXIcons = 30.0;

  static const int limitRepositories = 10;

  static const String image = 'assets/images/image.png';
  static const String welcomeImage = 'assets/images/welcome.png';

  static const String iconApp = 'assets/images/image.png';

  static const String userKey = 'user';
  static const String tokenKey = 'token';
  static const String skipAuthKey = 'skipAuth';
  static const String langCodeKey = 'langCode';
  static const String notificationKey = 'notification';

  static const String brandIdKey = 'brandIdKey';
  static const String nameBrandKey = 'nameBrandKey';
  static const String idStoreKey = 'idStoreKey';
  static const String idStoreUpdateStoreProfile = 'idStoreUpdateStoreProfile';
  static const String idUpdateTool = 'idUpdateTool';
  static const String idUpdateCarKey = 'idUpdateCarKey';
  static const String idToolStoreKey = 'idToolStoreKey';
  static const String idCarKey = 'idCarKey';
  static const String idToolKey = 'idToolKey';

  static const String bodyData = 'data';
  static const String bodyMessage = 'message';

  static const String loadingImage = 'assets/images/loading.gif';
  static const String looPLoadingImage = 'assets/images/loop_loading.gif';
  static const String allImage =
      "https://api.mooappx.com/storage/h7sNnp2119BSZe8URUe6sFlB92yNewoiqigJSfZL.png";

  static RegExp emailRegExp =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
}

const String emailToCheckOTPKey = 'emailToCheckOTPKey';

enum OwnerType { user, store }