import 'package:dashboard_ecommerce_app/home/auth.dart';
import 'package:dashboard_ecommerce_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    url: 'https://lcaqddxggijwgnevhsol.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxjYXFkZHhnZ2lqd2duZXZoc29sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwMDgwNzgsImV4cCI6MjA0NjU4NDA3OH0.cMg74OvwHsRIQfrsYvDi8Ko0QjEEXyvvlaH49bJNOSQ',
  );
  runApp(MyApp(supabase: supabase));
}

class MyApp extends StatelessWidget {
  final Supabase supabase;
  const MyApp({super.key, required this.supabase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: supabase.client.auth.currentSession == null
          ? AuthPage(supabase: supabase)
          : HomePage(supabaseClient: supabase.client),
    );
  }
}
