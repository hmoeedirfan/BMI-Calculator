import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Gender { male, female }

class _HomePageState extends State<HomePage> {
  Gender? gender;
  late String height;
  String heightFeet = '';
  String heightInch = '';
  final items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  int num = 0;
  final values = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  int index = 0;
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFEFEF),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: gender == Gender.male
                            ? const Color(0xff4F7DF9)
                            : Colors.white,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: const DecorationImage(
                        image: AssetImage(
                          'images/man.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: gender == Gender.female
                            ? const Color(0xff4F7DF9)
                            : Colors.white,
                        width: 5,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          'images/woman.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    height: 230,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const Text(
                            'Height (inch) ▼',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFDCE0E3),
                                ),
                                // // It takes me about 5 hour to find this,
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  onSelectedItemChanged: (index) {
                                    setState(() => this.index = index);
                                    heightFeet = items[index];
                                  },
                                  children: items
                                      .map((item) => Text(
                                            item,
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ))
                                      .toList(),
                                ),
                              ),
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFDCE0E3),
                                ),
                                child: CupertinoPicker(
                                  itemExtent: 50,
                                  onSelectedItemChanged: (index) {
                                    setState(() => num = index);
                                    heightInch = values[num];
                                  },
                                  children: values
                                      .map((item) => Text(
                                            item,
                                            style:
                                                const TextStyle(fontSize: 30),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${items[index]} feet ${values[num]} inches",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10, 22, 10, 0)),
                      const Text(
                        'Weight (kg) ▼',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 110,
                        child: TextFormField(
                          controller: _weight,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4F7DF9),
                                width: 4,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4F7DF9),
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0)),
                      const Text(
                        'Age',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 116,
                        child: TextFormField(
                          controller: _age,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4F7DF9),
                                width: 4,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4F7DF9),
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4F7DF9),
                    fixedSize: const Size(350, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    calculateBmi(_weight, heightFeet, heightInch);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
