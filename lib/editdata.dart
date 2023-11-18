import 'package:flutter/material.dart';
import 'package:tugas4_p5/main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;

  Edit({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController salary;

  void editData() {
    var url = Uri.parse('http://localhost/latihan-api/backend-karyawan/list.php');
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'name': name.text,
      'address': address.text,
      'salary': salary.text,
    });
  }

  @override
  void initState() {
    name = TextEditingController(text: widget.list[widget.index]['name']);
    address = TextEditingController(text: widget.list[widget.index]['address']);
    salary = TextEditingController(text: widget.list[widget.index]['salary']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Data ${widget.list[widget.index]['name']}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
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
              maxLines: 5,
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
              keyboardType: TextInputType.number,
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
              child: const Text("Edit Data"),
              color: Colors.amber,
              onPressed: () {
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
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
