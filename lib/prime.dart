import 'package:flutter/material.dart';

class PrimeNumber extends StatefulWidget {
  const PrimeNumber({super.key});

  final String title = "เลขจำนวนเฉพาะหมอไร่";
  @override
  State<PrimeNumber> createState() => _PrimeNumberState();
}

class _PrimeNumberState extends State<PrimeNumber> {
  late TextEditingController _inputController = TextEditingController();
  String primeAnswer = "";

  void _checkPrime(int number) {
    if (number < 2) {
      setState(() {
        primeAnswer = "$number ไม่เป็นจำนวนเฉพาะ";
      });
    } else {
      bool isPrime = true;
      for (int i = 2; i <= number ~/ 2; i++) {
        if (number % i == 0) {
          isPrime = false;
          break;
        }
      }
      setState(() {
        primeAnswer =
            isPrime ? "$number เป็นจำนวนเฉพาะ" : "$number ไม่เป็นจำนวนเฉพาะ";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ใส่ตัวเลขที่ต้องการตรวจสอบ',
                border: OutlineInputBorder(),
                hintText: 'ใส่ตัวเลขที่ต้องการตรวจสอบ',
              ),
              onChanged: (value) {
                setState(() {
                  primeAnswer = "";
                });
              },
              onSubmitted: (value) {
                int? number = int.tryParse(value);
                if (number != null) {
                  _checkPrime(number);
                } else if (value.contains(RegExp(r'[a-zA-Z]'))) {
                  setState(() {
                    primeAnswer = "กรุณาใส่ตัวเลขเท่านั้น!!!";
                  });
                } else {
                  setState(() {
                    primeAnswer = "อย่าว่าง!!!";
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            Text(
              primeAnswer,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? number = int.tryParse(_inputController.text);
                if (number != null) {
                  _checkPrime(number);
                } else if (_inputController.text.contains(
                  RegExp(r'[a-zA-Z]'),
                )) {
                  setState(() {
                    primeAnswer = "กรุณาใส่ตัวเลขเท่านั้น!!!";
                  });
                } else {
                  setState(() {
                    primeAnswer = "อย่าว่าง!!!";
                  });
                }
              },
              child: const Text(
                'เช็ค',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
