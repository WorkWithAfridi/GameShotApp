import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gameshot/provider/album/album.dart';
import 'package:gameshot/provider/game/game.dart';
import 'package:gameshot/provider/image/image.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  static const routeName = '/homepage';
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController _postAlbumImageController = new PageController();
  double albumPageOffset = 0;
  PageController _postPageController = new PageController();
  int _pageIndex = 0;

  List<Album> posts = [
    Album(
        Game("Horizon Zero Dawn", "R", "PlayStation", "Lorem",
            "lib/assets/offlineDatabase/hzdCoverImg.png"),
        "City of the Ancient One",
        [
          Img("Camp of the Ice Breaker", "lib/assets/offlineDatabase/hzd4.png"),
          Img("Devils den", "lib/assets/offlineDatabase/hzd2.png"),
          Img("Forgotten wars", "lib/assets/offlineDatabase/hzd1.png"),
          Img("Forgotten wars", "lib/assets/offlineDatabase/hzd3.png"),
        ],
        "Kyoto",
        "1"),
    Album(
        Game("Horizon Zero Dawn", "R", "PlayStation", "Lorem",
            "lib/assets/offlineDatabase/hzdCoverImg.png"),
        "City of the Ancient One",
        [
          Img("Ancient Ones", "lib/assets/offlineDatabase/hzd4.png"),
          Img("Ancient Ones", "lib/assets/offlineDatabase/hzd2.png"),
          Img("Ancient Ones", "lib/assets/offlineDatabase/hzd1.png"),
        ],
        "Kyoto",
        "1")
  ];

  @override
  void initState() {
    // TODO: implement initState
    _postAlbumImageController = PageController(viewportFraction: 0.7);
    _postAlbumImageController.addListener(() {
      setState(() {
        albumPageOffset = _postAlbumImageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Stack(
          children: [
            getPage(),
            customAppBar(),
          ],
        ),
      ),
    );
  }

  Container customAppBar() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            width: double.maxFinite,
            // color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      FontAwesomeIcons.bars,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          );
  }

  PageView getPage() {

    return PageView.builder(
            controller: _postPageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            scrollDirection: Axis.vertical,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              _postPageController=PageController();
              return Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        child: Image.asset(
                          posts[index].albumImages[index].imageLocation,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .05,
                            ),
                            child: Text(
                              posts[index].gameDetails.gameTitle,
                              style: GoogleFonts.getFont('Ubuntu',
                                  height: .8,
                                  textStyle: const TextStyle(
                                      fontSize: 55,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .05,
                            ),
                            child: Text(
                              posts[index].gameDetails.gamePublisher,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white.withOpacity(.6),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Container(
                              width: double.maxFinite,
                              // color: Colors.pink,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height:370,
                                    child: PageView.builder(
                                      itemCount:3,
                                      controller: _postAlbumImageController,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, albumIndex) {
                                        // posts[index].albumImages.shuffle();
                                        return Transform.scale(
                                          scale: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 20),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius
                                                          .circular(15),
                                                  child: Image.asset(
                                                    posts[index]
                                                        .albumImages[
                                                            albumIndex]
                                                        .imageLocation,
                                                    height: 370,
                                                    fit: BoxFit.cover,
                                                    width: MediaQuery.of(context).size.width*.6,
                                                    alignment: Alignment(
                                                        -albumPageOffset
                                                                .abs() +1 ,
                                                        0),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 10,
                                                  bottom: 10,
                                                  right: 10,
                                                  child: Text(
                                                    posts[index]
                                                        .albumImages[
                                                            albumIndex]
                                                        .imageTitle,
                                                    style: GoogleFonts
                                                        .getFont(
                                                      'Ubuntu',
                                                      textStyle: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                                  .6),
                                                          fontWeight:
                                                              FontWeight
                                                                  .w600),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    // color: Colors.blue,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  [
                                              Icon(
                                                FontAwesomeIcons.thumbsUp,
                                                color: Colors.white.withOpacity(.6),
                                                size: 25,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.thumbsDown,
                                                color: Colors.white.withOpacity(.6),
                                                size: 25,
                                              ),
                                              Icon(
                                                FontAwesomeIcons.heart,
                                                color: Colors.white.withOpacity(.6),
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              FontAwesomeIcons.ellipsisV,
                                              color: Colors.white.withOpacity(.6),
                                              size: 25,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "By ${posts[index].author}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.getFont(
                                      'Ubuntu',
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white.withOpacity(.6),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
