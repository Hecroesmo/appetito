import 'package:appetito/models/food_plate.dart';
import 'package:appetito/screens/food_plate_details_screen.dart';
import 'package:appetito/screens/login_screen.dart';
import 'package:appetito/screens/reserva_screen.dart';
import 'package:appetito/services/auth/shared_service.dart';
import 'package:appetito/services/food_plate_service.dart';
import 'package:flutter/material.dart';
import 'package:appetito/global.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {

  final List<String> weekdays = ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta',
    'Sexta', 'Sábado'];

  bool _isMenuOpen = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

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
              icon: Icon(_isMenuOpen ? Icons.close : Icons.menu,
                color: blue,
                size: 40,
              ),
              onPressed: () {
                setState(() {
                  _toggleMenu();
                });
            }),
            title: const Text('Appetito',
                style: TextStyle(
                    fontSize: 27.0,
                    color: orange,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto')),
            backgroundColor: const Color(0xffffffff),
          ),
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
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
                              style: const TextStyle(fontSize: 18.0,),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Positioned(
                top: 100.0,
                left: 10.0,
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 25.0),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 150.0),
                //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                height: MediaQuery.of(context).size.height * 0.7,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of columns in the grid
                    ),
                    itemCount: dishes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => FoodPlateDetails(dishes[index]))
                          );
                        },
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
              ),

              _isMenuOpen ? Container(
                padding: const EdgeInsets.all(15.0),
                width: 220,
                height: double.infinity,
                color: orange,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      title: const Text(
                        'Reservas',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.white
                        ),),
                      leading: const Icon(Icons.dining_sharp, color: blue, size: 32,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (c) => const ReserveScreen()));
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Perfil',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.white
                        ),),
                      leading: const Icon(Icons.account_box, color: blue, size: 32,),
                      onTap: () {
                        // Handle item 1 tap
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Definições',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.white
                        ),),
                      leading: const Icon(Icons.settings, color: blue, size: 32,),
                      onTap: () {
                        // Handle item 1 tap
                      },
                    ),
                    ListTile(
                      title: const Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            color: Colors.white
                        ),),
                      leading: const Icon(Icons.settings, color: blue, size: 32,),
                      onTap: () {
                        SharedService.logout(context);
                      },
                    ),
                  ],
                ),
              ) : Container(),
            ],
          )
        ),
      ),
    );
  }
}

/*

* */



