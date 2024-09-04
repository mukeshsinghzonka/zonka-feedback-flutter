import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class WorkspacesList extends StatefulWidget {

  final WorkspaceModel workspaceModel;
   final void Function(String) onDataReceived;
  const WorkspacesList({super.key, required this.workspaceModel, required this.onDataReceived});

  @override
  State<WorkspacesList> createState() => _WorkspacesListState();
}

class _WorkspacesListState extends State<WorkspacesList> {

  final _workspaceController = Get.find<WorkspaceController>();
  final _dashboardController = Get.find<DashboardController>();
  final _surveyManagerController = Get.find<SurveyManagerController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _workspaceController,
      builder: (context) {
        return GestureDetector(
          onTap: () {
          _workspaceController.setSelectedWorkspace(widget.workspaceModel);
          _dashboardController.overlayController.hide();
          _surveyManagerController.getSurveyListWorkspace();
          widget.onDataReceived(widget.workspaceModel.workSpaceName);
          },
          child: Container(
            margin: EdgeInsets.only(top: 6.h,left: 20.w,right: 20.w),
                          width: 300.w,
                          height: 25.h,
                          padding: EdgeInsets.only(left: 10.w,right: 10.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: widget.workspaceModel ==_workspaceController.selectedWorkspace? const Color(ColorConstant.appBarBottomColor):null,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child:  Text(widget.workspaceModel.workSpaceName,style: const TextStyle(color: Colors.white,fontSize: ConstantSize.small_2),),
                          ),
        );
      }
    );
  }
}