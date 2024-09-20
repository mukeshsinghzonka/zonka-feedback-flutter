import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/setting/manager/country_code_controller.dart';
import 'package:zonka_feedback/setting/presentation/widget/search_widget.dart';

class CountryCodeWidget extends StatefulWidget {
  const CountryCodeWidget({super.key});

  @override
  State<CountryCodeWidget> createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {
  bool countryCodeDrop = false;
  final countryCodeController = Get.find<CountryCodeController>();


  @override
  void initState() {
      super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Default Country Code'),
              SizedBox(
                height: 5.h,
              ),
              GetBuilder(
                  init: countryCodeController,
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          countryCodeDrop = !countryCodeDrop;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                              builder: (context) {
                                if(countryCodeController.countryCodeModel.value.dialCode==''){
                                   return  Text('Select Country Code',style: TextStyle(color: Colors.grey.shade700, fontFamily: 'Source Sans Pro',),);
                                }
                                return Row(
                                  children: [
                                    Image.asset(
                                      'assests/large_flags/${countryCodeController.countryCodeModel.value.code}.png',
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container();
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(countryCodeController.countryCodeModel.value.countryName),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                        '(${countryCodeController.countryCodeModel.value.dialCode})')
                                  ],
                                );
                              }
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey.shade400,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder(
                  init: countryCodeController,
                  builder: (context) {
                    return SearchCommonWidget(
                      showSearchLocation: countryCodeDrop,
                      searchHintText: 'Search Country Code',
                      callback: (val) {
                        countryCodeController.setCountryCodeModel(
                            countryCodeController.countryCodeList.value
                                .firstWhere((e) {
                          return e.code == val.id;
                        }));
                      },
                      searchListData: List.from(
                          countryCodeController.countryCodeList.value.map((e) {
                        return SearchListClass(
                            listName: '${e.countryName} (${e.dialCode})',
                            isSelected: e.code ==
                                countryCodeController.countryCodeModel.value.code,
                            assestImageUrl: 'assests/large_flags/${e.code}.png',
                            id: e.code,
                            showImage: true);
                      })),
                    );
                  })
            ],
          )),
    );
  }
}
