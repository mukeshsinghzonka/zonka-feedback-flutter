import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';

class RankRatingWidget extends StatefulWidget {
  final Field field;
  const RankRatingWidget({super.key, required this.field});

  @override
  State<RankRatingWidget> createState() => _RankRatingWidgetState();
}

class _RankRatingWidgetState extends State<RankRatingWidget> {
  late List<Choice> _items;
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyCollectDataController surveyCollectDataController =
      Get.find<SurveyCollectDataController>();

  @override
  void initState() {
    // Initialize _items with the correct type
    _items = List<Choice>.generate(widget.field.choices.length, (int index) {
      return widget.field.choices[index]; // return the Choice object at index
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _items);
      return null;
    }, builder: (context) {
      return Container(
        width: 230.w,
        alignment: Alignment.topCenter,
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
                    '${_items[index].translations[surveyFieldController.defaultTranslation.value]?.name}',
                    style: const TextStyle(color: Colors.white),
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
    });
  }
}
