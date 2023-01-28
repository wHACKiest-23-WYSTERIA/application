
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/event_providr.dart';
import 'package:whackiest_2023/utils/colorConstantsswipe.dart';
import 'package:whackiest_2023/widgets/AllEvents.dart';


class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ConstantColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;

    final data = Provider.of<EventProvider>(context);

    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20),
            height: 60,
            color: ConstantColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [

                  ],
                ),
              //  Row(
                //                   children: [
                //                     Image(
                //                       image: Image.asset('assets/icons/notification.png').image,
                //                       height: 20.0,
                //                       width: 20.0,
                //                     ),
                //                     const SizedBox(
                //                       width: 20,
                //                     ),
                //                     Image(
                //                       image: Image.asset('assets/icons/menu.png').image,
                //                       height: 20.0,
                //                       width: 20.0,
                //                     ),
                //                   ],
                //                 )
              ],
            ),
          ),
          Container(
            height: 30,
            color: ConstantColors.white,
            child: TabBar(
              controller: _tabController,
              onTap: (value) {
                print(value);
                //data.fetchData(value);
              },
              // give the indicator a decoration (color and border radius)
              indicatorColor: ConstantColors.primaryColor,
              labelColor: ConstantColors.primaryColor,
              indicatorWeight: 3,
              indicatorPadding: const EdgeInsets.only(top: 5, left: 25, right: 25),
              unselectedLabelColor: ConstantColors.primaryColor.withOpacity(0.6),
              tabs: const [
                Tab(
                  text: 'Ongoing',
                ),
                Tab(
                  text: 'Upcoming',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Ongoing(),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Upcoming(),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Completed(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// Another way to create upcoming and Competed without using Tabview 

// Container(
          //   height: 30,
          //   color: ConstantColors.white,
          //   child: Row(
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           data.updateUpcoming();
          //         },
          //         child: SizedBox(
          //           width: width * 0.5,
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   'Upcoming',
          //                   style: TextStyle(
          //                     fontFamily: 'Roboto',
          //                     fontSize: 14,
          //                     color: data.upcomingVisible ? ConstantColors.primaryColor : ConstantColors.primaryColor.withOpacity(0.6),
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                   textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
          //                   textAlign: TextAlign.center,
          //                   softWrap: false,
          //                 ),
          //                 Visibility(
          //                   visible: data.upcomingVisible,
          //                   child: const SizedBox(
          //                     width: 120,
          //                     child: Divider(
          //                       thickness: 4,
          //                       height: 4,
          //                       color: ConstantColors.primaryColor,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           data.updateCompleted();
          //         },
          //         child: SizedBox(
          //           width: width * 0.5,
          //           child: Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   'Completed',
          //                   style: TextStyle(
          //                     fontFamily: 'Roboto',
          //                     fontSize: 14,
          //                     color: data.completedVisible ? ConstantColors.primaryColor : ConstantColors.primaryColor.withOpacity(0.6),
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                   textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
          //                   textAlign: TextAlign.center,
          //                   softWrap: false,
          //                 ),
          //                 Visibility(
          //                   visible: data.completedVisible,
          //                   child: const SizedBox(
          //                     width: 120,
          //                     child: Divider(
          //                       thickness: 4,
          //                       height: 4,
          //                       color: ConstantColors.primaryColor,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
         
         
