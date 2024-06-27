import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tseara/app/utils/app_colors.dart';
import 'package:tseara/app/widgets/button_widget.dart';
import 'package:tseara/app/widgets/custom_form_field.dart';
import 'package:tseara/app/widgets/default_app_bar_widget.dart';
import 'package:tseara/features/profile_feature/presentation/PLH/profile_cubit.dart';

import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/widgets/text_widget.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key, this.isBNB = true});

  final bool isBNB;

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get();
        return Scaffold(
          appBar: DefaultAppBarWidget(
            // title: "",
            // centerTitle: true,
            notify: false,
            canBack: widget.isBNB ? false : true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  GifView.asset(
                    'assets/images/complement.gif',
                    height: 200,
                    width: 200,
                    frameRate: 30, // default is 15 FPS
                  ),
                  CustomFormField(
                    hint: "اسم المستخدم",
                    controller: cubit.userNameController,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "البريد الالكتروني",
                    controller: cubit.userEmailController,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "عنوان الشكوهِ",
                    controller: cubit.addressController,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "التليفونِ",
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.number,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "الرقم القومي",
                    controller: cubit.nationalIdController,
                    keyboardType: TextInputType.number,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "تفاصيل الشكوي",
                    maxLines: 5000,
                    minLines: 5000,
                    height: 150.h,
                    controller: cubit.complaintController,
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        )
                                    ),
                                    //height: 200.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextWidget(
                                          title: "اختيار صور".tr(),
                                          titleAlign: TextAlign.center,
                                          titleSize: 20.sp,
                                          titleColor: Colors.black,
                                        ),
                                        20.verticalSpace,
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed:() async{
                                                Navigator.pop(context);
                                                await ImagePickerService.getImage(imageSource: ImageSource.camera).then((value) {
                                                  cubit.userImage = value;
                                                  if(value != null){
                                                    setState(() {

                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.camera_alt_rounded,
                                                color: Colors.black,
                                                size:25.sp ,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed:()async {
                                                Navigator.pop(context);
                                                await ImagePickerService.getImage(imageSource: ImageSource.gallery).then((value) {
                                                  cubit.userImage = value;
                                                  if(value != null){
                                                    setState(() {

                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.photo_library_rounded,
                                                color: Colors.black,
                                                size:25.sp ,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.image,
                              color: AppColors.mainColor,
                              size: 50.sp,
                            ),
                          ),
                          TextWidget(
                            title: "اختار صورة",
                            titleSize: 15.sp,
                            titleFontWeight: FontWeight.w600,
                            titleColor: Colors.black,
                          ),
                        ],
                      ),
                      50.horizontalSpace,
                      Container(
                        height: 150.h,
                        width: 150.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColors.mainColor
                            )
                        ),
                        child:
                        cubit.userImage != null ?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.file(
                            File(cubit.userImage!.path),
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        )
                            : TextWidget(
                          title: "لم يتم اختيار صورة",
                          titleSize: 15.sp,
                          titleFontWeight: FontWeight.w600,
                          titleColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  25.verticalSpace
                ],
              ),
            )
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(
              bottom: 40.h,
              left: 20.w,
              right: 20.w,
            ),
            child: ButtonWidget(
              loading: state is ProfileLoading,
              text: "أرسل شكوي",
              onPressed: () {
                if(formKey.currentState!.validate()){
                  cubit.addReport();
                }
              },
              color: AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
