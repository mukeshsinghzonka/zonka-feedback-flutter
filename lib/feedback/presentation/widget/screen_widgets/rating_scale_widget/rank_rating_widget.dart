import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class RankRatingWidget extends StatefulWidget {
  final Field field;
  const RankRatingWidget({super.key, required this.field});

  @override
  State<RankRatingWidget> createState() => _RankRatingWidgetState();
}

class _RankRatingWidgetState extends State<RankRatingWidget> {
  final List<int> _items = List<int>.generate(50, (int index) => index);
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value)  {
         return widget.field.fieldName;
      },
      builder: (context) {
        return Container( 
          width: 230.w,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: ReorderableListView.builder(
                shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
       
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



