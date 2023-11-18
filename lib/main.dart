import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:tugas4_p5/details.dart';
import 'package:tugas4_p5/newdata.dart';

void main() => runApp(MaterialApp(
      title: "Api Test",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    var url = Uri.parse('http://localhost/latihan-api/backend-karyawan/list.php');
    final response = await http.post(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Apps",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => NewData(),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white, // Set icon color to white
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("error");
          }
          if (ss.hasData) {
            return Items(list: ss.data!);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        '${i + 1}.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Ruang antara kolom

                    // Kolom 1 (Name)
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Ruang antara kolom
                    // Kolom 2 (:)
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    SizedBox(width: 8), // Ruang antara kolom
                    // Kolom 3 (Data)
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${list[i]['name']}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8), // Ruang vertikal antar baris
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 30), // Ruan
                    // Kolom 1 (Address)
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(width: 8),
                    // Kolom 2 (:)
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Kolom 3 (Data)
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${list[i]['address']}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 30), // Ruan
                    // Kolom 1 (Salary)
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Salary',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // Kolom 2 (:)
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    SizedBox(width: 8),
                    // Kolom 3 (Data)
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${list[i]['salary']}',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Details(list: list, index: i),
                          ),
                        );
                      },
                      child: const Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Color.fromARGB(255, 27, 152, 254),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My App'),
//         ),
//         body: CardList(),
//       ),
//     );
//   }
// }

// class CardList extends StatefulWidget {
//   @override
//   _CardListState createState() => _CardListState();
// }

// class _CardListState extends State<CardList> {
//   late Future<List<User>> futureUsers;

//   @override
//   void initState() {
//     super.initState();
//     futureUsers = fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<User>>(
//       future: futureUsers,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<User> users = snapshot.data!;
//           return ListView.builder(
//             itemCount: users.length,
//             itemBuilder: (context, index) {
//               return CustomCard(
//                 name: users[index].name,
//                 address: users[index].address,
//                 salary: users[index].salary.toString(),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }

// class CustomCard extends StatelessWidget {
//   final String name;
//   final String address;
//   final String salary;

//   CustomCard({required this.name, required this.address, required this.salary});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(16.0),
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Name: $name',
//               style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8.0),
//             Text('Address: $address'),
//             SizedBox(height: 8.0),
//             Text('Salary: \$ $salary'),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Tambahkan aksi yang diinginkan ketika tombol detail diklik
//                 print('Detail button clicked for $name');
//               },
//               child: Text('Detail'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class User {
//   final String name;
//   final String address;
//   final dynamic salary;

//   User({required this.name, required this.address, required this.salary});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       address: json['address'],
//       salary: json['salary'],
//     );
//   }
// }

// Future<List<User>> fetchUsers() async {
//   final response = await http.get(Uri.parse('http://localhost/latihan-api/backend-karyawan/list.php')); // API LINK

//   if (response.statusCode == 200) {
//     List<dynamic> data = json.decode(response.body);
//     List<User> users = data.map((json) => User.fromJson(json)).toList();
//     return users;
//   } else {
//     throw Exception('Failed to load users');
//   }
// }
