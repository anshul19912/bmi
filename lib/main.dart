import 'package:flutter/material.dart';

void main() => runApp(BMI());

class BMI extends StatefulWidget {
  BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  TextEditingController heightincm = TextEditingController();
  TextEditingController weightinkg = TextEditingController();
  double bmical = 0.00;
  String status = "";

  void calbmi(double weight, double height) {
    setState(() {
      bmical = weight * 10000 / (height * height);

      if (bmical < 18.5) {
        status = "You are Underweight";
      } else if (bmical > 18.5 && bmical < 24.9) {
        status = "You are Normal";
      } else if (bmical > 25.0 && bmical < 29.9) {
        status = "You are Overweight";
      } else if (bmical > 30) {
        status = "You are Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/Images/bmi.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "BMI Calculator",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: "Merriweather",
                      color: Colors.red,
                      decoration: TextDecoration.underline),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Weight (in Kg)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Merriweather",
                          color: Colors.white),
                    ),
                    Text(
                      "Height (in cm)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Merriweather",
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80,
                      child: TextField(
                        cursorHeight: 30,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        controller: weightinkg,
                        decoration: InputDecoration(
                          hintText: "0.00",
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: TextField(
                        cursorHeight: 30,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        controller: heightincm,
                        decoration: InputDecoration(
                          hintText: "0.00",
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      calbmi(double.parse(weightinkg.text),
                          double.parse(heightincm.text));
                    },
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        // margin: const EdgeInsets.all(10),
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.tealAccent),
                        child: Center(
                            child: Text(
                          "Calculate BMI",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Text(bmical.toStringAsFixed(2),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                Text(status,
                    style: TextStyle(
                        color: Color(0xffaacc00),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
