import 'package:adpay/features/home_screen/grage_details/screen/widgets/comments_widget.dart';
import 'package:adpay/features/home_screen/grage_details/screen/widgets/send_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/grage_details_cubit.dart';

class AllComments extends StatelessWidget {
  const AllComments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrageDetailsCubit, GrageDetailsState>(
        builder: (context, state) {
      GrageDetailsCubit cubit = GrageDetailsCubit.get(context);

      return SafeArea(
        bottom: true,
          child: Scaffold(
        bottomSheet: SendMessage(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)
                ),
              ),
              title: Text("AllComments".tr(),
                  style: Styles.style20.copyWith(color: Colors.black)),
            ),
          ),
          Flexible(fit: FlexFit.tight,
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final comment = cubit.grageModelDetails?.comments[index];
                if (comment != null) {
                  return CommentsWidget(comment: comment);
                } else {
                  return SizedBox
                      .shrink(); // Return an empty widget if the comment is null
                }
              },
              itemCount: cubit.grageModelDetails?.comments.length ?? 0,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width/4,
          )        ]),
      ));
    });
  }
}
