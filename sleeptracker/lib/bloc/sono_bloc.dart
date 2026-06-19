import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/dao/sono_dao.dart';
import 'package:sleeptracker/data/database.dart';
import 'sono_event.dart';
import 'sono_state.dart';

class SonoBloc extends Bloc<SonoEvent, SonoState> {
  final SonoDao _dao;

  SonoBloc(this._dao) : super(SonoCarregando()) {
    on<CarregarRegistros>(_onCarregar);
    on<AdicionarRegistro>(_onAdicionar);
  }

  Future<void> _onCarregar(
    CarregarRegistros event,
    Emitter<SonoState> emit,
  ) async {
    emit(SonoCarregando());
    try {
      final registros = await _dao.buscarTodos();
      emit(SonoCarregado(registros));
    } catch (e) {
      emit(SonoErro('Erro ao carregar registros'));
    }
  }

  Future<void> _onAdicionar(
    AdicionarRegistro event,
    Emitter<SonoState> emit,
  ) async {
    try {
      await _dao.inserir(
        RegistroSonoCompanion.insert(
          data: event.data,
          horas: event.horas,
          minutos: event.minutos,
        ),
      );
      final registros = await _dao.buscarTodos();
      emit(SonoCarregado(registros));
    } catch (e) {
      emit(SonoErro('Erro ao adicionar registro'));
    }
  }
}
