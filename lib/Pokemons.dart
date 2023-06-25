import 'dart:convert';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const pokemonsNumber = 7;

class Pokemons extends StatefulWidget {
  static const String id = 'pokemons_screen';

  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  var responseData;
  List<MyCard> cardsList = [];
  bool showLoader = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      showLoader = true;
    });
    fillCards();
  }

  Future getPokemonInfo() async {
    final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=$pokemonsNumber'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load information');
    }
  }

  Future<void> fillCards() async {
    responseData = await getPokemonInfo();
    var nestedResponse;
    List<MyCard> cards = [];
    for (int i = 0; i < pokemonsNumber; i++) {
      String imageURL = responseData['results'][i]['url'];
      var nestedResponseURL = await http.get(
          Uri.parse(imageURL));
      if (nestedResponseURL.statusCode == 200) {
         nestedResponse = jsonDecode(nestedResponseURL.body);
      } else {
        throw Exception('Failed to load information');
      }
      cards.add(MyCard(
          name: responseData['results'][i]['name'],
          image: nestedResponse['sprites']['other']['official-artwork']['front_default']));
    }
    setState(() {
      cardsList = cards;
    });
    setState(() {
      showLoader = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showLoader,
      child: Scaffold(
        appBar: AppBar(title: const Text('Pokemons')),
        body: ListView(children: cardsList
            ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Row(
            children: [
              Image(
                image: NetworkImage(image),
                height: 100,
                width: 100,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
