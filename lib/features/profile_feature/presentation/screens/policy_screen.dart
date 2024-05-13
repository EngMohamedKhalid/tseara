import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "PrivacyPolicy".tr(),
        centerTitle: true,
        notify: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child:Column(
          children: [
            TextWidget(
                title: """This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.
We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.
""",
                 titleColor: AppColors.black,
                titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            8.verticalSpace,
            Row(
              children: [
                TextWidget(
                    title: "Collecting Your Personal Data",
                     titleColor: AppColors.black,
                    titleMaxLines: 300,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                TextWidget(
                    title: "Personal Data",
                    titleColor: AppColors.black,
                    titleMaxLines: 300,
                  titleSize: 15.sp,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            TextWidget(
                title: """While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:\n \t\t\t \u2022 Email address\n \t\t\t \u2022 First name and last name\n \t\t\t \u2022 Phone number\n \t\t\t \u2022 Address, State, Province, ZIP/Postal code, City\n \t\t\t \u2022 Usage Data""",
                titleColor: AppColors.black,
                titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            10.verticalSpace,
            Row(
              children: [
                TextWidget(
                  title: "Delete Your Personal Data",
              titleColor: AppColors.black,
                  titleMaxLines: 300,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            TextWidget(
              title: """You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.
Our Service may give You the ability to delete certain information about You from within the Service.
You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.
Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.
""",
           titleColor: AppColors.black,
              titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            10.verticalSpace,
            Row(
              children: [
                TextWidget(
                  title: "Security of Your Personal Data",
                 titleColor: AppColors.black,
                  titleMaxLines: 300,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            TextWidget(
              title: """The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.""",
               titleColor: AppColors.black,
              titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            10.verticalSpace,
            Row(
              children: [
                TextWidget(
                  title: "Children's Privacy",
                  titleColor: AppColors.black,
                  titleMaxLines: 300,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            TextWidget(
              title: """Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.
If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information.
""",
             titleColor: AppColors.black,
              titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            10.verticalSpace,
            Row(
              children: [
                TextWidget(
                  title: "Contact Us",
                titleColor: AppColors.black,
                  titleMaxLines: 300,
                  titleFontWeight: FontWeight.bold,
                  titleAlign: TextAlign.start,

                ),
              ],
            ),
            TextWidget(
              title: """If you have any questions about this Privacy Policy, You can contact us:
•	By email: taseara@sams.com
""",
             titleColor: AppColors.black,
              titleMaxLines: 300,
              titleSize: 15.sp,
              titleAlign: TextAlign.start,

            ),
            16.verticalSpace,
          ],
        )

      ),
    );
  }
}
