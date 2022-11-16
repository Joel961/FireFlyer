import 'package:flutter/material.dart';
import 'package:FireFlyer/models/models.dart';

class ArticleCarousel extends StatelessWidget {
  final String title;
  final List<Content> articleList;

  const ArticleCarousel({
    required Key key,
    required this.title,
    required this.articleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: articleList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = articleList[index];
                return GestureDetector(
                    onTap: () => print(content.title),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 200.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 180.0,
                            child: RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                                text: content.title,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
