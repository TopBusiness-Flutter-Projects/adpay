import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:adpay/features/home_screen/grage_details/screen/grage_details_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/grage_details_model.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/dialogs.dart';

part 'grage_details_state.dart';

class GrageDetailsCubit extends Cubit<GrageDetailsState> {
  GrageDetailsCubit(this.api) : super(GrageDetailsInitial());
  ServiceApi api;
  final TextEditingController comment = TextEditingController();
  TextEditingController replyController = TextEditingController();
  GradeDetailsModel? grageModelDetails;
  static GrageDetailsCubit get(context) => BlocProvider.of(context);
  Future<void> getGrageDetils({String? id}) async {
    emit(LoadingGrageDetails());
    final response = await api.GrageDetails(id: id);
    response.fold((l) {
      emit(ErrorGrageDetails());
    }, (right) async {
      print("sucess cubit");
      grageModelDetails = right;

      print("loaded");
      emit(LoadedGrageDetails(GrageDetailsModel: right));
    });
  }

//comments
  Future<void> PostComments({
    required bool isComment,
    required String auction_id,
    required String? comment,
    String? type,
    String? comment_id,
  }) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingComments());
    final response = await api.PostComment(
        auction_id: auction_id,
        comment: comment,
        comment_id: comment_id,
        isComment: isComment);
    //
    response.fold((l) {
      emit(ErrorComments());
    }, (r) async {
      successGetBar(r.msg);

      emit(LoadedComments());
    });
  }
}
