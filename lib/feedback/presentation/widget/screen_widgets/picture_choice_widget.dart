import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureChoiceWidget extends StatefulWidget {
  const PictureChoiceWidget({super.key});

  @override
  State<PictureChoiceWidget> createState() => _PictureChoiceWidgetState();
}

class _PictureChoiceWidgetState extends State<PictureChoiceWidget> {
   
int lenght = 3;
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        
      },
      builder: (context) {
        return Center(
          child: SizedBox(
            width: 220.w,
            child: Scrollbar(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:  4,
                    childAspectRatio: 1.5 ,     
                ),
                itemCount: 5, // <-- required
                itemBuilder: (context, i) => Center(
                  child: Container(
                    height: 120.h,
                    width: 35.w,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      border: Border.all(color: Colors.black),
                      color: Colors.grey.shade300,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.r),
                            child: Image.network('https://picsum.photos/250?image=$i',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container();
                            },
                            ),
                          )),
                          SizedBox(
                            height: 5.h,
                          ),
                        Text('Choice $i',style: TextStyle(fontSize: 4.sp),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
