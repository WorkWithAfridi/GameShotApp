import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  TextStyle menuLabel = GoogleFonts.getFont(
    'Open Sans',
    textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white.withOpacity(.9),
        fontWeight: FontWeight.w400),
  );

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pink,
                      child: Image.asset(
                        'lib/assets/offlineDatabase/hzd_cover.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          // color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            // color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.edit,
                                  size: 15,
                                  color: Colors.white.withOpacity(.7),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Edit Profile',
                                  style: menuLabel.copyWith(
                                      color: Colors.white.withOpacity(.7),
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 270,
                    alignment: Alignment.bottomLeft,
                    // color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * .4,
                        width: MediaQuery.of(context).size.width * .4,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .4)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .4),
                            child: Image.asset(
                              'lib/assets/offlineDatabase/kyoto.jpg',
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              // color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Khondakar Afridi',
                    style: menuLabel.copyWith(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'aka Kyoto',
                    style: menuLabel.copyWith(fontSize: 15, height: .8),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Location: Dhaka, Bangladesh',
                    style: menuLabel.copyWith(fontSize: 12, height: .8),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   TabBar(
                    tabs: [
                      Tab(text: 'About'),
                      Tab(text: 'Posts'),
                      Tab(text: 'Gallery'),
                    ],
                    controller: tabController,
                  ),
                  Container(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          height: 300,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'What you seek is also seeking you! :)',
                                style: menuLabel.copyWith(
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paragraphs Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. "
                                "Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede",
                                style: menuLabel.copyWith(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 15,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Text('Posts'),
                        ),
                        Container(
                          child: Text('Gallery'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
