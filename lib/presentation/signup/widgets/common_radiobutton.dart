import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth_provider.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key,  this.groupValue=0});
final int groupValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Row(
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: Provider.of<AuthProvider>(context).selectedGender,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).updateGender(value as int);
            },
          ),
          Text("Male"),
          Radio(
            value: 1,
            groupValue: Provider.of<AuthProvider>(context).selectedGender,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).updateGender(value as int);
            },
          ),
          Text("Female"),
          Radio(
            value: 2,
            groupValue: Provider.of<AuthProvider>(context).selectedGender,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false).updateGender(value as int);
            },
          ),
          const Text("Other"),
        ],
      ),
    );
  }
}
