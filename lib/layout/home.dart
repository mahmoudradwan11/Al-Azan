import 'package:al_azan/shared/cubit/cubit.dart';
import 'package:al_azan/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlAzanCubit, AlAzanStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.of(context).size;
        var cubit = AlAzanCubit.get(context);
        return Scaffold(
          //backgroundColor: Colors.purple,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height * 0.40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff955cd1),
                            Color(0xff3fa2fa),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 115),
                      child: Container(
                        //height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff955cd1).withOpacity(0.5),
                              const Color(0xff3fa2fa).withOpacity(0.5),
                            ],
                          ),
                        ),
                        child: DropdownButton(
                            icon: const Icon(Icons.arrow_downward,
                                color: Colors.white),
                            underline: Container(
                              height: 0,
                              color: Colors.deepPurpleAccent,
                            ),
                            items: cubit.cities
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              cubit.changeAddress(value);
                            },
                            value: cubit.add),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              '${cubit.weekEn} ${cubit.day} ${cubit.monthEn} ${cubit.year}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            const SizedBox(
                              width: 100,
                            ),
                            Text(
                              '${cubit.readable}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                buildItemList(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildItemList(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/fajr.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Fajr',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).fajr}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/sunrise.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Sunrise',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).serok}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/dhuhr.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Duhur',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).duhur}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/asr.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Asr',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).asr}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/maghribb.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Maghirabb',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).magrab}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage('images/isha.png'),
                  width: 25.0,
                  height: 25.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Isha',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${AlAzanCubit.get(context).isah}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
