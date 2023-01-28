import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/clubProvider.dart';

import '../provider/event_providr.dart';
import '../utils/colorConstants.dart';
import 'dart:io';


class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<clubProvider>(context, listen: false).getAnnouncements();
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<clubProvider>(context);

    return
      Scaffold(
        body:
        SafeArea(
          child: data.isLoading
              ? const Center(
            child: SpinKitCircle(color: ConstantColors.primaryColor),
          )
              : data.Items1.isEmpty
              ? const Center(
            child: Text(
              'No Events Found !',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: ConstantColors.primaryColor,
                fontFamily: ('medium'),
              ),
            ),
          )
              : ListView.builder(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            itemCount: data.Items1.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              // builder: (c) => products[i],
                value: data.Items1[i],
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: const [
                      BoxShadow(
                        color: const Color(0x260081ff),
                        offset: Offset(0, 3),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(

                              data.Items1[i].title,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: ConstantColors.primaryColor,
                                letterSpacing: 0.24,
                                fontWeight: FontWeight.w500,
                                height: 2,
                              ),
                              textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                color: ConstantColors.disabledBtn,
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "View Details",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    color: ConstantColors.primaryColor,
                                    height: 2,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //     width: 100,
                            //     height: 30,
                            //     child: ElevatedButton(
                            //       child: const Text(
                            //         "Reschedule",
                            //         style: TextStyle(
                            //           fontFamily: 'Roboto',
                            //           fontSize: 12,
                            //           color: ConstantColors.white,
                            //           height: 2,
                            //         ),
                            //         textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            //         softWrap: false,
                            //       ),
                            //       onPressed: () => {},
                            //       style: ElevatedButton.styleFrom(
                            //         backgroundColor: ConstantColors.primaryColor,
                            //       ),
                            //     )),
                          ],
                        ),
                      ),
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.zero,
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: data.Items1[i].doc_link.isEmpty
                                            ? Image.asset('assets/icons/useers.png').image
                                            : Image.network(data.Items1[i].doc_link).image,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                        data.Items1[i].description,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 14,
                                          color: Color(0xcc000000),
                                          fontWeight: FontWeight.w500,
                                          height: 1.2307692307692308,
                                        ),
                                        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      );
  }
}

