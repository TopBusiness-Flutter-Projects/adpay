class EndPoints {
  static const String baseUrl = 'https://adpay.topbusiness.io/api/';
  static const String baseUrlImage = 'https://adpay.topbusiness.io/';
  static const String loginUrl = '${baseUrl}auth/login';
  static const String loginUrlProvider = '${baseUrl}provider/login';
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
  static const String CommentsUrl = '${baseUrl}user/storeComment';
  static const String CoinsUrl = '${baseUrl}user/myCoins';
  static const String WalletUrl = '${baseUrl}user/myWallet';
  static const String addHarag = '${baseUrl}user/storeAuction';
  static const String logout = '${baseUrl}auth/logout';
  static const String contactUs = '${baseUrl}user/sendContactUs';
  static const String homeVendorUrl = '${baseUrl}vendor/home';
  static const String vendorNotificationsUrl = '${baseUrl}vendor/getNotifications';
  static const String vendorOrdersUrl = '${baseUrl}vendor/orders';
  static const String vendorOrderDetailsUrl = '${baseUrl}vendor/order/d/';
  static const String resetUrl = '${baseUrl}auth/resetPassword';
  static const String getshopctogreyUrl = '${baseUrl}getShopCategories';
  static const String getShopCtogreyUrl = '${baseUrl}getShopCategories';
  static const String subCatogreyUrl = '${baseUrl}vendor/getShopSubCategories';
  static const String getRegions = '${baseUrl}user/getRegions';
  static const String getCityByRegion = '${baseUrl}user/getCityByRegion';
  static const String changOrderStatusUrl = '${baseUrl}vendor/changOrderStatus';
  static const String vendorMyWallet = '${baseUrl}vendor/myWallet';
  static const String vendorGetShopCategories =
      '${baseUrl}vendor/getShopCategories';
  static const String getMyProductsVendor = '${baseUrl}vendor/myProducts';
  static const String getMyAdvertiseVendor = '${baseUrl}vendor/myAdvertise';

  static const String addToCart = '${baseUrl}user/addToCart';
  static const String getCart = '${baseUrl}user/getCart';
  static const String vendorRegister = '${baseUrl}vendor/register';
  static const String vendorAddProduct = '${baseUrl}vendor/addProduct';
  static const String vendorUpdateProduct = '${baseUrl}vendor/updateProduct';
  static const String getAdPackages = '${baseUrl}vendor/getAdPackages';
  static const String addAdvertise = '${baseUrl}vendor/addAdvertise';
  // user/myOrders?type=complete
  static const String getmyOrder = '${baseUrl}user/myOrders';
  // static const String getorderDetails = '${baseUrl}user/order/d';
  static const String confrimOrder = '${baseUrl}user/conformOrder';

  static const String emptycard = '${baseUrl}user/emptyCard';

  static const String deleteCard = '${baseUrl}user/deleteFromCart';
  static const String vendorProfile = '${baseUrl}user/vendorProfile/18?key=';
  static const String updateProfile = '${baseUrl}vendor/updateProfile';



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
  static const String postaddressUrl = '${baseUrl}user/addAddress';
  static const String getaddressUrl = '${baseUrl}user/myAddresses';

  static const String getChatroomUrl = '${baseUrl}vendor/getChatRooms';
  static const String getroombyid = '${baseUrl}vendor/getRoom';
  static const String sendMessage = '${baseUrl}vendor/room/';
  static const String vendorProductDetails = '${baseUrl}vendor/productDetails/';
  static const String vendorDeleteProduct = '${baseUrl}vendor/deleteProduct';
  static const String orderDetails = '${baseUrl}user/order/d/?id=';

  static const String aboutUs = '${baseUrl}user/aboutUs';

}
