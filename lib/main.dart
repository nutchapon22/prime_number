import 'package:flutter/material.dart';
import 'package:test/my_exam.dart';
import 'package:test/prime.dart';
import 'package:test/user_form.dart';
import 'package:test/widget/my_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MenuSelect(),
    );
  }
}

class MenuSelect extends StatelessWidget {
  const MenuSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              title: "เลขจำนวนเฉพาะ",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrimeNumber()),
                );
              },
              textColor: Colors.black,
              customColor: Colors.white,
            ),
            SizedBox(height: 10),
            MyButton(
              title: "แบบฟอร์มสมัครสมาชิก",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserForm()),
                );
              },
              textColor: Colors.black,
              customColor: Colors.white,
            ),
            SizedBox(height: 10),
            MyButton(
              title: "แบบทดสอบตั้งเอง",
              onClicked: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyExam()),
                );
              },
              textColor: Colors.black,
              customColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
