import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeapi/binding/global_binding.dart';
import 'package:pokeapi/screen/home/home_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        minTextAdapt: true, designSize: const Size(320, 568));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
        fontFamily: GoogleFonts.comicNeue().fontFamily,
      ),
      home: const HomeScreen(),
    );
  }
}
