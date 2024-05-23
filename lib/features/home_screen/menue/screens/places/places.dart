import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

import '../../../../../core/utils/styles.dart';
import '../widgets/menue_widget.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return       Scaffold(
        body: SingleChildScrollView(
        child: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
              ),
              title: Text("places".tr(),
                  style: Styles.style20.copyWith(color: Colors.black)),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: ListView.builder(
              itemCount: 7,
                itemBuilder: (BuildContext,index){
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: MenueWidget(
                  text: 'places'.tr(),
                  path: 'assets/images/places.png',
                ),
              );
            }),
          )

        ],))));
  }
}
