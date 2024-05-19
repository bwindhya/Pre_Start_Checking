import 'package:flutter/material.dart';
import 'api_service.dart';
import 'home_screen.dart';
// import 'MyRadio.dart';

void main() => runApp(const prestart_check());

class prestart_check extends StatelessWidget {
  const prestart_check({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService().getModel().then((value) => print("value: $value"));
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
                centerTitle: true,
                flexibleSpace: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: Container(
                      decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Logo_DH.png'),
                        fit: BoxFit.fill),
                  )),
                ),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))))),
        extendBodyBehindAppBar: true,
        // AppBar(title: Image.asset('assets/images/Logo_DH.png', width: 260),
        //   titleSpacing: 5, elevation: 0,),
        body: const SafeArea(
          child: precheck(),
        ),
      ),
    );
  }
}
