import 'package:flutter/material.dart';
import 'package:porn_recommendation/style.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  bool _longPress = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Spacer(),
        Container(
            child: Image.asset("image/logo.png",
                width: size.width * 0.4, alignment: Alignment.center)),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(flex: 3, child: description(size, context)),
            Spacer(
              flex: 1,
            )
          ],
        ),
        GestureDetector(
          onLongPress: () => setState(() => _longPress = true),
          onLongPressUp: () => setState(() => _longPress = false),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/search1'),
            child: Container(
                width: 150,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-5, 5),
                          blurRadius: 10,
                          color: Colors.grey)
                    ],
                    borderRadius: BorderRadius.circular(25),
                    gradient: pinkGradientColor),
                child: _longPress
                    ? Text("Change Your Life!", style: TextStyle(color: white))
                    : Text(
                        "Get Started",
                        style: TextStyle(color: white),
                      )),
          ),
        ),
        Spacer()
      ],
    ));
  }

  Column description(Size size, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.05),
        Container(
          alignment: Alignment.centerLeft,
          child: fillStrokeText("Porn", deepPink, 24),
        ),
        fillStrokeText("Just 4 You", deepPink, 24),
        SizedBox(height: size.height * 0.05),
        SizedBox(
          child: Text(
            "Don't waste your time on searching the right porn for you!",
            style: noStrokeText(lightPink, 14),
          ),
          width: size.width * 0.8,
        ),
        SizedBox(height: size.height * 0.15),
      ],
    );
  }
}
