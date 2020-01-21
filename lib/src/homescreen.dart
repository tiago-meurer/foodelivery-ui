import 'package:flutter/material.dart';
import 'widgets/home_top_info.dart';
import 'widgets/food_category.dart';
import 'widgets/search_field.dart';
import 'widgets/bought_foods.dart';

//Data
import 'data/food_data.dart';
import 'models/food_model.dart';

class HomeScreen extends StatefulWidget {
  @override 
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  List<Food> _foods = foods;

  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold,);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0),
          SearchField(),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Os Mais Populares",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: (){},
              child: Text(
                  "Ver Todos",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.orangeAccent,
                  ),
                  ),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Column(
            children: _foods.map(_buildFoodItems).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: BoughtFoods(
        id: food.id,
        name: food.name,
        imagePath: food.imagePath,
        category: food.category,
        discount: food.discount,
        price: food.price,
        ratings: food.ratings,
      ),
    );
  }
}

