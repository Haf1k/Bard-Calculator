import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen)
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  int weightOfDog = 0;
  double percentage = 0;
  double total_food = 0;
  double meat = 0;
  double insides = 0;
  double bones = 0;
  double vegetables = 0;
  double fruits = 0;
  double grains = 0;

  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BARF Calculator'),
        backgroundColor: Colors.lightGreen[800],
        centerTitle: true,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      //backgroundColor: Colors.grey[800],
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage("assets/dog.png"),
                  fit: BoxFit.contain,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Weight of dog',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextField(
                      //decoration: InputDecoration(),
                      keyboardType: TextInputType.number,
                      onChanged: (weightValue) {
                        weightOfDog = int.parse(weightValue);
                      },
                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      'Percentage',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0
                       ),
                      ),
                   ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextField(
                      //decoration: InputDecoration(),
                      keyboardType: TextInputType.number,
                      onChanged: (percentageValue) {
                        percentage = double.parse(percentageValue.replaceAll(",", "."));
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
                      child: Text(
                            '\bTotal food: $total_food kg \n'
                            '\bMeat: $meat g \n'
                            '\bInsides: $insides g \n'
                            '\bBones: $bones g \n'
                            '\bVegetables: $vegetables g \n'
                            '\bFruits: $fruits g \n'
                            '\bGrains: $grains g',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen[700],
                        ),
                        onPressed: () {
                          setState(() {
                            total_food = weightOfDog * (percentage/100);
                            meat = total_food * 0.35 * 1000;
                            meat = meat.roundToDouble();
                            insides = total_food * 0.15 * 1000;
                            insides = insides.roundToDouble();
                            bones = total_food * 0.3 * 1000;
                            bones = bones.roundToDouble();
                            vegetables = total_food * 0.12 * 1000;
                            vegetables = vegetables.roundToDouble();
                            fruits = total_food * 0.06 * 1000;
                            fruits = fruits.roundToDouble();
                            grains = total_food * 0.02 * 1000;
                            grains = grains.roundToDouble();
                            total_food = double.parse((total_food).toStringAsFixed(2));
                          });
                        },
                        child: Text(
                            'Calculate',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )


    );
  }
}


