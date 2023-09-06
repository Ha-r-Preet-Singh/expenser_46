
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sir_expenso/database_provider/app_database.dart';
import 'package:sir_expenso/expense_bloc/expense_bloc.dart';
import 'package:sir_expenso/screens/home/home_page.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => ExpenseBloc(db: AppDataBase()),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    ),
  ));
}
