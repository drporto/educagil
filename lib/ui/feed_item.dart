import 'package:flutter/material.dart';

class FeedColumn extends StatelessWidget {
  final List<FeedItem> itemList;
  final String feedName;

  const FeedColumn({
    Key? key,
    required this.feedName,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenWithPadding = new List.empty(growable: true);
    childrenWithPadding.add(Text(
      this.feedName,
      style: Theme.of(context).textTheme.headline4,
    ));
    for(FeedItem item in itemList){
      childrenWithPadding.add(SizedBox(height: 20));
      childrenWithPadding.add(item);
    }
    return Column(
        children: childrenWithPadding
    );
  }
}

class FeedItem extends StatelessWidget {
  final String userName;
  final String textContent;
  final String date;
  final String link;

  const FeedItem({
    Key? key,
    required this.userName,
    required this.textContent,
    required this.date,
    required this.link
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> elements = <Widget>[
      Text(
        this.userName,
        style: Theme.of(context).textTheme.headline6,
      ),
      Text(
          "Postado em " + this.date,
          style: Theme.of(context).textTheme.subtitle2
      ),
      SizedBox(height: 10),
      Text(
          this.textContent,
          style: Theme.of(context).textTheme.bodyText1,
      )
    ];

    if (this.link.length > 0){
      String link_type = "no_type";
      if (this.link.contains(".pdf")){
        link_type = "pdf";
      }else if (this.link.contains("youtube.")){
        link_type = "youtube";
      }
      /*TextStyle? link_style = Theme
          .of(context)
          .accentTextTheme
          .subtitle1;

      link_style?.apply(decoration: TextDecoration.underline);*/

      elements.add(SizedBox(height: 10));
      elements.add(Text(
          this.link,
          style: Theme
              .of(context).textTheme.subtitle1
      ));
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,6.0,20.0,20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: elements
        )
      )
    );
  }

  static List<FeedItem> getFeedItems(){
    return [
      FeedItem(userName: "Márcia Marques",
          textContent: "Boa tarde pessoal, só para lembrar que nosso encontro hoje"
              +" começa 30 minutos mais tarde, às 19:30. Até lá.",
          date: "21/06/21 às 12:57",
          link: ""),
      FeedItem(userName: "Daniel Cabral",
          textContent: "Boa tarde. Achei um vídeo introdutório"
              +" interessante no youtube. Pode ajudar o"
              +" pessoal a se achar por lá. Link abaixo.",
          date: "21/06/21 às 12:57",
          link: "https://repositorio.ufsc.br/xmlui/bitstream/handle/123456789/130043/TCC%20Final.pdf"),
      FeedItem(userName: "Pitágoras Alves",
          textContent: "Olá a todos. Eu me chamo Pitágoras, me inscrevi no treinamento apenas ontem."
              +" Gostaria de recuperar essas duas aulas que perdi."
              +" Alguém teria alguma recomendação?",
          date: "21/06/21 às 11:25",
          link: ""),
      FeedItem(userName: "Diego Porto",
          textContent: "Professora Márcia, as atividades da aula 02 são todas para serem "
              +" entregues um dia antes da próxima aula, correto?",
          date: "19/06/21 às 08:37",
          link: ""),
      FeedItem(userName: "Daniel Torres",
          textContent: "Gostei bastante da leitura desse TCC sobre a implantação da cultura da agilidade.",
          date: "Postado em 18/06/21 às 15:03",
          link: "https://repositorio.ufsc.br/xmlui/bitstream/handle/123456789/130043/TCC%20Final.pdf"
      )
    ];
  }
}

