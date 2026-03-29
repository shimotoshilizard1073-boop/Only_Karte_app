import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String gender = "男性";
  String careLevel = "要介護1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("患者情報入力")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            /// 名前
            const Text("名前"),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),

            /// 年齢
            const Text("年齢"),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),

            /// 性別
            const Text("性別"),
            DropdownButton<String>(
              value: gender,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "男性", child: Text("男性")),
                DropdownMenuItem(value: "女性", child: Text("女性")),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            /// 要介護度
            const Text("要介護度"),
            DropdownButton<String>(
              value: careLevel,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "要支援1", child: Text("要支援1")),
                DropdownMenuItem(value: "要支援2", child: Text("要支援2")),
                DropdownMenuItem(value: "要介護1", child: Text("要介護1")),
                DropdownMenuItem(value: "要介護2", child: Text("要介護2")),
                DropdownMenuItem(value: "要介護3", child: Text("要介護3")),
                DropdownMenuItem(value: "要介護4", child: Text("要介護4")),
                DropdownMenuItem(value: "要介護5", child: Text("要介護5")),
              ],
              onChanged: (value) {
                setState(() {
                  careLevel = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("保存"),
            ),
          ],
        ),
      ),
    );
  }
}
