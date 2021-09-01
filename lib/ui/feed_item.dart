import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedColumn extends StatelessWidget {
   static void launchURLBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(url);
    }
  }

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
  final String linkName;

  const FeedItem({
    Key? key,
    required this.userName,
    required this.textContent,
    required this.date,
    required this.link,
    required this.linkName
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
      Icon linkIcon = Icon(Icons.link);
      if (this.link.contains(".pdf")){
        linkIcon = Icon(Icons.picture_as_pdf);
      }else if (this.link.contains("youtube.")){
        linkIcon = Icon(Icons.ondemand_video);
      }
      TextStyle? linkStyle = Theme
          .of(context)
          .textTheme
          .subtitle1;

      linkStyle = linkStyle?.apply(decoration: TextDecoration.underline,
        fontSizeFactor: 0.8);
      String content = this.link;
      if (this.linkName.length > 0){
        content = this.linkName;
      }
      elements.add(SizedBox(height: 10));
      elements.add(ListTile(
          leading: linkIcon,
          title: GestureDetector(
            onTap: (){ FeedColumn.launchURLBrowser(this.link); },
            child: Text(
              content,
              style: linkStyle
            )
          )
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
          link: "",
          linkName: ""
      ),
      FeedItem(userName: "Daniel Cabral",
          textContent: "Boa tarde. Achei um vídeo introdutório"
              +" interessante no youtube. Pode ajudar o"
              +" pessoal a se achar por lá. Link abaixo.",
          date: "21/06/21 às 12:57",
          link: "https://www.youtube.com/watch?v=cT_X4_n0NJ4",
          linkName: "Métodologia Ágil 2021"
      ),
      FeedItem(userName: "Pitágoras Alves",
          textContent: "Olá a todos. Eu me chamo Pitágoras, me inscrevi no treinamento apenas ontem."
              +" Gostaria de recuperar essas duas aulas que perdi."
              +" Alguém teria alguma recomendação?",
          date: "21/06/21 às 11:25",
          link: "",
          linkName: ""
      ),
      FeedItem(userName: "Diego Porto",
          textContent: "Professora Márcia, as atividades da aula 02 são todas para serem "
              +" entregues um dia antes da próxima aula, correto?",
          date: "19/06/21 às 08:37",
          link: "",
          linkName: ""
      ),
      FeedItem(userName: "Daniel Torres",
          textContent: "Gostei bastante da leitura desse TCC sobre a implantação da cultura da agilidade.",
          date: "Postado em 18/06/21 às 15:03",
          link: "https://repositorio.ufsc.br/xmlui/bitstream/handle/123456789/130043/TCC%20Final.pdf",
          linkName: "IMPLANTAÇÃO DA METODOLOGIA ÁGIL SCRUM EM UM AMBIENTE DE DESENVOLVIMENTO"
      )
    ];
  }
}

