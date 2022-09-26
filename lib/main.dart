import 'package:al_azan/layout/home.dart';
import 'package:al_azan/shared/Network/remote/dio_helper.dart';
import 'package:al_azan/shared/cubit/cubit.dart';
import 'package:al_azan/shared/cubit/states.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create:(context)=>AlAzanCubit()..getPayerTime(),
    child: BlocConsumer<AlAzanCubit,AlAzanStates>(
      listener:(context,state){},
      builder:(context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Al-Azan',
          theme: ThemeData(
          ),
          home:AnimatedSplashScreen(
          splash: Stack(
            children: const [
              Center(
                child: Image(
                  image: AssetImage('images/sp.png'),
                ),
              ),
            ],
          ),
            nextScreen: const Home(),
            splashTransition: SplashTransition.scaleTransition,
            duration: 3000,
            backgroundColor: Colors.white,
          )
        );
      },
    )
    );



  }
}