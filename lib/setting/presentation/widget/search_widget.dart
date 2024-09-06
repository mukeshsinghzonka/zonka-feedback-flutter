import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class SearchCommonWidget extends StatefulWidget {
  final bool showSearchLocation;
  final bool? showImage;
  final List<SearchListClass> searchListData;
  const SearchCommonWidget(
      {super.key,
      required this.showSearchLocation,
      this.showImage,
      required this.searchListData});

  @override
  State<SearchCommonWidget> createState() => _SearchCommonWidgetState();
}

class _SearchCommonWidgetState extends State<SearchCommonWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: widget.showSearchLocation,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Search Location'),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey.shade400,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: size.height / 4,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                border: Border.all(color: Colors.grey.shade200)),
            child: ListView.builder(
                itemCount: widget.searchListData.length,
                itemBuilder: (context, value) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.searchListData[value].listName),
                        Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(ColorConstant.themeColor),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 12.h,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SearchListClass {
  final String? imageUrl;
  final bool showImage;
  final String listName;
  final bool isSelected;
  final String id;
  SearchListClass(
      {this.imageUrl,
      required this.listName,
      required this.isSelected,
      required this.id,
      required this.showImage});
}
