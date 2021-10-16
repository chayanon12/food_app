import 'dart:convert';
import 'package:food_app/main.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/food/food_list_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  _FoodMainPageState createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  var _selectedBottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu_book),
      //       label: 'Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Your Order',
      //     ),
      //   ],
      //   currentIndex: _selectedBottomNavIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedBottomNavIndex = index;
      //     });
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Center(
          child: _selectedBottomNavIndex == 0
              ? FoodListPage()
              : Text(
            "YOUR ORDER",
            style: GoogleFonts.mali(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.cyan,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }

  Future<void> _test() async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.get(url); // asynchronous
    if (response.statusCode == 200) {
      // ดึงค่า response.body

      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];
      print ('STATUS: $status');
      print('MESSAGE: $message');
      print('DATA: $data');
      data.forEach((element) {
        print(element['name']);

      });
    }
  }
}
