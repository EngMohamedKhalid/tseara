import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/categories_feature/presentation/PLH/category_cubit.dart';

import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen(
      {super.key, required this.categoryId, required this.categoryTitle,});

  final int categoryId;
  final String categoryTitle;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    super.initState();
    CategoryCubit.get().getSubCategory(id: widget.categoryId);
  }

  bool isFirst = true;
  String? selectedValue ;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          title: widget.categoryTitle,
          centerTitle: true,
          notify: false,
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            var cubit = CategoryCubit.get();
            return Column(
              children: [
                CustomDropDown(
                  width: 200,
                  height: 60.h,
                  items: cubit.titles??[""],
                  dropDownHint: selectedValue??"المنتجات الغذائيه",
                  onItemChanged: (value) {
                    setState(() {
                      selectedValue = value;
                      isFirst = !isFirst;
                    });
                  },
                ),
                Text(
                  isFirst?"المنتجات الغذائيه":"المشروبات "
                )
              ],
            );
          },
        ),


      ),
    );
  }
}
