class AlazanModel
{
   int? code;
   String? status;
   Timings? data;
   AlazanModel.fromJson(Map<String, dynamic> json) {
     code = json['code'];
     status = json['status'];
     data = Timings.fromJson(json['data']);

   }
}
class Timings{
  TimerModel? timings;
  DateFormat? date;
  Timings.fromJson(Map<String, dynamic> json) {
    timings = TimerModel.fromJson(json['timings']);
    date = DateFormat.fromJson(json['date']);
  }
}
class TimerModel
{
   String? fajr;
   String? sunrise;
   String? dhuhr;
   String? asr;
   String? sunset;
   String? maghrib;
   String? isha;
   String? imsak;
   String? midNight;
   String? firstThird;
   String? lastThird;

   TimerModel.fromJson(Map<String, dynamic> json) {
     fajr = json['Fajr'];
     sunrise = json['Sunrise'];
     dhuhr = json['Dhuhr'];
     asr = json['Asr'];
     sunset = json['Sunset'];
     maghrib = json['Maghrib'];
     isha = json['Isha'];
     imsak = json['Imsak'];
     midNight = json['Midnight'];
     firstThird = json['Firstthird'];
     lastThird = json['Lastthird'];
   }
}

class DateFormat{
   String? readable;
   String? timeStamp;
   Hijri? hijri;
   DateFormat.fromJson(Map<String,dynamic>json)
   {
       readable = json['readable'];
       timeStamp = json['timestamp'];
       hijri = Hijri.fromJson(json['hijri']);
   }
}
class Hijri
{
    String? date;
    String? day;
    Weekday? weekday;
    Month? month;
    String? year;
    Hijri.fromJson(Map<String,dynamic>json)
    {
        date = json['date'];
        day = json['day'];
        weekday = Weekday.fromJson(json['weekday']);
        month = Month.fromJson(json['month']);
        year = json['year'];
    }
}
class Weekday
{
    String? en;
    String? ar;
    Weekday.fromJson(Map<String,dynamic>json){
      en = json['en'];
      ar = json['ar'];
    }
}
class Month
{
    int? number;
    String? en;
    String? ar;
    Month.fromJson(Map<String,dynamic>json){
      number = json['number'];
      en = json['en'];
      ar = json['ar'];
    }
}