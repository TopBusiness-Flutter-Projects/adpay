
import 'package:flutter/material.dart';
import 'custom_drop_down_menu.dart';


class CustomCitiesMenu extends StatefulWidget {
  const CustomCitiesMenu({
    super.key,
  });

  @override
  State<CustomCitiesMenu> createState() => _CustomCitiesMenuState();
}

class _CustomCitiesMenuState extends State<CustomCitiesMenu> {
  String? dropdownValue;

  @override
  void initState() {
    // context.read<AddSubscribeCubit>().getSubsCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  return CustomDropDownMenu(
                text: 'AppStrings.subscribesCount',
                items: [
                  DropdownMenuItem<String>(
                    onTap: () async {},
                    value: " e.id.toString()",
                    child: Text("e.name.toString()"),
                  ),
                  DropdownMenuItem<String>(
                    onTap: () async {
                      // cubit.dropdownAreaValue = null;
                      //  cubit.changeCurrentCityId(cityId: e.id!);
                    },
                    value: " e.id.toString()",
                    child: Text("e.name.toString()"),
                  )
                ],

                //  cubit.citiesModel.data!
                //     .map(
                //       (e) => DropdownMenuItem<String>(
                //         onTap: () async{
                //          // cubit.dropdownAreaValue = null;
                //          //  cubit.changeCurrentCityId(cityId: e.id!);
                //         },
                //         value: e.id.toString(),
                //         child: Text(e.name.toString()),
                //       ),
                //     )
                //     .toList(),
                dropdownValue: dropdownValue,
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });

                  //cubit.changeCity(value!);
                },
              );


  }
}
