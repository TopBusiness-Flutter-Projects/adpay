abstract class VendorOrderState {}

class InitVendorOrderState extends VendorOrderState {}

class LoadingGetOrdersVendor extends VendorOrderState {}

class LoadedGetOrdersVendor extends VendorOrderState {}

class ErrorGetOrdersVendor extends VendorOrderState {}

class LoadingGetDetailsOrdersVendor extends VendorOrderState {}

class LoadedGetDetailsOrdersVendor extends VendorOrderState {}

class ErrorGetDetailsOrdersVendor extends VendorOrderState {}
