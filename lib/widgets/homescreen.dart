import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/models/allusers_model.dart';
import 'package:whackiest_2023/provider/allusers_provider.dart';
import 'package:whackiest_2023/utils/colorConstantsswipe.dart';
import 'package:whackiest_2023/widgets/swipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static var _isInit = true;
  static var isLoading = false;
  final AppinioSwiperController controller = AppinioSwiperController();
  List<SwipeCard> cards = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<UserProvider>(context, listen: false).getUser().then((value) {
        for (usersModel candidate in value) {
          cards.add(
            SwipeCard(
              key: Key(candidate.name),
              model: candidate,
            ),
          );
        }
      });

      setState(() {
        isLoading = false;
        _isInit = false;
      });
    }
  }



  @override
  void dispose() {
    setState(() {
      _isInit = true;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserProvider>(context);

    double height = MediaQuery.of(context).size.height;

    // ignore: no_leading_underscores_for_local_identifiers
    void _swipe(int index, AppinioSwiperDirection direction) {
      log("the card was swiped to the: " + direction.name);
    }

    void _unswipe(bool unswiped) {
      if (unswiped) {
        log("SUCCESS: card was unswiped");
      } else {
        log("FAIL: no card left to unswipe");
      }
    }


    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: AppinioSwiper(
                      threshold: 90,
                      padding: EdgeInsets.zero,
                      unlimitedUnswipe: true,
                      maxAngle: 90,
                      onSwipe: _swipe,
                      duration: const Duration(milliseconds: 400),
                      controller: controller,
                      cards: cards,
                      onEnd: () async {
                        print("swipe end");
                        await profile.getUser().then((value) {
                          for (usersModel candidate in profile.Items) {
                            cards.add(
                              SwipeCard(
                                key: Key(candidate.name),
                                model: candidate,
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: profile.Items.isEmpty && !profile.isLoading,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  " No Profile Found !",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "medium",
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: profile.Items.isNotEmpty && !profile.isLoading,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 5),
                    child: FloatingActionButton(
                      heroTag: "2",
                      onPressed: () {
                        controller.swipeLeft();
                      },
                      backgroundColor: ConstantColors.white,
                      child: Center(
                        child: Image.asset(
                          "lib/assets/icons/cancelIcon.png",
                          height: 15,
                          width: 15,
                        ),
                      ),
                    )),
              ),
            ),
            Visibility(
              visible: profile.Items.isNotEmpty && !profile.isLoading,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 5),
                  child: FloatingActionButton(
                    heroTag: "1",
                    onPressed: () {
                      controller.swipeRight();
                    },
                    backgroundColor: ConstantColors.white,
                    child: const Text(
                      "Network",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            isLoading
                ? Container(
                    height: height,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.50)),
                    child: const Center(
                      child: SpinKitCircle(color: ConstantColors.primaryColor),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
