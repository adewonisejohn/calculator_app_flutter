import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/keys.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color light_background_color = Color(0xffffffff);
  Color light_key_color = Color(0xfff9f9f9);
  Color screen_text_color = Colors.black;
  Color keyboard_color = Color(0xfff9f9f9);
  Color key_color = Color(0xffEFEFEF);
  Color key_top_color = Color(0xff6cc9be);
  Color operator_color=Color(0xffe18a8c);
  Color number_color = Color(0xff393a3e);


  var final_answer=0;
  var calculation = "";
  var first_segment="";
  var second_segment="";
  var operator="";
  var list_of_operators=["/","X","-","+","%"];

  void input_value(String input){
    if(first_segment!=""){
      if(list_of_operators.contains(input)){
        setState(() {
          operator=input;
        });
      }

    }
    if(operator==""){
      print("first segment");
      first_segment+=input;
      print(first_segment);

    }else{
      if(list_of_operators.contains(input)==false){
        print('second segment');
        second_segment+=input;
        print(second_segment);
      }
    }
  }

  void final_calculation(){
    first_segment=first_segment.toString();
    second_segment=second_segment.toString();
    int x=int.parse(first_segment);
    int y=int.parse(second_segment);

    switch(operator){
      case "/":
        setState(() {
          final_answer=(x/y) as int;

        });
        break;
      case "X":
        setState(() {
          final_answer=x*y;
        });
        break;
      case "-":
        setState(() {
          final_answer=x-y;
        });
        break;
      case "+":
        setState(() {
          final_answer=x+y;
        });
        break;
      case "%":
        setState(() {
          final_answer=x%y;
        });
        break;
      default:
        print("defalut case reached");
    }
  }


  bool dark_mode=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:light_background_color,
      body:Column(
        children: [
          SizedBox(height:MediaQuery.of(context).size.height*0.07,),
          Center(
            child:Container(
              padding:EdgeInsets.only(left:15,right:15),
              width:MediaQuery.of(context).size.width*0.23,
              height:MediaQuery.of(context).size.height*0.06,
              decoration:BoxDecoration(
                color:light_key_color,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(17),
                  right: Radius.circular(17),
                )

              ),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      print("aboout to change to light mode");
                      setState(() {
                        light_background_color = Color(0xffffffff);
                        light_key_color = Color(0xfff9f9f9);
                        screen_text_color = Colors.black;
                        keyboard_color = Color(0xfff9f9f9);
                        key_color = Color(0xffEFEFEF);
                        key_top_color = Color(0xff6cc9be);
                        operator_color=Color(0xffe18a8c);
                        number_color = Color(0xff393a3e);
                      });
                    },
                      child: Icon(Icons.wb_sunny_outlined,size:20,color:number_color,)
                  ),
                  GestureDetector(
                    onTap:(){
                      print('about to change to dark mode');
                      setState(() {
                        light_background_color = Color(0xff22252d);
                        light_key_color = Color(0xff292d36);
                        screen_text_color = Colors.white;
                        keyboard_color = Color(0xff292d36);
                        key_color = Color(0xff272a32);
                        key_top_color = Color(0xff6cc9be);
                        operator_color=Color(0xffe18a8c);
                        number_color = Color(0xffe8e9ea);
                      });

                    },
                      child: Icon(Icons.mode_night_outlined,size:20,color:number_color,)
                  ),

                ],
              ),
            ),
          ),

          Container(
            margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
            height:MediaQuery.of(context).size.height*0.13,
            width:double.infinity,
            color:Colors.transparent,
            child:Column(
              children: [
                Container(
                  padding:EdgeInsets.only(right:25,left:25),
                  alignment:Alignment.centerRight,
                  color:Colors.transparent,
                  height:MediaQuery.of(context).size.height*0.06,
                  child:Text(calculation,style:GoogleFonts.inter(fontSize:20,fontWeight:FontWeight.w700,letterSpacing:2.0,color:screen_text_color)),
                ),
                Expanded(
                  child:Container(
                    padding:EdgeInsets.only(right:25,left:25),
                    alignment:Alignment.centerRight,
                    color:Colors.transparent,
                    child:Text(final_answer.toString(),style:GoogleFonts.inter(fontWeight:FontWeight.w600,fontSize:40,letterSpacing:2.0,color:screen_text_color),),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.05,),
          Expanded(
            child: Container(
              padding:EdgeInsets.only(left:45,right:45),
              width: double.infinity,
              height:MediaQuery.of(context).size.height*0.5,
              decoration:BoxDecoration(
                  color:keyboard_color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )
              ),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      key(value:"AC",color:key_top_color,back_color:key_color,),
                      key(value:"+/-",color:key_top_color,back_color:key_color,),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="%";
                              input_value("%");
                            });
                          },
                          child: key(value:"%",color:key_top_color,back_color:key_color,)
                      ),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            calculation+="/";
                            input_value("/");

                          });
                        },
                          child: key(value:"/",color:operator_color,back_color:key_color,)
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="7";
                              input_value("7");

                            });
                          },
                          child: key(value:"7",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="8";
                              input_value("8");

                            });
                          },
                          child: key(value:"8",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="9";
                              input_value("9");

                            });
                          },
                          child: key(value:"9",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            calculation+="X";
                            input_value("X");

                          });
                        },
                          child: key(value:"X",color:operator_color,back_color:key_color,)
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="4";
                              input_value("4");

                            });
                          },
                          child: key(value:"4",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="5";
                              input_value("5");


                            });
                          },
                          child: key(value:"5",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="6";
                              input_value("6");

                            });
                          },
                          child: key(value:"6",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="-";
                              input_value("-");

                            });
                          },
                          child: key(value:"-",color:operator_color,back_color:key_color,)
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="1";
                              input_value("1");

                            });
                          },
                          child: key(value:"1",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="2";
                              input_value("2");

                            });
                          },
                          child: key(value:"2",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="3";
                              input_value("3");

                            });
                          },
                          child: key(value:"3",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            calculation+="+";
                            input_value("+");

                          });
                        },
                          child: key(value:"+",color:operator_color,back_color:key_color,)
                      )

                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation="";
                              final_answer=0;
                              calculation = "";
                              first_segment="";
                              second_segment="";
                              operator="";
                            });
                          },
                          child: key(value:"C",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                          onTap:(){
                            setState(() {
                              calculation+="0";
                              input_value("0");

                            });
                          },
                          child: key(value:"0",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            calculation+=".";
                            input_value(".");


                          });
                        },
                          child: key(value:".",color:number_color,back_color:key_color,)
                      ),
                      GestureDetector(
                        onTap:(){
                          final_calculation();
                          setState(() {
                            first_segment=final_answer.toString();
                            second_segment="";
                          });
                        },
                          child: key(value:"=",color:operator_color,back_color:key_color,)
                      )

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
