import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gameshot/pages/homepage/account.dart';
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

  late Scaffold currentScaffold;

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
        "1"),
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

    currentWidget = getHomePage();
  }

  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  late Widget currentWidget;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: menuScreen(context),
      mainScreen: mainScreen(context),
      controller: zoomDrawerController,
      borderRadius: 24.0,
      showShadow: true,
      angle: -2,
      style: DrawerStyle.Style1,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      slideWidth: MediaQuery.of(context).size.width * 0.55,
    );
  }

  TextStyle menuLabel = GoogleFonts.getFont(
    'Roboto Condensed',
    textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white.withOpacity(.9),
        fontWeight: FontWeight.w400),
  );

  EdgeInsets menuItemPadding =
      EdgeInsets.symmetric(vertical: 5, horizontal: 20);

  Scaffold menuScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(50),
      body: GestureDetector(
        onTap: () {
          zoomDrawerController.close!();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.pink,
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {
                  currentScaffold = mainScreen(context);
                  zoomDrawerController.toggle!.call();
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.pink,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Text(
                          posts[1].author.substring(0, 1),
                          style: GoogleFonts.getFont('Ubuntu',
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text('Khondakar Afridi',
                              style: menuLabel.copyWith(
                                  fontWeight: FontWeight.w600, height: .5)),
                          Row(
                            children: [
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('Active status',
                                  style: menuLabel.copyWith(fontSize: 13)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          currentWidget = getHomePage();
                          setState(() {});
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.igloo,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Home', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentScaffold = mainScreen(context);
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Favorites', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentScaffold = mainScreen(context);
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.thumbsUp,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Liked', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentScaffold = mainScreen(context);
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.commentAlt,
                                color: Colors.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Comments', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentWidget = const AccountPage();
                          setState(() {});
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.user,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Account', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          currentScaffold = mainScreen(context);
                          zoomDrawerController.toggle!.call();
                        },
                        child: Container(
                          padding: menuItemPadding,
                          // color: Colors.pink,
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.slidersH,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Settings', style: menuLabel),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  currentScaffold = mainScreen(context);
                  zoomDrawerController.toggle!.call();
                },
                child: Container(
                  height: 50,
                  padding: menuItemPadding,
                  // color: Colors.pink,
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign Out', style: menuLabel),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold mainScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.secondary,
        child: Stack(
          children: [
            currentWidget,
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
            children: [
              GestureDetector(
                onTap: () {
                  print('Opening zoom drawer');
                  zoomDrawerController.toggle?.call();
                  setState(() {});
                },
                child: Icon(
                  FontAwesomeIcons.bars,
                  color: Colors.white,
                  size: 20,
                ),
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

  late int postLength = posts.length;

  PageView getHomePage() {
    return PageView.builder(
      controller: _postPageController,
      onPageChanged: (index) {
        setState(() {
          _pageIndex = index;
        });
      },
      scrollDirection: Axis.vertical,
      itemCount: postLength,
      itemBuilder: (context, index) {
        print(index);
        // print(posts.length);
        if (index == posts.length - 2) {
          posts = posts + posts;
          postLength += 10;
        }
        _postPageController = PageController();
        return Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          // color: Colors.blue,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: Image.asset(
                    posts[index].albumImages[1].imageLocation,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black54,
                      ],
                      stops: [0, 0, 0, 20],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .05,
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
                        horizontal: MediaQuery.of(context).size.width * .05,
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
                    getPageAlbum(context, index)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Expanded getPageAlbum(BuildContext context, int index) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        // color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .4,
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: 3,
                controller: _postAlbumImageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, albumIndex) {
                  // posts[index].albumImages.shuffle();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transform.scale(
                      scale: 1,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              posts[index]
                                  .albumImages[albumIndex]
                                  .imageLocation,
                              height: MediaQuery.of(context).size.height * .4,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * .8,
                              // alignment: Alignment(
                              //     -albumPageOffset.abs() + 1,
                              //     0),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 10,
                            right: 10,
                            child: Text(
                              posts[index].albumImages[albumIndex].imageTitle,
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white.withOpacity(.6),
                                    fontWeight: FontWeight.w600),
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.blue,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.thumbsUp,
                          color: Colors.white.withOpacity(.8),
                          size: 25,
                        ),
                        Icon(
                          FontAwesomeIcons.thumbsDown,
                          color: Colors.white.withOpacity(.8),
                          size: 25,
                        ),
                        Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.white.withOpacity(.8),
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
                        color: Colors.white.withOpacity(.8),
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              // color: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Text(
                      posts[index].author.substring(0, 1),
                      style: GoogleFonts.getFont('Ubuntu',
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].author,
                        style: GoogleFonts.getFont('Ubuntu',
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(.9),
                                fontWeight: FontWeight.w400)),
                      ),
                      Text(
                        'PC Master RACE',
                        style: GoogleFonts.getFont('Ubuntu',
                            textStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(.9),
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
