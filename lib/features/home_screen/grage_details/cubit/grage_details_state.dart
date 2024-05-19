part of 'grage_details_cubit.dart';

@immutable
sealed class GrageDetailsState {}

final class GrageDetailsInitial extends GrageDetailsState {}
class LoadingGrageDetails extends GrageDetailsState{}
class ErrorGrageDetails extends GrageDetailsState{}
class LoadedGrageDetails extends GrageDetailsState{
  final GradeDetailsModel ?GrageDetailsModel;
  LoadedGrageDetails({required this.GrageDetailsModel});
}
class ChangeFavState extends GrageDetailsState{}
//comment
class LoadedComments extends GrageDetailsState{
  LoadedComments();
}
class LoadingComments extends GrageDetailsState{}
class ErrorComments extends GrageDetailsState{}
