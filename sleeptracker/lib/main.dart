import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono_event.dart';
import 'package:sleeptracker/dao/sono_dao.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/ui/widgets/navegation_page.dart';

// ✅ ADICIONAR: banco como singleton fora da classe
final appDatabase = AppDatabase();

void main() {
  runApp(const MyLayout());
}

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final sonoDao = SonoDao(appDatabase);

    return BlocProvider(
      create: (_) => SonoBloc(sonoDao)..add(CarregarRegistros()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
