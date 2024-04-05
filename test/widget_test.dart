// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:nn/main.dart';
import 'package:nn/data/python_api.dart';
import 'package:nn/controller/meeting.dart';
// import 'package:nn/presentation/home_page.dart';

import 'package:http/http.dart';
import 'package:http/testing.dart'; 


void main() {
  group('fetchEvents', (){
    test('Returns a list of JSON event objects.',
      () async{

        final mockHttpClient = MockClient((request) async {

          final response = {

            "event":[
              {
                "title": "Lab 1",
                "startTime": "20240301T030000Z",
                "endTime": "20240328T012528Z",
                "location": "",
                "description": ""
              },
              {
                "title": "Lab 2",
                "startTime": "20240308T030000Z",
                "endTime": "20240328T012528Z",
                "location": "",
                "description": ""
              },
              {
                "title": "Lab 3",
                "startTime": "20240315T020000Z",
                "endTime": "20240315T023000Z",
                "location": "",
                "description": ""
              }
            ]
          };
          return Response(jsonEncode(response), 200, headers: {'content-type': 'application/json'});
        });

        expect(await fetchEvents(mockHttpClient), isA<List<Meeting>>());

    });

    test('Returns a single JSON event object',
      () async {
        final mockHttpClient = MockClient((request) async {

          final response = {

            "event":[
              {
                "title": "Lab 3",
                "startTime": "20240315T020000Z",
                "endTime": "20240315T023000Z",
                "location": "",
                "description": ""
              }
            ]
          };
          return Response(jsonEncode(response), 200, headers: {'content-type': 'application/json'});
        });

        expect(await fetchEvents(mockHttpClient), isA<List<Meeting>>());
      });
  });
}
