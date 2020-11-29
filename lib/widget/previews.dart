import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  Previews({this.title, this.contentList});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 165.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context , index){
              final Content content = contentList[index];
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 130.0,
                    width: 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: content.color , width: 4.0)
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 60.0,
                      child: Image.asset(content.titleImageUrl),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
