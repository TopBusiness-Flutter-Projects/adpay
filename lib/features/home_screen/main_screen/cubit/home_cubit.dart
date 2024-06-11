import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/Home_models.dart';
import '../../../../core/models/login_model.dart';
import '../../../../core/preferences/preferences.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(HomeInitial()){
    getUserModel();
    }
  ServiceApi api;
  static HomeCubit get(context) => BlocProvider.of(context);
  LoginModel? userData;
  //عشان الاسم الي فوق
  getUserModel() {
    Preferences.instance.getUserModel().then((e) {
      userData = e;
      emit(GetUserData());
    });
  }

  // List<SliderModel>? sliderModel = [];
//   Future<void> getSlider() async {
//     // emit(ShowSliderLoading());
//     // // await Dio.get(
//     // //   url: '/api/slide',
//     // // ).then((value) {
//     // //   for (int i = 0; i < value.data.length; i++) {
//     // //     sliderModel!.add(SliderModel.fromJson(value.data[i]));
//     // //   }
//     //
//     //   emit(ShowSliderSuccess());
//     // }).catchError((error) {
//     //   emit(ShowSliderError(error.toString()));
//     // });
//   }
//
// //  List<CategoryModel>? categoryModel = [];
//
//   Future<void> getCategory() async {
//     //   emit(ShowCategoryLoading());
//     //   await DioHelper.getData(
//     //     url: '/api/category',
//     //   ).then((value) {
//     //     for (int i = 0; i < value.data.length; i++) {
//     //       categoryModel!.add(CategoryModel.fromJson(value.data[i]));
//     //     }
//     //     emit(ShowCategorySuccess());
//     //   }).catchError((error) {
//     //     emit(ShowCategoryError(error.toString()));
//     //   });
//     // }
//     //
//     // List<ProductModel>? productModel = [];
//     //
//     // Future<void> getProduct() async {
//     //   emit(ShowProductLoading());
//     //   await DioHelper.getData(
//     //     url: '/api/product',
//     //   ).then((value) {
//     //     for (int i = 0; i < value.data.length; i++) {
//     //       productModel!.add(ProductModel.fromJson(value.data[i]));
//     //     }
//     //
//     //     emit(ShowProductSuccess());
//     //   }).catchError((error) {
//     //     emit(ShowProductError(error.toString()));
//     //   });
//     // }
//     // int? index = 0;
//     //
//     // void changeButton(int? value) {
//     //   index = value;
//     //   emit(ChangeColorButton());
//     // }
//   }

  HomeModel? homeModel;

  Future<void> getHome() async {
    emit(LoadingADS());
    final response = await api.homeData();
    //
    response.fold((l) {
      emit(ErrorADS());
    }, (r) async {
      getUserModel();
      print("sucess cubit");
      homeModel = r;
      print(
          'homemodel : ${homeModel?.data?.ads?.first.descriptionAr.toString()}');
      print("loaded");
      emit(LoadedADS(homeModel: r));
    });
  }
}
