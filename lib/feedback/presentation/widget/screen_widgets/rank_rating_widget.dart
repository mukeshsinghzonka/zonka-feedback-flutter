import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankRatingWidget extends StatefulWidget {
  const RankRatingWidget({super.key});

  @override
  State<RankRatingWidget> createState() => _RankRatingWidgetState();
}

class _RankRatingWidgetState extends State<RankRatingWidget> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value)  {},
      builder: (context) {
        return Container(
          width: 230.w,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: ReorderableListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            itemBuilder: (context, index) {
              return Container(
                height: 40.h,
                key: ValueKey(index),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Choice ${_items[index]}',
                      style:const TextStyle(color: Colors.white),
                    ),
                   ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle, color: Colors.white),
                    ),
                  ],
                ),
              );
            },
            itemCount: _items.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = _items.removeAt(oldIndex);
                _items.insert(newIndex, item);
              });
            },
          ),
        );
      }
    );
  }
}



