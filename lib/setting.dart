// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_link/output.dart';
import 'package:dio/dio.dart';

class Service {
  Future<dynamic> submitSubscription({required Map dataMap}) async {
    ///MultiPart request
    Dio _dio = Dio(BaseOptions(
        baseUrl:
            "http://ec2-13-127-21-38.ap-south-1.compute.amazonaws.com:8000"));
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController Gaugeno = TextEditingController();
  var url, data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("User Input")),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: ListView(children: [
                  Text("URl Link"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    maxLength: 100,
                    controller: Gaugeno,
                    decoration: InputDecoration(
                        hintText: "Enter URL Link",
                        border: OutlineInputBorder(),
                        suffixIcon: ElevatedButton(
                          child: Text("SUBMIT"),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print("validated");

                              Map dataMap2 = {
                                "Gaugeno": Gaugeno.text,
                              };
                              print(Gaugeno.text);

                              Service service = Service();

                              data = await service.submitSubscription(
                                  dataMap: dataMap2);
                            } else {
                              print("Not Validated");
                            }
                            var url = Gaugeno.text;

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Output(url: url)));
                          },
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter value';
                      }
                      return null;
                    },
                  ),
                ]))));
  }
}
