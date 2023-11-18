import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas4_p5/main.dart';
import 'package:http/http.dart' as http;

class NewData extends StatefulWidget {
  const NewData({Key? key}) : super(key: key);
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController salary = TextEditingController();

  void addData() {
    var url =
        Uri.parse('http://localhost/latihan-api/backend-karyawan/list.php');
    http.post(url, body: {
      "name": name.text,
      "address": address.text,
      "salary": salary.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Data Karyawan",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: address,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Address',
                hintText: 'Enter Address',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: salary,
              keyboardType: TextInputType.number, // Keyboard untuk angka
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Salary',
                hintText: 'Enter Salary',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              child: const Text(
                "Add Employee",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.amber,
              onPressed: () {
                addData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Home(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
