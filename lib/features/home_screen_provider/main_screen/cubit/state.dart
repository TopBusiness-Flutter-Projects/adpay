abstract class MainVendorState {}

class MainVendorInitial extends MainVendorState {}

class GetUserData extends MainVendorState {}
class LoadingGetUserData extends MainVendorState {}

class LoadingGetHomeVendorState extends MainVendorState {}

class LoadedGetHomeVendorState extends MainVendorState {}

class ErrorGetHomeVendorState extends MainVendorState {}

class LoadingGetMyWalletState extends MainVendorState {}

class LoadedGetMyWalletState extends MainVendorState {}

class ErrorGetMyWalletState extends MainVendorState {}

class LoadingGetShopCategoryVendorState extends MainVendorState {}

class LoadedGetShopCategoryVendorState extends MainVendorState {}

class ErrorGetShopCategoryVendorState extends MainVendorState {}

class OnChangeCategoryVendorState extends MainVendorState {}

class LoadingGetProductsOfVendorState extends MainVendorState {}

class LoadedGetProductsOfVendorState extends MainVendorState {}

class ErrorGetProductsOfVendorState extends MainVendorState {}

class LoadingGetAdsOfVendorState extends MainVendorState {}

class LoadedGetAdsOfVendorState extends MainVendorState {}

class ErrorGetAdsOfVendorState extends MainVendorState {}

class LoadingProductsDetails extends MainVendorState {}

class LoadedProductsDEtails extends MainVendorState {}

class ErrorProductsDetails extends MainVendorState {}

class LoadingDeleteProductsDetails extends MainVendorState {}

class LoadedDeleteProductsDEtails extends MainVendorState {}

class ErrorDeleteProductsDetails extends MainVendorState {}
