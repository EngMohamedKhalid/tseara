import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tseara/features/home_feature/presentation/PLH/home_cubit.dart';
import 'package:tseara/features/home_feature/presentation/screens/home_screen.dart';
import 'package:tseara/features/profile_feature/presentation/PLH/profile_cubit.dart';
import 'app/themes/get_theme.dart';
import 'app/utils/bloc_observer.dart';
import 'app/utils/consts.dart';
import 'app/utils/dio_helper.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';
import 'app/utils/navigation_helper.dart';
import 'app/widgets/carousel_widget/carousel_cubit/carousel_cubit.dart';
import 'features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'features/intro_feature/presentation/screens/splash_screen.dart';


Position ? myPosition;
String ? myLocationName;
String ? myLocationCity;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await init();
  // Placemark placemark = await _getLocation();
  // myLocationName = placemark.street!;
  // myLocationCity = placemark.locality!;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CarouselCubit>(
          create: (BuildContext context) => CarouselCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit()..getPorts(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        ),


      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        english_local,
        arabic_local,
      ],
      saveLocale: true,
      startLocale: english_local,
      path: assets_path_localisations,
      fallbackLocale: english_local,
      //
      //* OverlaySupport
      //
      child: OverlaySupport.global(
        //
        //* ScreenUtilInit
        //
        child: ScreenUtilInit(
          designSize: const Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          //
          //* MaterialApp
          //
          builder: (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            // locale: CookieManagerService.getLocale,
            locale: context.locale,
            title: 'Book Store',
            theme: bookStoreTheme(),
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavHelper>().navigatorKey,
            //
            //* EasyLoading
            //
            builder: EasyLoading.init(
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
            ),
            home:const HomeScreen(),
          ),
        ),
      ),
    );
  }
}

Future<Placemark> _getLocation() async {
  List<Placemark> ? placemark;
  await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  ).then((value) async{
    myPosition = value;
    print(value);
    placemark = await placemarkFromCoordinates(
      value.latitude,
      value.longitude,
    );
    print(placemark?.first.name);
    print(placemark?.first.locality);
    print(placemark?.first.street);
  });
  return placemark!.first;
}

//29.979562,31.255448

//30.037845,31.221526