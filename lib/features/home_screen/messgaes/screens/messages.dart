import 'package:adpay/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/messages_cubit.dart';
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    MessagesCubit.get(context).getRooms();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      listener: (context, state) {},
      builder: (context, state) {
        MessagesCubit cubit = MessagesCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                ListTile(
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  title: Text(
                    "messages".tr(),
                    style: Styles.style20.copyWith(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.getChatModel?.data?.length ??
                        0, // or cubit.messages.length if dynamic
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print("ffffff ${cubit
                                    .getChatModel?.data?[index].toUser?.id
                                    .toString()}");
                                Navigator.pushNamed(context, Routes.chatapp,
                                    arguments: cubit
                                        .getChatModel?.data?[index].toUser?.id
                                        .toString());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors
                                            .grey, // Change this to your desired border color
                                        width:
                                            1.0, // Adjust the width of the border as needed
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          200), // Same border radius as ClipRRect
                                    ),
                                    child: Badge(
                                      alignment: Alignment.bottomLeft,
                                      backgroundColor: AppColors
                                          .secondPrimary, // Use your AppColors.primary here
                                      textColor: AppColors.white,
                                      textStyle: Styles.style12,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200),
                                        child:  Image.network(
                                          (cubit.getChatModel?.data?[index].toUser.toString() ?? ''),
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/chair.jpg',
                                              scale: 10,
                                            );
                                          },
                                        ),
                                      ),
                                      label: Center(
                                        child: Container(
                                          child: Text(cubit.getChatModel?.data?[index]?.unseenCount.toString()??""),
                                        ),
                                      ), // Add this line
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        cubit.getChatModel?.data?[index]?.toUser
                                                ?.name ??
                                            "user name",
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                  Spacer(),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(DateFormat('HH:mm a ').format((cubit
                                              .getChatModel
                                              ?.data?[index]
                                              ?.createdAt ??
                                          DateTime.now())))),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Divider(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
