class AppAssets {
  AppAssets._(); // prevents instantiation

  // Base folders
  static const String images = 'assets/images';
  static const String icons = 'assets/icons';
  static const String lottie = 'assets/lottie';
  static const String fonts = 'assets/fonts';

  // Images
  static const String logo = '$images/logo.png';
  static const String splash = '$images/splash.png';
  static const String products = '$images/products.png';
  

  // Icons (SVG or PNG depending on your assets)
  static const String icBack = '$icons/ic_back.svg';
  static const String icCart = '$icons/ic_cart.svg';
  static const String icSearch = '$icons/ic_search.svg';
  static const String icFavourite = '$icons/ic_favourite.svg';

  // Lottie animations
  static const String loader = '$lottie/loader.json';
  static const String emptyState = '$lottie/empty_state.json';

  // Fonts (if you reference fonts via assets)
  static const String montserratRegular = '$fonts/Montserrat-Regular.ttf';
  static const String montserratBold = '$fonts/Montserrat-Bold.ttf';

  // Utility: list all image assets (optional, helpful for testing/registration)
  static const List<String> allImages = [
    logo,
    splash,
    products,
  ];

  static const List<String> allIcons = [
    icBack,
    icCart,
    icSearch,
    icFavourite,
  ];
}