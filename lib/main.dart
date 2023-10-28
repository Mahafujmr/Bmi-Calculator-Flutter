import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Bmi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Your Bmi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "'";
  var bgColor = Colors.amber.shade300;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Your Bmi'),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,

      ),
      body:Container(
        color:bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('BMI',style: TextStyle(
              fontSize: 34,fontWeight: FontWeight.w700,
            ),


            ),

            SizedBox(height: 3,),
                TextField(
                  controller: wtController ,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight (in Kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 10,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height (in Inch)'),
                    prefixIcon: Icon(Icons.accessibility ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 14,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //Bmi Calculation
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt*12) + iInch;

                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);
                    var msg = "";


                    if(bmi>25){
                      msg = " You're OverWeight!";
                      bgColor = Colors.lightGreen.shade200;
                    } else if (bmi<18){
                       msg = "You're UnderWeight!";
                       bgColor = Colors.red.shade200;
                    }else{
                       msg = "You're Healthy!";
                       bgColor = Colors.green.shade200;
                    }


                    setState(() {
                      result = "$msg \n Your BMI Is:${bmi.toStringAsFixed(4)}";
                    });





                  }else{
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }

                }, child: Text('Calculate'),),



               Text(result,style: TextStyle(fontSize: 18),),

                SizedBox(height: 5,),


    ],


    ),
          ),
        ),
      ));
  }
}
