import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_connection/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade400,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: age,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "age"),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .add({"name": name.text.trim(), "age": age.text.trim()});
                },
                child: const Text("add data in firebase"))
          ],
        ),
      ),
    );
  }
}

