import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color green = Colors.green;

class SingleSelectionScreen extends StatefulWidget {
  const SingleSelectionScreen({Key? key}) : super(key: key);

  @override
  _SingleSelectionScreenState createState() => _SingleSelectionScreenState();
}

class _SingleSelectionScreenState extends State<SingleSelectionScreen> {
  int changeColor = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children:
                List.generate(
                    7, (index) => InkWell(
                    onTap: (){
                      setState(() {
                        changeColor=index;
                      });
                    },
                    child: singleSelectionContainer(
                      color: changeColor!=index ?Colors.red : green)
                 )
                )
              ),
              changeColor!=-1?InkWell(
                  onTap: (){
                    // Get.to();
                  },
                  child: singleSelectionContainer(text: "Next Page" ,color: Colors.blue)):singleSelectionContainer(text: "Next Page" ,color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}

Widget singleSelectionContainer(
    {String text = "single Selection", Color color = Colors.red}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 50,
      width: Get.width,
      color: color,
      child: Center(child: Text(text)),
    ),
  );
}
