import 'package:appetito/global.dart';
import 'package:appetito/models/food_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class FoodPlateDetails extends StatefulWidget {
  final FoodPlate foodPlate;
  const FoodPlateDetails(this.foodPlate, {Key? key}) : super(key: key);

  @override
  State<FoodPlateDetails> createState() => _FoodPlateDetailsState();
}

class _FoodPlateDetailsState extends State<FoodPlateDetails> {
  int _currentValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appetito',
          style: titleStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: ElevatedButton.icon(
            style: playIconButtonStyle,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
                Icons.arrow_back,
                color: blue,
              size: 40,
            ),
            label: const Text('')),
      ),
      body: Card(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/${widget.foodPlate.imageUrl}.jpg'),
                radius: 100.0,
              ),

              const SizedBox(height: 30.0,),

              NumberPicker(
                textStyle: const TextStyle(color: blue, fontFamily: 'Roboto'),
                selectedTextStyle: const TextStyle(color: orange, fontFamily: 'Roboto'),
                axis: Axis.horizontal,
                decoration: BoxDecoration(
                  border: Border.all(color: orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                value: _currentValue,
                minValue: 1,
                maxValue: 100,
                onChanged: (value) => setState(() => _currentValue = value),
              ),

              const SizedBox(height: 30.0,),
              Text(
                widget.foodPlate.name,
                style: const TextStyle(
                    fontSize: 35.0,
                    color: blue,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'
                ),),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.foodPlate.description,
                  style: const TextStyle(
                      color: gray,
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      height: 1.5
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Preço Total',
                          style: TextStyle(
                            color: blue,
                            fontSize: 19.0,
                            height: 1.5
                          ),
                        ),
                        Text(
                            'Kz ${_currentValue * widget.foodPlate.price}0',
                            style: const TextStyle(
                              color: blue,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              height: 1.5
                            ),
                        ),
                      ],
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                          )
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                          child: Text(
                              'Reservar',
                              style: TextStyle(
                                fontSize: 25.0
                              ),
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}