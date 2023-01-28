import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';

import '../provider/event_providr.dart';
import '../utils/colorConstants.dart';
import 'dart:io';

class Ongoing extends StatefulWidget {
  const Ongoing({Key? key}) : super(key: key);

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<EventProvider>(context, listen: false).getOngoingEvent();
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
    final data = Provider.of<EventProvider>(context);

    return Scaffold(
     body: SafeArea( child:data.isLoading
          ? const Center(
              child: SpinKitCircle(color: ConstantColors.primaryColor),
            )
          : data.ongoingitems.isEmpty
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
       itemCount: data.ongoingitems.length,
       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
         // builder: (c) => products[i],
           value: data.ongoingitems[i],
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

                         data.ongoingitems[i].start_date.toString().replaceAll('T00:00:00.000Z','') + " | " + data.ongoingitems[i].end_date.toString().replaceAll('T00:00:00.000Z', ''),
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
                                   image: data.ongoingitems[i].image.isEmpty
                                       ? Image.asset('assets/icons/useers.png').image
                                       : Image.network(data.ongoingitems[i].image).image,
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
                                   data.ongoingitems[i].title,
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

                                 Text(
                                   overflow: TextOverflow.fade,
                                   data.ongoingitems[i].aim,
                                   style: const TextStyle(
                                     fontFamily: 'Roboto',
                                     fontSize: 12,
                                     color: Color(0xff00bc89),
                                     height: 2.4,
                                   ),
                                   textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                   softWrap: false,
                                 ),
                                 const SizedBox(
                                   height: 10,
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
    ));
  }
}




class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<EventProvider>(context, listen: false).getUpcoming();
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
    final data = Provider.of<EventProvider>(context);

    return Scaffold(
      body: 
      SafeArea(
        child: data.isLoading
            ? const Center(
          child: SpinKitCircle(color: ConstantColors.primaryColor),
        )
            : data.upcomingitems.isEmpty
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
          itemCount: data.upcomingitems.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (c) => products[i],
              value: data.upcomingitems[i],
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

                            data.upcomingitems[i].start_date.toString().replaceAll('T00:00:00.000Z', '') + " | " + data.upcomingitems[i].end_date.toString().replaceAll('T00:00:00.000Z', ''),
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
                                  //image: DecorationImage(
                                  //                                             image: data.upcomingItems[i].caretakerImageUrl.isEmpty
                                  //                                                 ? Image.asset('assets/icons/useers.png').image
                                  //                                                 : Image.network(data.upcomingItems[i].caretakerImageUrl).image,
                                  //                                             fit: BoxFit.cover),
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
                                      data.upcomingitems[i].title,
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
                                  Text(
                                        overflow: TextOverflow.fade,
                                        data.upcomingitems[i].aim,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff00bc89),
                                          height: 2.4,
                                        ),
                                        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                        softWrap: false,
                                      ),
                                    
                                    const SizedBox(
                                      height: 10,
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




class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<EventProvider>(context, listen: false).getCompleted();
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
    final data = Provider.of<EventProvider>(context);

    return
      Scaffold(
        body: 
        SafeArea(
          child: data.isLoading
            ? const Center(
          child: SpinKitCircle(color: ConstantColors.primaryColor),
    )
            : data.completeditems.isEmpty
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
          itemCount: data.completeditems.length,
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (c) => products[i],
              value: data.completeditems[i],
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

                            data.completeditems[i].start_date.toString().replaceAll('T00:00:00.000Z','') + " | " + data.completeditems[i].end_date.toString().replaceAll('T00:00:00.000Z', ''),
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
                                                                               image: data.completeditems[i].image.isEmpty
                                                                                   ? Image.asset('assets/icons/useers.png').image
                                                                                  : Image.network(data.completeditems[i].image).image,
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
                                      data.completeditems[i].title,
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
                                    
                                      Text(
                                        overflow: TextOverflow.fade,
                                        data.completeditems[i].aim,
                                        style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 12,
                                          color: Color(0xff00bc89),
                                          height: 2.4,
                                        ),
                                        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                                        softWrap: false,
                                    ),
                                    const SizedBox(
                                      height: 10,
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
