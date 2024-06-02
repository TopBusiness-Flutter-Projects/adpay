class EndPoints {
  static const String baseUrl = 'https://adpay.topbusiness.io/api/';
  static const String baseUrlImage = 'https://adpay.topbusiness.io/';

  static const String loginUrl = '${baseUrl}auth/login';
  static const String CheckUser = '${baseUrl}auth/checkUser';
  static const String homeUrl = '${baseUrl}user/getHome';
  static const String CatogriesListUrl = '${baseUrl}user/getCategories';

  static const String AdsListUrl = '${baseUrl}user/getAds';
  static const String ProductListUrl = '${baseUrl}user/getProducts';
  static const String GrageListUrl = '${baseUrl}user/getAuctions';
  static const String ProductDetails = '${baseUrl}user/productDetails/';
  static const String AuctionsDetails = '${baseUrl}user/auctionDetails/';

  static const String ShopsList = '${baseUrl}user/getShops';
  static const String Favourite = '${baseUrl}user/storeFavorite';
static const String CommentsUrl='${baseUrl}user/storeComment';
  // static const String citiesUrl = '${baseUrl}cities';
  // static const String servicesUrl = '${baseUrl}services/';
  // static const String editServicesUrl = '${baseUrl}services/update/';
  // static const String favoriteUrl = '${baseUrl}services/get-favourites';
  // static const String myServicesUrl = '${baseUrl}services/my_services';
  // static const String updateProfileUrl = '${baseUrl}client/auth/update-profile';
  // static const String settingUrl = '${baseUrl}setting';
  // static const String serviceStoreUrl = '${baseUrl}services/store';
  // static const String categoriesUrl = '${baseUrl}categories';
  // static const String rateUrl = '${baseUrl}services/add-rate';
  // static const String addToFavouriteUrl =
  //     '${baseUrl}services/add-to-favourites';
  // static const String deepLink = '${baseUrl}details/';
  // static const String searchUrl = '${baseUrl}search';
  // static const String notificationUrl = '${baseUrl}notifications';
  static const String registerUrl = '${baseUrl}user/register';

  static const String logoutUrl = '${baseUrl}auth/logout';

  static const String getfavouriteUrl = '${baseUrl}user/myFavorite';
  static const String getprofileUrl = '${baseUrl}user/myAccount';
  static const String getmyauctionsUrl = '${baseUrl}user/getMyAuctions';
  static const String EditProfileUrl = '${baseUrl}user/updateProfile';


}
