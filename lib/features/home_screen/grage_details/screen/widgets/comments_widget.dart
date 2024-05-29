import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/models/grage_details_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../cubit/grage_details_cubit.dart';

class CommentsWidget extends StatelessWidget {
  final Comment comment;

  CommentsWidget({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GrageDetailsCubit>();
    return BlocBuilder<GrageDetailsCubit, GrageDetailsState>(
        builder: (context, state) {
      GrageDetailsCubit cubit = GrageDetailsCubit.get(context);

      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    child: Image.network(
                      EndPoints.baseUrlImage + (comment.toString() ?? ''),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/chair.jpg',
                          scale: 10,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              comment.user.name ?? 'ايه عمرو',
                              maxLines: 1,
                              style: Styles.style16,
                            ),
                          ),
                          Text(
                            "4 days",
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                (EasyLocalization.of(context)!
                                            .locale
                                            .languageCode ==
                                        'ar')
                                    ? (comment.comment ?? 'ايه عمرو')
                                    : (comment.comment ?? 'Aya AMR'),
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled:
                                      true, // This is important to make the bottom sheet adjustable
                                  builder: (BuildContext context) {
                                    return BlocBuilder<GrageDetailsCubit, GrageDetailsState>(
                                        builder: (context, state) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.width * 1.4,
                                        padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 16.0,
                                          bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom +
                                              16.0, // Adjust padding to account for the keyboard
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'reply'.tr(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: ListView.builder(
                                                itemCount:
                                                    comment?.replies.length ??
                                                        0,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  final reply =
                                                      comment?.replies[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 4.0,
                                                        horizontal: 4.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white60,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        border: Border.all(
                                                          color:
                                                              Colors.grey[300]!,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: ClipRRect(
                                                                child: Image
                                                                    .network(
                                                                  EndPoints
                                                                          .baseUrlImage +
                                                                      (reply?.toString() ??
                                                                          ''),
                                                                  errorBuilder:
                                                                      (context,
                                                                          error,
                                                                          stackTrace) {
                                                                    return Image
                                                                        .asset(
                                                                      'assets/images/chair.jpg',
                                                                      scale: 10,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          reply?.comment ??
                                                                              'ايه عمرو',
                                                                          maxLines:
                                                                              1,
                                                                          style:
                                                                              Styles.style16,
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: TextField(
                                                controller: context
                                                    .read<GrageDetailsCubit>()
                                                    .replyController,
                                                onSubmitted: (data) async {},
                                                decoration: InputDecoration(
                                                  hintText: "SendMessage".tr(),
                                                  filled: true,
                                                  fillColor: Colors.grey[
                                                      200], // Set the background color to grey
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 15,
                                                  ), // Adjust the content padding
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    borderSide: BorderSide
                                                        .none, // Remove the border color
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                final cubit = context
                                                    .read<GrageDetailsCubit>();
                                                cubit.PostComments(context: context,
                                                  auction_id: cubit
                                                          .grageModelDetails?.id
                                                          .toString() ??
                                                      "1",
                                                  comment: cubit
                                                      .replyController.text,
                                                  isComment: false,
                                                  comment_id:
                                                      comment.id.toString(),
                                                );

                                                cubit
                                                    .getGrageDetils(
                                                        id: cubit
                                                            .grageModelDetails
                                                            ?.id
                                                            .toString());

                                                  cubit.replyController.clear();

                                                // Removed Navigator.pop(context); to keep the bottom sheet open
                                              },
                                              child: Text('SendReply'.tr()),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              child: Text(
                                'reply'.tr(),
                                maxLines: 1,
                                style: Styles.style16,
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
