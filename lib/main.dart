import 'package:flutter/material.dart';
import 'patient_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget menuButton(BuildContext context, String title, Widget screen) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        child: Text(title, style: TextStyle(fontSize: 22)),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
          setState(() {});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ホーム")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              PatientData.name == "" ? "患者未登録" : "患者名：${PatientData.name}",
              style: TextStyle(fontSize: 22),
            ),

            SizedBox(height: 20),

            menuButton(context, "患者情報", PatientScreen()),
            SizedBox(height: 10),
            menuButton(context, "日々の記録", RecordScreen()),
            SizedBox(height: 10),
            menuButton(context, "週レポート", WeeklyReportScreen()),
          ],
        ),
      ),
    );
  }
}

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final memoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = PatientData.name;
    ageController.text = PatientData.age == 0 ? "" : PatientData.age.toString();
    memoController.text = PatientData.memo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("患者情報")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "名前"),
            ),

            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "年齢"),
              keyboardType: TextInputType.number,
            ),

            TextField(
              controller: memoController,
              decoration: InputDecoration(labelText: "メモ"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("保存"),
              onPressed: () {
                PatientData.name = nameController.text;
                PatientData.age = int.tryParse(ageController.text) ?? 0;
                PatientData.memo = memoController.text;

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("日々の記録")),
      body: Center(child: Text("記録画面")),
    );
  }
}

class WeeklyReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("週レポート")),
      body: Center(child: Text("週レポート画面")),
    );
  }
}
