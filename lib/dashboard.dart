import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/Data.dart';

Future<Permiability> getData() async {
  var url = Uri.parse('https://udhyog4.co.in/permiability_test/1.php');
  var response = await http.get(url);
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  var responseData = json.decode(response.body);
  return Permiability.fromJSON(responseData[0]);
}

// ignore: non_constant_identifier_names
Stream<Permiability> get_Data() async* {
  while (true) {
    yield await getData();
    await Future.delayed(Duration(seconds: 1));
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          StreamBuilder(
              stream: get_Data(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      padding: EdgeInsets.all(5),
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.id,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.ID1,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.time,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gas,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.temp,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pmax,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pmin,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pavg,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gmax,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gmin,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gavg,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          StreamBuilder(
              stream: get_Data(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      padding: EdgeInsets.all(5),
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.id,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.ID1,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.time,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gas,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.temp,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pmax,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pmin,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.pavg,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gmax,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gmin,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                snapshot.data!.gavg,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
