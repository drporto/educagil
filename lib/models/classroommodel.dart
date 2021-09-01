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
    print("Setting up $idTurma");
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
    if (idTurma == 1){
      _discussoes = DiscussaoTurma.getFeedItems();
    }else{
      _discussoes = [];
    }
    print("${_discussoes.length} adicionados na turma ${idTurma}");
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
  final String userName;
  final String textContent;
  final String date;
  final String link;
  final String linkName;
  final List<DiscussaoTurma> comments;

  const DiscussaoTurma({
    required this.userName,
    required this.textContent,
    required this.date,
    required this.link,
    required this.linkName,
    this.comments: const []
  }) : super();

  static List<DiscussaoTurma> getFeedItems(){
    return [
      DiscussaoTurma(userName: "Márcia Marques",
          textContent: "Boa tarde pessoal, só para lembrar que nosso encontro hoje"
              +" começa 30 minutos mais tarde, às 19:30. Até lá.",
          date: "21/06/21 às 12:57",
          link: "",
          linkName: ""
      ),
      DiscussaoTurma(userName: "Daniel Cabral",
          textContent: "Boa tarde. Achei um vídeo introdutório"
              +" interessante no youtube. Pode ajudar o"
              +" pessoal a se achar por lá. Link abaixo.",
          date: "21/06/21 às 12:57",
          link: "https://www.youtube.com/watch?v=cT_X4_n0NJ4",
          linkName: "Métodologia Ágil 2021"
      ),
      DiscussaoTurma(userName: "Pitágoras Alves",
          textContent: "Olá a todos. Eu me chamo Pitágoras, me inscrevi no treinamento apenas ontem."
              +" Gostaria de recuperar essas duas aulas que perdi."
              +" Alguém teria alguma recomendação?",
          date: "21/06/21 às 11:25",
          link: "",
          linkName: "",
          comments: [
            DiscussaoTurma(userName: "Márcia Marques",
                textContent: "Olá Pitágoras. É como Daniel falou agora a pouco,"
                    +" é possível acessar as aulas passadas, estão todas gravadas"
                    +" e disponíveis no youtube. Só acessar a aba Materiais.",
                date: "21/06/21 às 13:02",
                link: "",
                linkName: ""
            ),
            DiscussaoTurma(userName: "Daniel Torres",
                textContent: "Bem vindo Pitágoras. Não se preocupe com as aulas"
                    +" perdidas, a professora Márcia comentou que as aulas estão"
                    +" disponíveis aqui no nosso ambiente. Só acessar a aba de"
                    +" Materiais.",
                date: "21/06/21 às 12:07",
                link: "",
                linkName: ""
            ),
          ]
      ),
      DiscussaoTurma(userName: "Diego Porto",
          textContent: "Professora Márcia, as atividades da aula 02 são todas para serem "
              +" entregues um dia antes da próxima aula, correto?",
          date: "19/06/21 às 08:37",
          link: "",
          linkName: ""
      ),
      DiscussaoTurma(userName: "Daniel Torres",
          textContent: "Gostei bastante da leitura desse TCC sobre a implantação da cultura da agilidade.",
          date: "Postado em 18/06/21 às 15:03",
          link: "https://repositorio.ufsc.br/xmlui/bitstream/handle/123456789/130043/TCC%20Final.pdf",
          linkName: "IMPLANTAÇÃO DA METODOLOGIA ÁGIL SCRUM EM UM AMBIENTE DE DESENVOLVIMENTO"
      )
    ];
  }

}

class MaterialTurma {
  MaterialTurma();
}

class ParticipanteTurma {
  ParticipanteTurma();
}
