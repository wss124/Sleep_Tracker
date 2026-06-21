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
    on<AtualizarRegistro>(_onAtualizar);
    on<DeletarRegistro>(_onDeletar);
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

  Future<void> _onAtualizar(
    AtualizarRegistro event,
    Emitter<SonoState> emit,
  ) async {
    try {
      final atualizado = event.registro.copyWith(
        data: event.novaData,
        horas: event.novasHoras,
        minutos: event.novosMinutos,
      );
      await _dao.atualizar(atualizado);
      final registros = await _dao.buscarTodos();
      emit(SonoCarregado(registros));
    } catch (e) {
      emit(SonoErro('Erro ao atualizar registro'));
    }
  }

  Future<void> _onDeletar(
    DeletarRegistro event,
    Emitter<SonoState> emit,
  ) async {
    try {
      await _dao.deletar(event.id);
      final registros = await _dao.buscarTodos();
      emit(SonoCarregado(registros));
    } catch (e) {
      emit(SonoErro('Erro ao deletar registro'));
    }
  }
}
