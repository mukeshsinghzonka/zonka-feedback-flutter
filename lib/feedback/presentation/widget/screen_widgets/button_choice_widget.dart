import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonChoiceWidget extends StatelessWidget {
  const ButtonChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15),
            itemCount: 4, // <-- required
            itemBuilder: (context, i) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Colors.black),
                color: Colors.grey.shade300,
              ),
              child: Center(child: Text('Choice $i')),
            ),
          ),
    );
  }
}
