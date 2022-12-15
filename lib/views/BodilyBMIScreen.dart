import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:bodily_bmi_calculator/views/BodilyResultScreen.dart';
import 'package:bodily_bmi_calculator/models/BodilyModel.dart';
import 'package:bodily_bmi_calculator/helper/helper.dart';

class BodilyCalculatorScreen extends StatefulWidget {
  const BodilyCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BodilyCalculatorScreen> createState() => _BodilyCalculatorScreenState();
}

class _BodilyCalculatorScreenState extends State<BodilyCalculatorScreen>{
  late TextEditingController bbController = TextEditingController();
  late TextEditingController tbController = TextEditingController();
  late TextEditingController namaController = TextEditingController();
  late var tinggiBadan;
  late var beratBadan;
  late String nama;
  late String jenisKelamin;
  late BodilyModel bodilyModel;
  double _bmi = 0;
  bool isMaleClicked = false;
  bool isFemaleClicked = false;

  @override
  void dispose() {
    bbController.dispose();
    tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
               children: [
                 SizedBox(
                   height: 15,
                 ),
                 Text(
                   "Hi there Bodipal! \nWhat's your name?",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.pinkAccent,
                     fontWeight: FontWeight.normal,
                     fontSize: 20,
                   ),
                 ),
                 Lottie.asset(
                   "assets/lottie/womenandmen.json",
                   height: 200,
                 ),
                 TextFormField(
                     controller: namaController,
                     decoration: InputDecoration(
                       hintText: "Maximum character is 30",
                       labelText: "Name",
                       hintStyle: TextStyle(color: Colors.grey),
                     ),
                     keyboardType: TextInputType.name,
                     inputFormatters: <TextInputFormatter>[
                       FilteringTextInputFormatter.singleLineFormatter,
                       LengthLimitingTextInputFormatter(30)
                     ],
                     onChanged: (tb){
                       nama = namaController.text;
                     }
                 ),
                 SizedBox(
                   height: 80,
                 ),
                 Text(
                   "Are you a boy or a girl?",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.black54,
                     fontWeight: FontWeight.normal,
                     fontSize: 20,
                   ),
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Row(
                   children: [
                     GestureDetector(
                       onTap: (){
                         // Menentukan jenis kelamin
                         jenisKelamin = "Female";
                         print(jenisKelamin);
                       },
                       child: ZoomTapAnimation(child:
                       Column(
                         children: [
                           Lottie.asset(
                             "assets/lottie/women.json",
                             height: 120,
                           ),
                           Text(
                             "Female",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 color: Colors.black54,
                                 fontWeight: FontWeight.normal,
                                 fontSize: 15
                             ),
                           )
                         ],
                       )
                       )
                     ),
                     GestureDetector(
                       onTap: (){
                         // Menentukan jenis kelamin
                         jenisKelamin = "Male";
                         print(jenisKelamin);
                       },
                       child: ZoomTapAnimation(child:
                       Column(
                         children: [
                           Lottie.asset(
                             "assets/lottie/men.json",
                             height: 120,
                           ),
                           Text(
                             "Male",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                                 color: Colors.black54,
                                 fontWeight: FontWeight.normal,
                                 fontSize: 15
                             ),
                           )
                         ],
                       )
                       )
                     )
                   ],
                 ),
                 SizedBox(
                   height: 80,
                 ),
                 Text(
                   "Next, put down your body weight",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.teal,
                     fontWeight: FontWeight.normal,
                     fontSize: 20,
                   ),
                 ),
                 SizedBox(
                   height: 30,
                 ),
                 Lottie.asset(
                   "assets/lottie/exercise.json",
                   height: 170
                 ),
                 TextFormField(
                     controller: bbController,
                     decoration: InputDecoration(
                         hintText: "Body weight in (kg)",
                         labelText: "Weight",
                         hintStyle: TextStyle(color: Colors.grey),
                     ),
                     keyboardType: TextInputType.number,
                     inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                     ],
                     onChanged: (bb){
                       beratBadan = int.parse(bb);
                     }
                 ),
                 SizedBox(
                   height: 80,
                 ),
                 Text(
                   "And now, put down your body height",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.redAccent,
                     fontWeight: FontWeight.normal,
                     fontSize: 20,
                   ),
                 ),
                 SizedBox(
                   height: 35,
                 ),
                 Lottie.asset(
                     "assets/lottie/womenday.json",
                     height: 170
                 ),
                 TextFormField(
                     controller: tbController,
                     decoration: InputDecoration(
                       hintText: "Body height in (cm)",
                       labelText: "Height",
                       hintStyle: TextStyle(color: Colors.grey),
                     ),
                     keyboardType: TextInputType.number,
                     inputFormatters: <TextInputFormatter>[
                       FilteringTextInputFormatter.digitsOnly
                     ],
                     onChanged: (tb){
                       tinggiBadan = int.parse(tb);
                     }
                 ),
                 SizedBox(
                   height: 80,
                 ),
                 ZoomTapAnimation(child:
                    Container(
                       width: 200,
                       height: 45,
                       child: TextButton(
                         style: TextButton.styleFrom(
                           backgroundColor: Colors.lightBlue,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                           ),
                         ),
                         onPressed: () {
                           // Validasi

                           if(namaController.text == "" || bbController.text == "" || tbController.text == "" ||
                           namaController.text.isEmpty || bbController.text.isEmpty || tbController.text.isEmpty){
                             print("Please fill all data 😥");
                           } else {
                             setState(() {
                               _bmi = beratBadan/((tinggiBadan/100)*(tinggiBadan/100));
                               print(_bmi);

                               if(_bmi >= 18.5 && _bmi <= 25){
                                 // 1. Berat badan normal

                                 bodilyModel = BodilyModel(bmi: double.parse((_bmi).toStringAsFixed(2)), status: "Normal", indicator: "assets/gif/normal.gif", gender: jenisKelamin, name: nama);
                               }
                               else if(_bmi < 18.5){
                                 // 2. Berat badan kurang

                                 bodilyModel = BodilyModel(bmi: double.parse((_bmi).toStringAsFixed(2)), status: "Underweight", indicator: "assets/gif/underweight.gif", gender: jenisKelamin, name: nama);
                               }
                               else if(_bmi > 25 && _bmi <= 30){
                                 // 3. Berat badan overweight

                                 bodilyModel = BodilyModel(bmi: double.parse((_bmi).toStringAsFixed(2)), status: "Overweight", indicator: "assets/gif/overweight.gif", gender: jenisKelamin, name: nama);
                               }
                               else{
                                 // 4. Berat badan obesitas
                                 bodilyModel = BodilyModel(bmi: double.parse((_bmi).toStringAsFixed(2)), status: "Obessed", indicator: "assets/gif/obessed.gif", gender: jenisKelamin, name: nama);
                               }

                               // Clear controller
                               tbController.text = "";
                               bbController.text = "";
                               namaController.text = "";

                               // Navigasi ke halaman Result
                               Navigator.push(context, MaterialPageRoute(
                                   builder: (context) => BodilyResultScreen(ResultModel: bodilyModel, bmi: bodilyModel.bmi, indicator: bodilyModel.indicator, status: bodilyModel.status, name: bodilyModel.name, gender: bodilyModel.gender)
                               ));
                             });
                           }
                           print("${jenisKelamin} = jenis kelamin");
                           print("${bodilyModel.status} = status");
                           print("${bodilyModel.bmi} = bmi");
                           print("${bodilyModel.indicator} = indicator");
                         },
                         child: Text(
                           "Calculate ⭐",
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 18
                           ),
                         ),
                       ),
                     ),
                 )
               ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
