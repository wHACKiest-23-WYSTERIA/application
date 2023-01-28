
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/utils/colorConstants.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  static var _isInit = true;
  @override
//  void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     if (_isInit) {
//       Provider.of<SponosorsProvider>(context, listen: false).getSponsors();
//       setState(() {
//         _isInit = false;
//       });
//     }
//   }
  @override
  void dispose() {
    setState(() {
      _isInit = true;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final spon = Provider.of<SponosorsProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
               // Visibility(
          //                   visible: !spon.isLoading,
          //                   child: spon.items.isEmpty
          //                       ? const Expanded(
          //                           child: Center(
          //                             child: Text(
          //                               "Sponsors not Found !",
          //                               style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontFamily: "medium",
          //                                 fontSize: 16,
          //                               ),
          //                             ),
          //                           ),
          //                         )
          //                       : Expanded(
          //                           child: Padding(
          //                             padding: const EdgeInsets.all(10),
          //                             child: ListView.builder(
          //                               shrinkWrap: true,
          //                               itemCount: spon.items.length,
          //                               itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          //                                 value: spon.items[i],
          //                                 child: Container(
          //                                   margin: const EdgeInsets.only(top: 5, bottom: 5),
          //                                   child: Column(
          //                                     children: [
          //                                       Image(
          //                                         image: NetworkImage(spon.items[i].image),
          //                                       ),
          //                                       const SizedBox(
          //                                         height: 5,
          //                                       ),
          //                                       const Divider(
          //                                         thickness: 2,
          //                                         color: ConstantColors.lightGrey,
          //                                       )
          //                                     ],
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                 )
              ],
            ),
            Center(
                child: //spon.isLoading ?

              Container(
                        height: height,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  <Widget>[
                                SpinKitFadingCircle(
                                  color: ConstantColors.primaryColor,
                                  size: 40.0,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
            )
          ],
        ),
      ),
    );
  }
}
