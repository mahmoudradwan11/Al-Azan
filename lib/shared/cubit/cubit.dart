import 'package:al_azan/models/AlAzan_model/home_model.dart';
import 'package:al_azan/shared/Network/remote/dio_helper.dart';
import 'package:al_azan/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlAzanCubit extends Cubit<AlAzanStates> {
  AlAzanCubit() : super(AlahadnInitialState());
  static AlAzanCubit get(context) => BlocProvider.of(context);
  AlazanModel? alazanModel;
  String? fajr;
  String? duhur;
  String? asr;
  String? magrab;
  String? isah;
  String? serok;

  List<String> cities = [
    'cairo',
    'giza',
    'Alexandria',
    'asyut',
    'fayoum',
    'beni suef',
    'aswan',
    'luxer',
    'hurgada',
  ];
  String add = 'cairo';
  String? readable;
  String? day;
  String?weekEn;
  String?monthEn;
  String?year;
  void changeAddress(address)
  {
      add = address;
      emit(ChangeCityState());
      getPayerTime();
  }
  void getPayerTime() {
    emit(AladanPrayerTimeLoadingState());
    DioHelper.getData(
      url:
          '/timingsByAddress/${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()}',
      query: {"address": "$add,EGY", "method": "8"},
    ).then((value) {
      alazanModel = AlazanModel.fromJson(value.data);
      readable =  alazanModel!.data!.date!.readable;
      day = alazanModel!.data!.date!.hijri!.day;
      weekEn = alazanModel!.data!.date!.hijri!.weekday!.en;
      monthEn = alazanModel!.data!.date!.hijri!.month!.en;
      year = alazanModel!.data!.date!.hijri!.year;
      fajr = alazanModel!.data!.timings!.fajr!;
      duhur = alazanModel!.data!.timings!.dhuhr!;
      asr = alazanModel!.data!.timings!.asr!;
      magrab = alazanModel!.data!.timings!.maghrib!;
      isah = alazanModel!.data!.timings!.isha!;
      serok = alazanModel!.data!.timings!.sunrise!;
      print(alazanModel!.data!.timings!.fajr!);
      emit(AladanPrayerTimeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AladanPrayerTimeErrorState());
    });
  }
}
