import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/callback_function.dart';
import 'package:zonka_feedback/utils/color_constant.dart';


class SearchCommonWidget extends StatefulWidget {
  final bool showSearchLocation;
  final bool? showImage;
  final List<SearchListClass> searchListData;
  final SearchListClassCallBack callback;
  final String searchHintText;
  const SearchCommonWidget(
      {super.key,
      required this.searchHintText,
      required this.showSearchLocation,
      this.showImage,
      required this.callback,
      required this.searchListData});

  @override
  State<SearchCommonWidget> createState() => _SearchCommonWidgetState();
}

class _SearchCommonWidgetState extends State<SearchCommonWidget> {
  final TextEditingController _searchController = TextEditingController();

  List<SearchListClass> searchListData = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: widget.showSearchLocation,
      child: Column(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Colors.grey.shade200)),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
              border: InputBorder.none,
               hintText: widget.searchHintText,
               hintStyle: TextStyle(fontWeight: FontWeight.normal,fontSize: 10.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10.w),
              ),
              onChanged: (value) {
                List<SearchListClass> filteredList =
                    widget.searchListData.where((element) {
                  return element.listName
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase());
                }).toList();
                setState(() {
                  searchListData = filteredList;
                });
              },
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
                itemCount: _searchController.text.isNotEmpty
                    ? searchListData.length
                    : widget.searchListData.length,
                itemBuilder: (context, value) {
                  final finalListvalue = _searchController.text.isNotEmpty
                      ? searchListData[value]
                      : widget.searchListData[value];
                  return GestureDetector(
                    onTap: () {
                      widget.callback(finalListvalue);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                              Builder(builder: (context) {
                              if (finalListvalue.showImage == false) {
                                return Container();
                              }
                              return Image.asset(
                                  finalListvalue.assestImageUrl ?? "");
                            }),
                            SizedBox(width: 10.w),
                            Text(finalListvalue.listName),
                              ],
                            ),
                          ),
                        
                          Visibility(
                            visible: finalListvalue.isSelected,
                            child: Container(
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
                            ),
                          )
                        ],
                      ),
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
  final String? assestImageUrl;
  SearchListClass(
      {this.imageUrl,
      required this.listName,
      this.assestImageUrl,
      required this.isSelected,
      required this.id,
      required this.showImage});
}
