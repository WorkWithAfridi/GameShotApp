import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gameshot/pages/homepage/homepage.dart';
import 'package:gameshot/pages/onBoarding/onBoardingPageClass/onBoardingImages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingPage extends StatefulWidget {
  static const routeName = '/onBoarding';
  const onBoardingPage({Key? key}) : super(key: key);

  @override
  _onBoardingPageState createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {
  List<onBoardingImage> onBoardingImages = [
    onBoardingImage(
        'title',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
        'lib/assets/onBoardingImages/hzd1.png'),
    onBoardingImage(
        'title2',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
        'lib/assets/onBoardingImages/fortnite.png'),
    onBoardingImage(
        'title3',
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
        'lib/assets/onBoardingImages/nfs.png'),
  ];

  PageController _pageController = new PageController();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemCount: onBoardingImages.length,
              itemBuilder: (context, index) {
                return Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          child: Image.asset(
                            onBoardingImages[index].imageLocation,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .08,
                        ),
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              onBoardingImages[index].title,
                              style: GoogleFonts.getFont('Ubuntu',
                                  textStyle: const TextStyle(
                                      fontSize: 55,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(
                              onBoardingImages[index].subTitle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
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
                                    _pageIndex==2? Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Material(
                                        elevation: 6,
                                        borderRadius: BorderRadius.circular(10),
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pushNamed(Homepage.routeName);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 15),
                                            height: MediaQuery.of(context).size.height*.07,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Get started',
                                                  style: GoogleFonts.getFont(
                                                      'Ubuntu',
                                                      textStyle: const TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                                const Icon(
                                                  FontAwesomeIcons.arrowRight,
                                                  size: 15,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ) : Container(),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SmoothPageIndicator(
                                      controller: _pageController,
                                      count: 3,
                                      effect: ScrollingDotsEffect(
                                        radius: 7,
                                        dotHeight: 7,
                                        dotWidth: 7,
                                        spacing: 5,
                                        dotColor: Colors.grey,
                                        activeDotColor:
                                        Theme.of(context).colorScheme.primary,
                                      ),
                                      onDotClicked: (index) {
                                        setState(
                                              () {
                                            _pageController.animateToPage(index,
                                                duration:
                                                const Duration(milliseconds: 500),
                                                curve: Curves.bounceOut);
                                          },
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
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
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * .05,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        _pageIndex == 0
                            ? Colors.transparent
                            : Colors.black.withOpacity(.4),
                        // Colors.black,
                        Colors.transparent,
                        //add more colors for gradient
                      ],
                      begin: Alignment.centerLeft, //begin of the gradient color
                      end: Alignment.centerRight, //end of the gradient color
                      stops: [0, 0.0, 0.0, 1] //stops for individual color
                      //set the stops number equal to numbers of color
                      ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * .05,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent,
                        _pageIndex == 2
                            ? Colors.transparent
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(.4)
                        // Theme.of(context).colorScheme.primary.withOpacity(.4)
                        //add more colors for gradient
                      ],
                      begin: Alignment.centerLeft, //begin of the gradient color
                      end: Alignment.centerRight, //end of the gradient color
                      stops: const [0, 0.0, 0.0, 1] //stops for individual color
                      //set the stops number equal to numbers of color
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
