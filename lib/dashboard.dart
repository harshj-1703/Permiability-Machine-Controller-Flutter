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
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(7, 4, 7, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            // child:
                            // Image.asset(
                            //   'assets/images/logo1.png',
                            //   height: 50,
                            // ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        alignment: Alignment.center,
                                        // height: 25,
                                        color: Colors.amber,
                                        // width: 250,
                                        child: Text(
                                          'ABC INDUSTRIES',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        alignment: Alignment.center,
                                        // height: 25,
                                        color: Colors.green,
                                        // width: 250,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Permiability Machine Data',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            // Text(
                                            //   'Pattern Processing',
                                            //   style: TextStyle(
                                            //       color: Colors.white,
                                            //       fontWeight: FontWeight.bold,
                                            //       fontSize: 12),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.transparent,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
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
                              // Text(
                              //   snapshot.data!.id,
                              //   style: TextStyle(
                              //       fontSize: 18, color: Colors.amber),
                              // ),
                              // Text(
                              //   snapshot.data!.ID1,
                              //   style: TextStyle(
                              //       fontSize: 18, color: Colors.amber),
                              // ),
                              // Text(
                              //   snapshot.data!.time,
                              //   style: TextStyle(
                              //       fontSize: 18, color: Colors.amber),
                              // ),
                              Text(
                                "GAS : ${snapshot.data!.gas}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "TEMP : ${snapshot.data!.temp}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "TEST : ${snapshot.data!.test}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "PMAX : ${snapshot.data!.pmax}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "PMIN : ${snapshot.data!.pmin}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "PAVG : ${snapshot.data!.pavg}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "GMAX : ${snapshot.data!.gmax}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "GMIN : ${snapshot.data!.gmin}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ),
                              Text(
                                "GAVG : ${snapshot.data!.gavg}",
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
