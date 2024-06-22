import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/surveys/presentation/widget/survey_widget.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
     
      color: const Color(ColorConstant.dashboardBackgroundColor),
      child: Column(
        children: [
          Container(
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            alignment: Alignment.center,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(ColorConstant.searchBarColor),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by name or description',
                hintStyle: const TextStyle( color: Colors.grey, fontSize: ConstantSize.small_2),
                isDense: true,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ConstantSize.small_1),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(ConstantSize.small_1),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height ,
            child: ListView.builder(
                itemCount: 11,
                itemBuilder: (context, index) {
                    if(index==10){
                      return Container(
                        color: Colors.red,
                        height: 100.h,);
                    }

                  return const SurveyWidget();


                }),
          ),

        
        ],
      ),
    );
  }
}
