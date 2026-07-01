import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleeptracker/data/dao/categoria_dao.dart';
import 'package:sleeptracker/data/database.dart';
import 'package:sleeptracker/bloc/categoria/categoria_event.dart';
import 'package:sleeptracker/bloc/categoria/categoria_state.dart';
import 'package:sleeptracker/data/dao/sono_dao.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final CategoriaDao _dao;
  final SonoDao _sonoDao;

  CategoriaBloc(this._dao, this._sonoDao) : super(CategoriaCarregando()) {
    on<CarregarCategorias>(_onCarregar);
    on<AdicionarCategoria>(_onAdicionar);
    on<AtualizarCategoria>(_onAtualizar);
    on<DeletarCategoria>(_onDeletar);
  }

  Future<void> _onCarregar(
    CarregarCategorias event,
    Emitter<CategoriaState> emit,
  ) async {
    emit(CategoriaCarregando());
    try {
      final categorias = await _dao.buscarTodas();
      emit(CategoriaCarregada(categorias));
    } catch (e) {
      emit(CategoriaErro('Erro ao carregar categorias'));
    }
  }

  Future<void> _onAdicionar(
    AdicionarCategoria event,
    Emitter<CategoriaState> emit,
  ) async {
    try {
      await _dao.inserir(
        CategoriaSonoCompanion.insert(nome: event.nome, icone: event.icone),
      );
      final categorias = await _dao.buscarTodas();
      emit(CategoriaCarregada(categorias));
    } catch (e) {
      emit(CategoriaErro('Erro ao adicionar categoria'));
    }
  }

  Future<void> _onAtualizar(
    AtualizarCategoria event,
    Emitter<CategoriaState> emit,
  ) async {
    try {
      final atualizada = event.categoria.copyWith(
        nome: event.novoNome,
        icone: event.novoIcone,
      );
      await _dao.atualizar(atualizada);
      final categorias = await _dao.buscarTodas();
      emit(CategoriaCarregada(categorias));
    } catch (e) {
      emit(CategoriaErro('Erro ao atualizar categoria'));
    }
  }

  Future<void> _onDeletar(
    DeletarCategoria event,
    Emitter<CategoriaState> emit,
  ) async {
    try {
      final emUso = await _sonoDao.existeRegistroComCategoria(event.id);
      if (emUso) {
        emit(
          CategoriaErro(
            'Não é possível excluir: existem registros de sono com esta categoria.',
          ),
        );
        // recarrega para sair do estado de erro depois
        final categorias = await _dao.buscarTodas();
        emit(CategoriaCarregada(categorias));
        return;
      }
      await _dao.deletar(event.id);
      final categorias = await _dao.buscarTodas();
      emit(CategoriaCarregada(categorias));
    } catch (e) {
      emit(CategoriaErro('Erro ao deletar categoria'));
    }
  }
}
