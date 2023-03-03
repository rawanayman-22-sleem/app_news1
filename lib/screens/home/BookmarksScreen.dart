import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../controll/restapicontroll.dart';
import '../../view/componenet/NewCard.dart';
import '../../view/componenet/firstcard.dart';


class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Bookmarks",
          style: TextStyle(
              color: black, fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: RestApiController.fetchArticles(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return (snapshot.hasData)
              ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return (index == 0)
                  ? Fristcard(
                ImageFrist: '${snapshot.data[index].urlToImage}',
                TextFrist: '${snapshot.data[index].title}',
                currentDate: "${snapshot.data[index].publishedAt}",
              )
                  : NewsCard(
                newsImage: (snapshot.data[index].urlToImage == null)
                    ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                    : snapshot.data[index].urlToImage,
                newsText: (snapshot.data[index].title == null)
                    ? "no data"
                    : snapshot.data[index].title,
                newsname: (snapshot.data[index].name == null)
                    ? "no data"
                    : snapshot.data[index].name,
                newsTime: (snapshot.data[index].publishedAt == null)
                    ? "no data"
                    : snapshot.data[index].publishedAt,
              );
            },
          )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}