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
                  style: TextStyle(color: Colors.white),
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
}



// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomReorderableListViewExample extends StatefulWidget {
//   @override
//   _CustomReorderableListViewExampleState createState() => _CustomReorderableListViewExampleState();
// }

// class _CustomReorderableListViewExampleState extends State<CustomReorderableListViewExample> {
//   List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: ListView.builder(
//         shrinkWrap: true,
//         padding: const EdgeInsets.symmetric(horizontal: 40),
//         itemCount: _items.length,
//         itemBuilder: (context, index) {
//           return LongPressDraggable<String>(
//             data: _items[index],
//             axis: Axis.vertical,
//             feedback: Material(
//               child: Container(
//                 height: 40.h,
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.w),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(5.r),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 5.w),
//                 child: Text(
//                   'Choice ${_items[index]}',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             childWhenDragging: Container(
//               height: 40.h,
//               margin: EdgeInsets.all(5.w),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(5.r),
//               ),
//             ),
//             onDragStarted: () {},
//             onDragCompleted: () {},
//             onDraggableCanceled: (velocity, offset) {},
//             child: DragTarget<String>(
//               onAcceptWithDetails: (data) {
//                 setState(() {
//                   int oldIndex = _items.indexOf(data.data);
//                   int newIndex = index;
//                   if (oldIndex < newIndex) {
//                     newIndex -= 1;
//                   }
//                   final item = _items.removeAt(oldIndex);
//                   _items.insert(newIndex, item);
//                 });
//               },
//               onWillAcceptWithDetails: (data) => true,
//               builder: (context, candidateData, rejectedData) {
//                 return Container(
//                   height: 40.h,
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.all(5.w),
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(5.r),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 5.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Choice ${_items[index]}',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Icon(Icons.drag_handle, color: Colors.white),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
