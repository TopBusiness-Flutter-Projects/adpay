import 'package:adpay/features/home_screen/main_screen/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../messgaes/cubit/messages_cubit.dart';

class ChatPageScreen extends StatefulWidget {
  ChatPageScreen({Key? key, this.id}) : super(key: key);
  String? id;

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  void initState() {
    super.initState();
    // id user to
    context.read<MessagesCubit>().getRoomById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    MessagesCubit cubit = MessagesCubit.get(context);
  return
    BlocConsumer<MessagesCubit, MessagesState>(
        listener: (context, state) {},
    builder: (context, state) {
    MessagesCubit cubit = MessagesCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp, color: Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/logo.png",
            height: 30,
          ),
          Text("chat"),
        ]),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child:(state is LoadingRoomMessage)?

                  Center(
                    child: CircularProgressIndicator(),
                  )
                  : ListView.builder(
                  itemCount: cubit?.chatidmodel?.data?.messages?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Align(
                          alignment: (context
                                      .read<HomeCubit>()
                                      .userData!
                                      .data
                                      ?.id
                                      .toString() ==
                                  cubit?.chatidmodel?.data?.messages?[index]
                                      .fromUserId
                                      .toString())
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius:(context
                                      .read<HomeCubit>()
                                      .userData!
                                      .data
                                      ?.id
                                      .toString() ==
                                      cubit?.chatidmodel?.data?.messages?[index]
                                          .fromUserId
                                          .toString())
                                      ? BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    topLeft: Radius.circular(32),
                                    bottomLeft: Radius.circular(32),
                                  ): BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    topLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32),
                                  ),
                                  color:(context
                                      .read<HomeCubit>()
                                      .userData!
                                      .data
                                      ?.id
                                      .toString() ==
                                      cubit?.chatidmodel?.data?.messages?[index]
                                          .fromUserId
                                          .toString())
                                      ?Colors.grey: Colors.blueGrey),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  cubit?.chatidmodel?.data?.messages?[index]
                                          .message ??
                                      "nehal",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: Expanded(
                        //     child: Container(
                        //       margin: EdgeInsets.symmetric(
                        //           horizontal: 16, vertical: 8),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.only(
                        //             topRight: Radius.circular(32),
                        //             topLeft: Radius.circular(32),
                        //             bottomLeft: Radius.circular(32),
                        //           ),
                        //           color: Colors.grey[300]),
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(16),
                        //         child: Text(cubit?.chatidmodel?.data
                        //                 ?.messages?[index].message ??
                        //             "nehal"),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cubit.text1,
              onSubmitted: (data) async {},
              decoration: InputDecoration(
                  hintText: "send message",
                  suffixIcon: InkWell(
                      onTap: () {
                        cubit.postSendMessage();
                      },
                      child: Icon(Icons.send)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
          )
        ],
      ),
    );
  }
    );}}
