import 'package:flutter/material.dart';
import 'dart:collection';

class ClassroomModel extends ChangeNotifier {
  bool _logado = false;
  late Turma? _turmaSelecionada;
  List<Turma> _turmas = [];
  List<DiscussaoTurma> _discussoes = [];
  List<MaterialTurma> _materiais = [];
  List<ParticipanteTurma> _participantes = [];

  bool get logado => _logado;

  Turma? get turmaSelecionada => _turmaSelecionada;

  UnmodifiableListView<Turma> get turmas => UnmodifiableListView(_turmas);

  UnmodifiableListView<DiscussaoTurma> get discussoes =>
      UnmodifiableListView(_discussoes);

  UnmodifiableListView<MaterialTurma> get materiais =>
      UnmodifiableListView(_materiais);

  UnmodifiableListView<ParticipanteTurma> get participantes =>
      UnmodifiableListView(_participantes);

  void setLogged(bool newstate) {
    _logado = newstate;
    notifyListeners();
  }

  void deleteAll() {
    _logado = false;
    _turmas = [];
    _turmaSelecionada = null;
    _discussoes = [];
    _materiais = [];
    _participantes = [];
  }

  Future<void> getTurmasFromDatabase() async {
    _turmas.addAll(
      [
        Turma(id: 1, name: 'RH Ágil', finished: false),
        Turma(id: 2, name: 'Liderança Ágil', finished: true),
        Turma(id: 3, name: 'Scrum com Minecraft', finished: true),
      ],
    );
    notifyListeners();
  }

  Future<void> getTurmaInfoFromDatabaseById(int idTurma) async {
    _setTurmaId(idTurma);
    _getDiscussoesFromDatabase(idTurma);
    _getMateriaisFromDatabase(idTurma);
    _getParticipantesFromDatabase(idTurma);
    notifyListeners();
  }

  Future<bool> getTurmaInfoFromDatabaseByIndex(int index) async {
    if (_turmas.length == 0) return false;
    _setTurmaIndex(index);
    _getDiscussoesFromDatabase(_turmaSelecionada!.id);
    _getMateriaisFromDatabase(_turmaSelecionada!.id);
    _getParticipantesFromDatabase(_turmaSelecionada!.id);
    notifyListeners();
    return true;
  }

  void _setTurmaId(int idTurma) {
    _turmaSelecionada = _turmas.firstWhere((element) => element.id == idTurma);
  }

  void _setTurmaIndex(int index) {
    _turmaSelecionada = _turmas[index];
  }

  Future<void> _getDiscussoesFromDatabase(int idTurma) async {
    _discussoes.addAll(
      [
        DiscussaoTurma(),
        DiscussaoTurma(),
        DiscussaoTurma(),
      ],
    );
    notifyListeners();
  }

  Future<void> _getMateriaisFromDatabase(int idTurma) async {
    _materiais.addAll(
      [
        MaterialTurma(),
        MaterialTurma(),
        MaterialTurma(),
      ],
    );
    notifyListeners();
  }

  Future<void> _getParticipantesFromDatabase(int idTurma) async {
    _participantes.addAll(
      [
        ParticipanteTurma(),
        ParticipanteTurma(),
        ParticipanteTurma(),
      ],
    );
    notifyListeners();
  }
}

class Turma {
  final int id;
  final String name;
  final bool finished;

  Turma({
    required this.id,
    required this.name,
    required this.finished,
  });
}

class DiscussaoTurma {
  DiscussaoTurma();
}

class MaterialTurma {
  MaterialTurma();
}

class ParticipanteTurma {
  ParticipanteTurma();
}
