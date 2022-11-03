import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class MurakkabaatPostScreen extends StatelessWidget {
  const MurakkabaatPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Index Name"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView.builder(
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  color: secondPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: kElevationToShadow[4],
                ),
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                margin: EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if at 1st book index we show these texts
                    Text(
                      'medicineId',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'medicineId',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'medicineName',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'medicineName',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'otherNames',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'otherNames',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text('identification',style: TextStyle(
                        color: textWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      'identification',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text('placeOfBirth',style: TextStyle(
                        color: textWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      'placeOfBirth',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text('modeOfAction',style: TextStyle(
                        color: textWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(
                      'modeOfAction',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'badEffect',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'badEffect',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'correctionWith',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'correctionWith',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'alternate',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'alternate',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'benefits',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'benefits',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    Text(
                      'dosage',
                      style: TextStyle(
                          color: textWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'dosage',
                      style: TextStyle(
                        color: textWhiteColor,
                      ),
                    ),
                    // if at 2nd book index we show these texts
                    // Text('prescriptionId'),
                    // Text('prescriptionName'),
                    // Text('prescriptionIngredients'),
                    // Text('prescriptionBenefits'),
                    // Text('prescriptionDosage'),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}