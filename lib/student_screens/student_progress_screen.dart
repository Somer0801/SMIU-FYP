import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../components/colors.dart';

class StudentProgressScreen extends StatefulWidget {
  const StudentProgressScreen({Key? key}) : super(key: key);

  @override
  State<StudentProgressScreen> createState() => _StudentProgressScreenState();
}

class _StudentProgressScreenState extends State<StudentProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: Get.height*0.17,
                width: Get.width*1,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAssets.smiulogo),fit: BoxFit.cover)
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                      onTap: (){
                        Get.to(StudentDashboardScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                      )),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.03),
            Text("Project Progress",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
            SizedBox(height: Get.height*0.06),
            Text("FYP Management System",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
      SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: [
              ChartData('Progress', 60),
              ChartData('Remaining',40 ),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelMapper: (ChartData data, _) => '${data.value}%',
            dataLabelSettings: DataLabelSettings(

              isVisible: true, // Set to true to display data labels
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),

            ),
            pointColorMapper: (ChartData data, _) {
              if(data.category=="Remaining"){
                return Colors.amber;

              }
    if (data.category == 'Progress') {
      if (data.value <= 20) {
        return Colors.red;
      } else if (data.value <= 40 && data.value >= 20) {
        return Colors.blue;
      } else if (data.value <= 60 && data.value >= 40) {
        return Colors.purple;
      } else if (data.value <= 100 && data.value >= 80) {
        return Colors.green;
      }
    }

    // Color for remaining/incomplete tasks
  },

          ),
        ],
      ),




        
          ],
        ),
      ),
    );
  }
}
class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
