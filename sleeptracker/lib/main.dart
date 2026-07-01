import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_bloc.dart';
import 'package:sleeptracker/bloc/categoria/categoria_event.dart';
import 'package:sleeptracker/bloc/sono/sono_bloc.dart';
import 'package:sleeptracker/bloc/sono/sono_event.dart';
import 'package:sleeptracker/data/dao/categoria_dao.dart';
import 'package:sleeptracker/data/dao/sono_dao.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/ui/widgets/navegation_page.dart';

final appDatabase = AppDatabase();

void main() {
  runApp(const MyLayout());
}

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final sonoDao = SonoDao(appDatabase);
    final categoriaDao = CategoriaDao(appDatabase);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SonoBloc(sonoDao)..add(CarregarRegistros()),
        ),
        BlocProvider(
          create:
              (_) =>
                  CategoriaBloc(categoriaDao, sonoDao)
                    ..add(CarregarCategorias()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
