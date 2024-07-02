import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  late List<bool> _isChecked;

  @override
  void initState() {
    _isChecked = List<bool>.filled(10, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scrollbar(
      thumbVisibility: true,
      thickness: 2,
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 5),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _isChecked[index] = !_isChecked[index];
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color:
                      _isChecked[index] ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Checkbox(
                        side: WidgetStateBorderSide.resolveWith(
                          (states) => BorderSide(
                              width: 1.0,
                              color: _isChecked[index]
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        value: _isChecked[index],
                        activeColor: Colors.black,
                        onChanged: (value) {},
                      ),
                    ),
                    Text(
                      'Checkbox $index',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: _isChecked[index]
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
    
  }
}
