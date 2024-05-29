import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/grage_details_cubit.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<GrageDetailsCubit, GrageDetailsState>(
        builder: (context, state) {
      GrageDetailsCubit cubit = GrageDetailsCubit.get(context);
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Image.asset("assets/images/chair.jpg"),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: TextField(
                controller: context.read<GrageDetailsCubit>().comment,
                onSubmitted: (data) async {},
                decoration: InputDecoration(
                  hintText: "SendMessage".tr(),
                  filled: true,
                  fillColor:
                      Colors.grey[200], // Set the background color to grey
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15), // Adjust the content padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none, // Remove the border color
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              final cubit = context.read<GrageDetailsCubit>();
              cubit.PostComments(context: context,
                  auction_id:
                  cubit.grageModelDetails?.id.toString() ?? "1",
                  comment:context.read<GrageDetailsCubit>().comment.text ?? "good Morning",
                  isComment: true);
              context.read<GrageDetailsCubit>().comment.clear();
              // cubit.grageModelDetails=null;
              cubit.getGrageDetils(
                  id: cubit.grageModelDetails?.id.toString());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/send.png"),
            ),
          )
        ],
      ),
    );
  }
   );}
}
