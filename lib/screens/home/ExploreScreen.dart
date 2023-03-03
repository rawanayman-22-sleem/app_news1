import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../controll/restapicontroll.dart';
import '../../view/componenet/NewCard.dart';
import '../../view/componenet/button.dart';
import '../../view/componenet/firstcard.dart';



class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  var x = "sports";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "General",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "general";
                        });  },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Health",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "health";
                        }); },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Health",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "health";
                        }); },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Entertainment",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "entertainment";
                        }); },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Science",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "science";
                        });  },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Business",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "business";
                        });  },
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FilterTopicCard(
                            text: "Technology",
                            textColor: white,
                            backgroundColor: mainColor,
                            borderColor: mainColor),
                      ),
                      onTap: () {
                        setState(() {
                          x = "technology";
                        });  },
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: RestApiController.fetchCategoryArticles("$x"),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (index == 0)
                          ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Fristcard(
                          ImageFrist: (snapshot
                              .data[index].urlToImage ==
                              null)
                              ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                              : snapshot.data[index].urlToImage,
                          TextFrist:
                          (snapshot.data[index].title == null)
                              ? "no have data"
                              : snapshot.data[index].title,
                          currentDate: (snapshot
                              .data[index].publishedAt ==
                              null)
                              ? "no data"
                              : snapshot.data[index].publishedAt,
                        ),
                      )
                          : NewsCard(
                        newsImage: (snapshot
                            .data[index].urlToImage ==
                            null)
                            ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                            : snapshot.data[index].urlToImage,
                        newsText:
                        (snapshot.data[index].title == null)
                            ? "no data"
                            : snapshot.data[index].title,
                        newsname:
                        (snapshot.data[index].name == null)
                            ? "no data"
                            : snapshot.data[index].name,
                        newsTime:
                        (snapshot.data[index].publishedAt ==
                            null)
                            ? "no data"
                            : snapshot.data[index].publishedAt,
                      );
                    },
                  )
                      : Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
