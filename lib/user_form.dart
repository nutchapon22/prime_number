import 'package:flutter/material.dart';
import 'package:test/widget/my_button.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  final String title = "แบบฟอร์มสมัครสมาชิก";
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  void submitForm() {
    String name = nameController.text;
    String email = emailController.text;
    String telephone = telephoneController.text;

    if (name.isEmpty || email.isEmpty || telephone.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบ')));
    } else if (telephone.length < 10 ||
        !RegExp(r'^[0-9]+$').hasMatch(telephone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง')),
      );
    } else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('กรุณากรอกอีเมลให้ถูกต้อง')));
    } else {
      print('ชื่อ: $name, อีเมล: $email, เบอร์โทรศัพท์: $telephone');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('สมัครสมาชิกสำเร็จ')));
      nameController.clear();
      emailController.clear();
      telephoneController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'ชื่อ',
                hintText: 'กรอกชื่อของคุณ',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'อีเมล',
                hintText: 'กรอกอีเมลของคุณ',
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: telephoneController,
              decoration: const InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
                hintText: 'กรอกเบอร์โทรศัพท์ของคุณ',
              ),
            ),
            SizedBox(height: 40),
            MyButton(
              title: "สมัครสมาชิก",
              customColor: Colors.blue,
              textColor: Colors.white,
              onClicked: () {
                submitForm();
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
