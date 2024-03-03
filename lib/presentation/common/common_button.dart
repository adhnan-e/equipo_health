import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({super.key, this.buttonText = 'Submit', required this.callback});
  final String buttonText;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Color(0xff35A1FF),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(buttonText,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
      ),
    );
  }
}
