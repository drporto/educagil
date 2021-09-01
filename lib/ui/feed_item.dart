import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:educagil/models/classroommodel.dart';

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

    if (itemList.length > 0){
      for(FeedItem item in itemList){
        childrenWithPadding.add(SizedBox(height: 20));
        childrenWithPadding.add(item);
      }
    }else{
      childrenWithPadding.add(SizedBox(height: 20));
      childrenWithPadding.add(Text(
        "Sem discussões nesta turma",
        style: Theme.of(context).textTheme.subtitle1,
      ));
    }

    return Column(
        children: childrenWithPadding
    );
  }
}

class CommentList {
  CommentList({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<FeedItem> expandedValue;
  String headerValue;
  bool isExpanded;
}

class ExpansionPanelDemo extends StatefulWidget {
  final List<FeedItem> comments;
  ExpansionPanelDemo({Key? key, required this.comments}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState(comments);
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {

  static List<CommentList> startItems(List<FeedItem> comments){
    return [CommentList(
        expandedValue: comments,
        headerValue: "${comments.length} comentários:",
        isExpanded: false
    )];
  }

  List<CommentList> itemsToExpand = [];

  _ExpansionPanelDemoState(List<FeedItem> comments) : super(){
    this.itemsToExpand = startItems(comments);
    print("Started _ExpansionPanelDemoState with ${this.itemsToExpand[0].expandedValue.length}.");
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          itemsToExpand[index].isExpanded = !isExpanded;
        });
      },
      children: itemsToExpand.map<ExpansionPanel>((CommentList commentList){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(commentList.headerValue),
            );
          },
          body: Column(
              children: commentList.expandedValue
          ),
          isExpanded: commentList.isExpanded,
          canTapOnHeader: true,
        );
      }).toList(),
    );
  }
}


class FeedItem extends StatelessWidget {

  final DiscussaoTurma disc;
  final bool isComment;
  FeedItem({
    Key? key,
    required this.disc,
    this.isComment: false
  }) : super(key: key);

  Widget buildMainDisc(BuildContext context){
    List<FeedItem> comments = [];
    if (this.disc.comments.length > 0){
      for (DiscussaoTurma comment in disc.comments) {
        comments.add(FeedItem(disc: comment, isComment: true));
      }
    }

    List<Widget> elements = <Widget>[
      Text(
        this.disc.userName,
        style: Theme.of(context).textTheme.headline6,
      ),
      Text(
          "Postado em " + this.disc.date,
          style: Theme.of(context).textTheme.subtitle2
      ),
      SizedBox(height: 10),
      Text(
        this.disc.textContent,
        style: Theme.of(context).textTheme.bodyText1,
      )
    ];

    if (this.disc.link.length > 0){
      Icon linkIcon = Icon(Icons.link);
      if (this.disc.link.contains(".pdf")){
        linkIcon = Icon(Icons.picture_as_pdf);
      }else if (this.disc.link.contains("youtube.")){
        linkIcon = Icon(Icons.ondemand_video);
      }
      TextStyle? linkStyle = Theme
          .of(context)
          .textTheme
          .subtitle1;

      linkStyle = linkStyle?.apply(decoration: TextDecoration.underline,
          fontSizeFactor: 0.8);
      String content = this.disc.link;
      if (this.disc.linkName.length > 0){
        content = this.disc.linkName;
      }
      elements.add(SizedBox(height: 10));
      elements.add(ListTile(
          leading: linkIcon,
          title: GestureDetector(
              onTap: (){ FeedColumn.launchURLBrowser(this.disc.link); },
              child: Text(
                  content,
                  style: linkStyle
              )
          )
      ));
    }
    if (comments.length > 0){
      ExpansionPanelDemo expandingList = ExpansionPanelDemo(comments: comments);

      return Column(children:
        [
          Card(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0,6.0,20.0,20.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: elements
                )
            )
          ),
          expandingList
        ]
      );
    }else{
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
  }

  Widget buildComment(BuildContext context){
    List<Widget> elements = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.disc.userName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
              this.disc.date,
              style: Theme.of(context).textTheme.subtitle2
          )
        ]
      ),
      SizedBox(height: 6),
      Text(
        this.disc.textContent,
        style: Theme.of(context).textTheme.bodyText1,
      )
    ];

    return Card(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0,6.0,12.0,12.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: elements
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.isComment){
      return buildComment(context);
    }else {
      return buildMainDisc(context);
    }
  }
}

