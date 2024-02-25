import 'package:ai_assistent/helper/global.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            minimumSize: Size(mq.width * .4, 50)),
        onPressed: onTap,
        child: Text(text,style:  const TextStyle(color: Colors.white),),
      ),
    );
  }
}
