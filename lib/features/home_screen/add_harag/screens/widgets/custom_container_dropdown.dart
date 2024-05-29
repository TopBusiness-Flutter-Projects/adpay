import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyContainerWithDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Selectcategory'.tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            PopupMenuButton<String>(
              icon: Image.asset(
                'assets/images/down.png', // Replace with your image asset path
                height: 24.0,
                width: 24.0,
              ),
              onSelected: (String value) {
                // Handle the selected value here
                print("Selected: $value");
              },
              itemBuilder: (BuildContext context) {
                return ['Option 1', 'Option 2', 'Option 3', 'Option 4']
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}

