
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whackiest_2023/screens/Sponsors.dart';
import 'package:whackiest_2023/screens/achievement.dart';
import 'package:whackiest_2023/screens/announcements.dart';
import 'package:whackiest_2023/screens/committee.dart';
import 'package:whackiest_2023/screens/event_schedule.dart';
import 'package:whackiest_2023/screens/message.dart';
import 'package:whackiest_2023/utils/colorConstantsswipe.dart';
import 'package:whackiest_2023/widgets/homescreen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _scrollController;
  late final PageController _c = PageController(
    initialPage: 0,
  );

  double offset = 0.0;
  static final _isInit = true;
  static final _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  int _selectedIndex = 0;
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onItemTapped(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_c.hasClients) {
        _c.animateToPage(index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut);

        setState(() {
          _selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    List<String> headers = ["Network", "Events", "Announcement", "Committee","Achievements"];

    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      ScheduleTab(),
      Announcement(),
      Committee(),
      Achievement(),

    ];
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: ConstantColors.black,
                size: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          headers[_selectedIndex],
          style: const TextStyle(
            fontFamily: 'medium',
            fontSize: 18,
            color: Color(0xff000000),
          ),
          textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
        backgroundColor: Colors.white,
        actions: const <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Image(
          //       image: Image.asset('assets/icons/notIcon.png').image,
          //       height: 20.0,
          //       width: 20.0,
          //     ),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //   ],
          // ),
        ],
      ),
      drawer: Container(
        color: ConstantColors.white,
        width: width * 0.8,
        child: Drawer(
          backgroundColor: ConstantColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/10,),
             // GestureDetector(
              //                 behavior: HitTestBehavior.opaque,
              //                 onTap: () {
              //                   _scaffoldKey.currentState!.openEndDrawer();
              //                   _onItemTapped(4);
              //                 },
              //                 child: Container(
              //                   color: ConstantColors.white,
              //                   alignment: Alignment.topLeft,
              //                   child: Padding(
              //                     padding: const EdgeInsets.only(top: 50, left: 30, right: 10),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         Container(
              //                           padding: EdgeInsets.zero,
              //                           width: 80,
              //                           height: 80,
              //                           decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.circular(12),
              //                             image: DecorationImage(
              //                                 image: user.profileModel.profileImage == '' ? Image.asset('assets/icons/useers.png').image : NetworkImage(user.profileModel.profileImage), fit: BoxFit.cover),
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 10,
              //                         ),
              //                         Text(
              //                           user.profileModel.name,
              //                           style: const TextStyle(
              //                             color: Colors.black,
              //                             fontFamily: "medium",
              //                             fontSize: 18,
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 5,
              //                         ),
              //                         Text(
              //                           user.profileModel.chapterName,
              //                           style: const TextStyle(
              //                             color: Colors.black,
              //                             fontFamily: "regular",
              //                             fontSize: 14,
              //                           ),
              //                         ),
              //                         const SizedBox(
              //                           height: 10,
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    _onItemTapped(0);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/home.png").image,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Home",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Committee.routeName,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/commitee.png").image,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Add Achievement",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    _onItemTapped(1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/event.png").image,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Events",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                   // Navigator.pushNamed(
                   //   context,
                     /// Stalls.routeName,
                   // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/stalls.png").image,
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Developers",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _scaffoldKey.currentState!.openEndDrawer();
                    _onItemTapped(3);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/sponsor.png").image,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Sponsors",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Message()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/121.png").image,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Message",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 45,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                   // Navigator.pushNamed(
                 //     context,
                      ///UserFeedback.routeName,
                  //  );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        image: Image.asset("lib/assets/icons/feedback.png").image,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Feedback",
                        style: TextStyle(color: Colors.black, fontFamily: "regular", fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              const SizedBox(height: 20),

              const SizedBox(height: 20),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: PageView.builder(
              itemCount: _widgetOptions.length,
              controller: _c,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(child: _widgetOptions.elementAt(index));
              }),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
    child: Theme(data: Theme.of(context).copyWith(
    canvasColor:  ConstantColors.button,
    ),

          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.0,
                  children: [
                    _selectedIndex == 0
                        ? Column(
                      children: [
                        ImageIcon(
                          Image.asset('lib/assets/network.png')
                              .image,
                          size: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(top: 5),
                          height: 2,
                          width: 12.0,
                        ),
                      ],
                    )
                        : ImageIcon(
                      Image.asset('lib/assets/network.png').image,
                      size: 24.0,
                    ),
                    _selectedIndex == 1
                        ? const Text(
                      '',
                      style: TextStyle(fontSize: 14.0),
                    )
                        : const Text(''),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.0,
                  children: [
                    _selectedIndex == 1
                        ? Column(
                      children: [
                        ImageIcon(
                          Image.asset('lib/assets/events.png')
                              .image,
                          size: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          margin: const EdgeInsets.only(top: 5),
                          height: 2,
                          width: 12.0,
                        ),
                      ],
                    )
                    //background: rgba(246, 220, 220, 1);
                        : ImageIcon(
                      Image.asset('lib/assets/events.png').image,
                      size: 24.0,
                    ),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon:
                    _selectedIndex == 2
                        ?
                         Stack(
                           children: [Positioned(
                             child: ImageIcon(
                                Image.asset("assets/img.png",)
                                    .image,
                                size: 45),
                           ),

                          ]
                         )
                        :        Stack(
                        children: [Positioned(
                          child: ImageIcon(
                              Image.asset("assets/img.png",)
                                  .image,
                              size: 45),
                        ),


                        ]
                    ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.0,
                  children: [
                    _selectedIndex == 3
                        ? Column(
                      children: [
                        ImageIcon(
                          Image.asset('lib/assets/commiitte.png')
                              .image,
                          size: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(top: 5),
                          height: 2,
                          width: 12.0,
                        ),
                      ],
                    )
                        : ImageIcon(
                      Image.asset('lib/assets/commiitte.png').image,
                      size: 24.0,
                    ),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.0,
                  children: [
                    _selectedIndex == 4
                        ? Column(
                      children: [
                        ImageIcon(
                          Image.asset('lib/assets/achievement.png')
                              .image,
                          size: 24.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(top: 5),
                          height: 2,
                          width: 12.0,
                        ),
                      ],
                    )
                        : ImageIcon(
                      Image.asset('lib/assets/achievement.png').image,
                      size: 24.0,
                    ),
                    _selectedIndex == 4
                        ? const Text('', style: TextStyle(fontSize: 14.0))
                        : const Text(''),
                  ],
                ),
                label: "",
              ),
            ],
            currentIndex: _selectedIndex,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(fontSize: 0.0),
            unselectedLabelStyle: const TextStyle(fontSize: 0.0),
            unselectedIconTheme:
            const IconThemeData(color: Colors.black, size: 20.0),
            selectedIconTheme: const IconThemeData(color: Colors.black),
            onTap: _onItemTapped,
           backgroundColor:ConstantColors.button,
           // backgroundColor: Colors.black,
         fixedColor: ConstantColors.button,


          ),
        ),
      ),
      ),

    );
  }
}

ProfileScreen() {
}

Notify() {
}

Add() {
}

Gallery() {
}

Home() {
}
