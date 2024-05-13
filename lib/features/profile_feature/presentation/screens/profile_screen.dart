import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.fromCheckOut = false});

  final bool fromCheckOut;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fNameCont = TextEditingController();
  TextEditingController lNameCont = TextEditingController();
  TextEditingController addressCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  XFile? userImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: 'My Profile',
        centerTitle: true,
        notify: false,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    userImage != null
                        ? CircleAvatar(
                            radius: 70.r,
                            backgroundImage: FileImage(File(userImage!.path))
                            )
                        :
                    CircleAvatar(
                      radius: 70.r,
                      backgroundImage: NetworkImage(
                        "http://graduation2024.first-meeting.net/Uploads/Users/defultuser.png",
                      ),
                    ),
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor, shape: BoxShape.circle),
                      child: InkWell(
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
                                    )),
                                //height: 200.h,
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidget(
                                      title: "choose Picture",
                                      titleAlign: TextAlign.center,
                                      titleSize: 20.sp,
                                      titleFontWeight: FontWeight.w600,
                                      fontFamily: AppFonts.regular,
                                      titleColor: Colors.black,
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await ImagePickerService.getImage(
                                                    imageSource:
                                                        ImageSource.camera)
                                                .then((value) {
                                              userImage = value;
                                              setState(() {});
                                            });
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                            color: Colors.black,
                                            size: 25.sp,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await ImagePickerService.getImage(
                                                    imageSource:
                                                        ImageSource.gallery)
                                                .then((value) {
                                              userImage = value;
                                              setState(() {});
                                            });
                                          },
                                          icon: Icon(
                                            Icons.photo_library_rounded,
                                            color: Colors.black,
                                            size: 25.sp,
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
                          Icons.edit,
                          size: 24.sp,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              13.verticalSpace,
              TextWidget(
                title: AuthCubit.get().userModel?.userName ??
                    getIt<CacheService>().getUserData()?.userName ??
                    "",
                titleSize: 16.sp,
                fontFamily: AppFonts.bold,
                titleFontWeight: AppFonts.bold600,
              ),
              TextWidget(
                title: AuthCubit.get().userModel?.email ??
                    getIt<CacheService>().getUserData()?.email ??
                    "",
                titleSize: 13.sp,
              ),
              20.verticalSpace,
              CustomFormField(
                header: "First Name",
                controller: fNameCont,
              ),
              16.verticalSpace,
              CustomFormField(
                header: "Last Name",
                controller: lNameCont,
              ),
              16.verticalSpace,
              CustomFormField(
                header: "Address",
                controller: addressCont,
                suffixIcon: Icons.location_on,
              ),
              16.verticalSpace,
              CustomFormField(
                header: "Email",
                controller: emailCont,
              ),
              16.verticalSpace,
              CustomFormField(
                header: "Password",
                controller: passwordCont,
                suffixIcon: Icons.visibility_off,
              ),
              16.verticalSpace,
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Container(
              padding: EdgeInsets.all(16.sp),
              child: ButtonWidget(
                loading: state is LoadingState,
                onPressed: () {},
                text: "Save",
                mainAxisAlignment: MainAxisAlignment.center,
                textColor: AppColors.white,
              ));
        },
      ),
    );
  }
}
