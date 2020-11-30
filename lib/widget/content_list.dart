import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  ContentList({this.title, this.contentList, this.isOriginals=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
              height: isOriginals ? 500.0  : 220.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
                final content = contentList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  height: isOriginals ? 400.0 : 200.0,
                  width: isOriginals ? 200.0 : 130.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(content.imageUrl),
                      fit: BoxFit.cover
                    )
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
