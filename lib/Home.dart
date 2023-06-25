import 'package:challenge/Pokemons.dart';
import 'package:flutter/material.dart';

import 'Animations.dart';
const button1Color = Color(0xFFE11E1E);
const button2Color = Color(0xff0D47A1);
const button3Color = Color(0xFF63B2F2);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Your name";
  final nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Home',
        style: TextStyle(color: Colors.white),
      )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      controller: nameTextController,
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    ' $name ',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Flexible(
                      child: SizedBox(
                    height: 100,
                  )),
                  // Spacer(),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          nameTextController.clear();
                          setState(() {
                            name = "Your name";
                          });
                        },
                        child: Container(
                          child: RichText(
                              text: const TextSpan(children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.delete,
                              size: 18,
                              color: button1Color,
                            )),
                            TextSpan(
                                text: ' Clear text',
                                style: TextStyle(
                                    color: button1Color, fontSize: 18))
                          ])),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Animations(
                            name: name,
                          );
                        }));
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        backgroundColor: button2Color,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                      child: const Text(
                        'Go to page 1 ',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Pokemons.id);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        backgroundColor: button3Color,
                      ),
                      child: const Text(
                        'Go to page 2',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
