import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/models/food_item.dart';

class Detail extends StatelessWidget {
  //static const routeName = '/detail';
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(item.name),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.asset('assets/images/${item.image}')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("$item" ,style: GoogleFonts.mali(fontSize: 30,color: Colors.black87),),
            ),
          ],
        ),
      ),
    );
  }
}