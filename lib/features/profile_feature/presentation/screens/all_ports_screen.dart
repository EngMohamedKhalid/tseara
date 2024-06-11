import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/app/utils/helper.dart';
import 'package:tseara/app/widgets/custom_drop_down.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/app/widgets/text_widget.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:tseara/features/home_feature/presentation/PLH/home_cubit.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';

class AllPortsScreen extends StatefulWidget {
  const AllPortsScreen({super.key});

  @override
  State<AllPortsScreen> createState() => _AllPortsScreenState();
}

class _AllPortsScreenState extends State<AllPortsScreen> {
  final List<String> items = [
    'القاهره',
    'الدقهلية',
    'الشرقية',
    'الاسكندرية',
  ];
  int portType = 1;
  @override
  void initState() {
    super.initState();
    HomeCubit.get().getPorts();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: "المنافذ",
          centerTitle: true,
          onPop: () {
            navigateTo(BNBScreen(),removeAll: true);
          },
          notify: false,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              32.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      items: items,
                        dropDownHint: 'اسم المحافظة',
                        onItemChanged: (value) {},
                    )
                  ),
                  16.horizontalSpace,
                  Expanded(
                      child: CustomDropDown(
                        items: ["ثابت", "متحرك",],
                        dropDownHint: "نوع المنفذ",
                        onItemChanged: (value) {
                          setState(() {
                           portType = value == "ثابت" ? 1 : 2;
                          });
                          HomeCubit.get().getPorts(type: portType);
                        },
                      )
                  ),
                ],
              ),
              16.verticalSpace,
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: HomeCubit.get().ports?.length??0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: .8
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(16.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.gery4.withOpacity(.05),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageWidget(
                            imageUrl: "assets/images/egp.png",
                            width: 30.w,
                            height: 30.h,
                          ),
                          TextWidget(
                            title: HomeCubit.get().ports?[index].portName??"المنافذ التابعة لوزارة الداخليه(امان)",
                            titleSize: 16.sp,
                            titleFontWeight: FontWeight.w500,
                            titleColor: AppColors.mainColor,
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.red,
                              ),
                              TextWidget(
                                title: HomeCubit.get().ports?[index].governorate??"القاهره",
                                titleSize: 18.sp,
                                titleFontWeight: FontWeight.w500,
                                titleColor: AppColors.black,
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              Icon(
                                Icons.more_vert_sharp,
                                color: AppColors.red,
                              ),
                              TextWidget(
                                title: HomeCubit.get().ports?[index].type??"متحرك",
                                titleSize: 18.sp,
                                titleFontWeight: FontWeight.w500,
                                titleColor: AppColors.black,
                              ),
                            ],
                          ),
                          // TextWidget(
                          //   title: "منفذ متحرك دائم تابع لوزارة الداخليه",
                          //   titleSize: 16.sp,
                          //   titleFontWeight: FontWeight.w500,
                          //   titleColor: AppColors.black,
                          // ),
                        ],
                      ),
                    );
                  },
              )
            ],
          ),
        );
  },
),
      ),
    );
  }
}
