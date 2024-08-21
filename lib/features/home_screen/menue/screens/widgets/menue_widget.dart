import 'package:adpay/core/utils/get_size.dart';


class MenueWidget extends StatelessWidget {
  MenueWidget({super.key, required this.text, required this.path});
  String? text;
  String? path;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                '${path}',
                width: getSize(context) / 12,
                height: getSize(context) / 12,
              ),
            ),
            Text("${text}"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/arrow.png",
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Divider(),
        )
      ],
    );
  }
}
