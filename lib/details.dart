import 'package:flutter/material.dart';
import 'package:tugas4_p5/editdata.dart';
import 'package:tugas4_p5/main.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final List list;
  final int index;

  Details({required this.list, required this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void delete() {
    var url = Uri.parse('http://localhost/latihan-api/backend-karyawan/list.php');
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Yakin ingin hapus data ?"),
      actions: [
        MaterialButton(
          child: Text("Ya, Hapus sekarang juga"),
          onPressed: () {
            delete();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Home(),
              ),
            );
          },
        ),
        MaterialButton(
          child: Text("NO.."),
          onPressed: () {},
        ),
      ],
    );
    showDialog(
      builder: (context) => alertDialog,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          '${widget.list[widget.index]['name']}',
          style: TextStyle(color: Colors.white),
        )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.list[widget.index]['name']}",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.list[widget.index]['address']}",
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.list[widget.index]['salary']}",
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Pusatkan elemen di dalam Row
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: MaterialButton(
                      child: const Text("Edit Data"),
                      color: Colors.amber,
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Edit(list: widget.list, index: widget.index),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: MaterialButton(
                      child: const Text("Delete"),
                      color: Colors.amber,
                      onPressed: () {
                        confirm();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
