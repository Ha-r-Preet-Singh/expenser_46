import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sir_expenso/database_provider/app_database.dart';
import 'package:sir_expenso/models/expense_model.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDataBase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitialState()) {

    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var check = await db.addNewNote(event.newExpense);
      if(check){
        var data = await db.getAllExpenses();
        emit(ExpenseLoadedState(arrExpenses: data));
      } else {
        emit(ExpenseErrorState(errorMsg: "Expense Not Added!!"));
      }
    });

    on<FetchAllExpenseEvent>((event, emit) async{
      emit(ExpenseLoadingState());
      var data = await db.getAllExpenses();
      emit(ExpenseLoadedState(arrExpenses: data));
    });
  }
}
