import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const containerize = 300.0;
const circleColor = Color(0xFFF26363);
const rectangleColor = Color(0xFF63B2F2);
const squareColor = Color(0xff0D47A1);
const animationDuration = Duration(milliseconds: 300);

class Animations extends StatefulWidget {
  static const String id = 'animations_screen';
  Animations({this.name});
  final name;

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  String selectedShape = 'square';

  Widget changeMiddleShape() {
    switch (selectedShape) {
      case 'square':
        return AnimatedContainer(
          width: containerize,
          height: containerize,
          color: squareColor,
          duration: animationDuration,
        );
      case 'rounded_square':
        return AnimatedContainer(
          width: containerize,
          height: containerize,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              shape: BoxShape.rectangle,
              color: rectangleColor),
          duration: animationDuration,
        );
      case 'circle':
        return AnimatedContainer(
          width: containerize,
          height: containerize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: circleColor,
          ),
          duration: animationDuration,
        );
      default:
        return Container(
          width: containerize,
          height: containerize,
          color: squareColor,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${widget.name}',
              style: const TextStyle(fontSize: 18.0),
            ),
            changeMiddleShape(),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: Container(
                      width: 70,
                      height: 70,
                      color: squareColor,
                    ),
                    onTap: () {
                      setState(() {
                        selectedShape = "square";
                      });
                    }),
                GestureDetector(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: rectangleColor),
                    ),
                    onTap: () {
                      setState(() {
                        selectedShape = "rounded_square";
                      });
                    }),
                GestureDetector(
                  child: Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: circleColor)),
                  onTap: () {
                    setState(() {
                      selectedShape = "circle";
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
