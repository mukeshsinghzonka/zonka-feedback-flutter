import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/dashboard/data/data_model/workspace_model.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/dashboard_controller.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class WorkspacesList extends StatefulWidget {

  final WorkspaceModel workspaceModel;
  const WorkspacesList({super.key, required this.workspaceModel});

  @override
  State<WorkspacesList> createState() => _WorkspacesListState();
}

class _WorkspacesListState extends State<WorkspacesList> {

  final _workspaceController = Get.find<WorkspaceController>();
  final _dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: _workspaceController,
      builder: (context) {
        return GestureDetector(
          onTap: () {
          _workspaceController.setSelectedWorkspace(widget.workspaceModel);
          _dashboardController.overlayController.hide();
          },
          child: Container(
            margin: EdgeInsets.only(top: 6.h,left: 20.w,right: 20.w),
                          width: 300.w,
                          height: 25.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: widget.workspaceModel ==_workspaceController.selectedWorkspace? const Color(ColorConstant.appBarBottomColor):null,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child:  Text(widget.workspaceModel.workSpaceName,style: const TextStyle(color: Colors.white,fontSize: ConstantSize.medium_2),),
                          ),
        );
      }
    );
  }
}