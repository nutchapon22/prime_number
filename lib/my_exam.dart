import 'package:flutter/material.dart';
import 'package:test/dio_client.dart';
import 'package:test/model/users_model.dart';

class MyExam extends StatefulWidget {
  const MyExam({super.key});

  final String title = "แบบทดสอบตั้งเอง";

  @override
  State<MyExam> createState() => _MyExamState();
}

class _MyExamState extends State<MyExam> {
  List<UsersModel> users = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      final result = await fetchUsers();
      setState(() {
        users = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<List<UsersModel>> fetchUsers() async {
    final response = await DioClient().get('/users');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => UsersModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage != null
              ? Center(child: Text('Error: $errorMessage'))
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(
                      user.name ?? 'error',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      user.email ?? 'error',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    trailing: Text(
                      user.phone ?? 'error',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  );
                },
              ),
    );
  }
}
