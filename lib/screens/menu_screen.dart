import 'package:appetito/models/food_plate.dart';
import 'package:appetito/services/food_plate_service.dart';
import 'package:flutter/material.dart';
import 'package:appetito/global.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> weekdays = ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta',
    'Sexta', 'Sábado'];

  @override
  Widget build(BuildContext context) {
    var foodPlateService = FoodPlateService();
    List<FoodPlate> dishes = foodPlateService.getFoodPlateList();

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.menu_rounded,
                  color: blue,
                )),
            title: const Text('Appetito',
                style: TextStyle(
                    fontSize: 27.0,
                    color: orange,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto')),
            backgroundColor: const Color(0xffffffff),
            // actions: [
            //   IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
            // ],
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                height: 70.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weekdays.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Button onPressed logic
                        },
                        style: weekdaysButtonStyle,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weekdays[index],
                              style: TextStyle(fontSize: 18.0,),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Text(
                'Menu',
                style: TextStyle(
                    color: blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 25.0),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of columns in the grid
                    ),
                    itemCount: dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: pink,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/${dishes[index].imageUrl}.jpg'),
                                  radius: 60.0,
                                ),
                                const SizedBox(height: 10.0,),
                                Expanded(
                                  child: Text(
                                    dishes[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blue,
                                        fontFamily: 'Roboto',
                                        fontSize: 15.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}



