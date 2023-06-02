
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_page_todo/models/subject_list_model.dart';
import 'package:single_page_todo/ui/home_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => (SubjectListModel())),

        // ChangeNotifierProvider(create: (_) => (SubListOperation())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.green,
        ),
        home: const HomeApp(),
      ),
    );
  }
}

