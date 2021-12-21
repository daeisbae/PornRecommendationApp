import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

class GradientBtn extends StatelessWidget {
  String? path;
  bool goBack;
  LinearGradient gradient;
  GradientBtn(
      {Key? key, required this.goBack, this.path, required this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (goBack) {
          Navigator.pop(context);
        } else {
          Navigator.of(context).pushNamed(path!);
        }
      },
      child: Container(
        height: 35,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(-3, 3))
          ],
        ),
        child: Text(
          goBack ? "Go Back" : "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

Future<String> loadTxt(String filePath) async {
  return await rootBundle.loadString(filePath);
}
