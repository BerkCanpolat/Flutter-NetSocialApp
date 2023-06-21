import 'package:flutter/material.dart';

class NetSocialAppButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const NetSocialAppButton({super.key,required this.text,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff9896f0),
              Color(0xffFBC8D5),
            ]),
            borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          width: 310,
          height: 45,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 17),
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
