import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureChoiceWidget extends StatefulWidget {
  const PictureChoiceWidget({super.key});

  @override
  State<PictureChoiceWidget> createState() => _PictureChoiceWidgetState();
}

class _PictureChoiceWidgetState extends State<PictureChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.w,
        child: Scrollbar(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
                ),
            itemCount: 8, // <-- required
            itemBuilder: (context, i) => Center(
              child: Container(
                height: 130.h,
                width: 60.w,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  border: Border.all(color: Colors.black),
                  color: Colors.grey.shade300,
                ),
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      child: Image.network('https://picsum.photos/250?image=$i',
                      
                      errorBuilder: (context, error, stackTrace) {
                        return Container();
                      },
                      )),
                      SizedBox(
                        height: 5.h,
                      ),
                    Text('Choice $i',style: TextStyle(fontSize: 6.sp),),
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
