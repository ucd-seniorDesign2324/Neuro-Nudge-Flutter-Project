// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:nn/main.dart';
import 'package:nn/data/python_api.dart';
import 'package:nn/controller/meeting.dart';
// import 'package:nn/presentation/home_page.dart';

import 'package:http/http.dart';
import 'package:http/testing.dart'; 


void main() async {

  Supabase.initialize(
    url: 'https://fgocfoakntmlhgtftrzh.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnb2Nmb2FrbnRtbGhndGZ0cnpoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE2ODkyMTUsImV4cCI6MjAyNzI2NTIxNX0.s5dAWy-DSa1EBfKjhpGOOcax6S7QUsh7xCHPFgKlBn8',
  );

  final supabase = Supabase.instance.client;

  // Sign in with Supabase credentials
  final AuthResponse res = await supabase.auth.signInWithPassword(
    email: 'neuro.nudger@gmail.com',
    password: 'Vatican1-Cameos3',
  );
  final Session? session = res.session; // Session after sign-in
  final User? user = res.user; // User information
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
