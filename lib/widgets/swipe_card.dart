import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:whackiest_2023/models/allusers_model.dart';
import 'package:whackiest_2023/utils/colorConstantsswipe.dart';

class SwipeCard extends StatelessWidget {
  final usersModel model;

  const SwipeCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    print(model.name);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontFamily: 'medium',
                    fontSize: 20,
                    overflow: TextOverflow.visible,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                const SizedBox(
                  width: 10,
                ),
                // Visibility(
                //   visible: model.one2one,
                //   child: SizedBox(
                //     width: 30,
                //     height: 30,
                //     child: Image(
                //       image: Image.asset("assets/icons/121Done.png").image,
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.35,
              width: width,
              decoration: const BoxDecoration(
                color: ConstantColors.unSelected,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: model.profileImage != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image(
                        image: Image.network(model.profileImage).image,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image(
                        image: Image.asset("lib/assets/icons/useers.png").image,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [

                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.name,
                              style: const TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            color: ConstantColors.black.withOpacity(.20),
                          ),
                        ),
                        Row(
                          children: [

                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.usn,
                              style: const TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            color: ConstantColors.black.withOpacity(.20),
                          ),
                        ),
                      //  Row(
                        //                           children: [
                        //
                        //                             const SizedBox(
                        //                               width: 10,
                        //                             ),
                        //                             Expanded(
                        //                               child: Text(
                        //                                 model.usn,
                        //                                 overflow: TextOverflow.ellipsis,
                        //                                 softWrap: false,
                        //                                 style: const TextStyle(
                        //                                   fontFamily: 'medium',
                        //                                   fontSize: 12,
                        //                                   color: Color(0xff000000),
                        //                                 ),
                        //                               ),
                        //                             ),
                        //                           ],
                        //                         ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/icons/hobbiessIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Hobbies",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    model.interests.isEmpty
                        ? Container(
                            margin: const EdgeInsets.all(7),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffE9F2FF),
                            ),
                            child: const Text(
                              "NA",
                              style: TextStyle(fontFamily: 'medium', fontSize: 12, color: Color(0xff394556)),
                            ),
                          )
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    controller: ScrollController(),
                                    itemCount: model.hobbies.length,
                                    itemBuilder: (ctx, i) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffE9F2FF),
                                      ),
                                      child: Text(
                                        model.hobbies[i],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xff394556),
                                          fontFamily: "medium",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    // ChipList(
                    //     shouldWrap: true,
                    //     spacing: -5,
                    //     runSpacing: -10,
                    //     borderRadiiList: const [12],
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     listOfChipNames: model.hobbiess,
                    //     activeBgColorList: const [Color(0xffE9F2FF)],
                    //     inactiveBgColorList: const [Color(0xffE9F2FF)],
                    //     activeTextColorList: const [Color(0xff394556)],
                    //     inactiveTextColorList: const [Color(0xff394556)],
                    //     listOfChipIndicesCurrentlySeclected: const [0],
                    //     style: const TextStyle(fontFamily: "medium", fontSize: 14),
                    //   ),
                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/icons/networkIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Passion",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    model.interests.isEmpty
                        ? Container(
                            margin: const EdgeInsets.all(7),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffDBFFE3),
                            ),
                            child: const Text(
                              "NA",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff2F4D36),
                              ),
                            ),
                          )
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    controller: ScrollController(),
                                    itemCount: model.interests.length,
                                    itemBuilder: (ctx, i) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffDBFFE3),
                                      ),
                                      child: Text(
                                        model.interests[i],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xff2F4D36),
                                          fontFamily: "medium",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    // ChipList(
                    //     shouldWrap: true,
                    //     spacing: -5,
                    //     runSpacing: -10,
                    //     borderRadiiList: const [12],
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     listOfChipNames: model.network,
                    //     activeBgColorList: const [Color(0xffDBFFE3)],
                    //     inactiveBgColorList: const [Color(0xffDBFFE3)],
                    //     activeTextColorList: const [Color(0xff2F4D36)],
                    //     inactiveTextColorList: const [Color(0xff2F4D36)],
                    //     listOfChipIndicesCurrentlySeclected: const [0],
                    //     style: const TextStyle(fontFamily: "medium", fontSize: 14),
                    //   ),
                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/icons/skillIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    model.programming_languages.isEmpty
                        ? Container(
                            margin: const EdgeInsets.all(7),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffFFEAA0),
                            ),
                            child: const Text(
                              "NA",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff4F4525),
                              ),
                            ),
                          )
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    controller: ScrollController(),
                                    itemCount: model.programming_languages.length,
                                    itemBuilder: (ctx, i) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffFFEAA0),
                                      ),
                                      child: Text(
                                        model.programming_languages[i],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xff4F4525),
                                          fontFamily: "medium",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    // : ChipList(
                    //     shouldWrap: true,
                    //     spacing: -5,
                    //     runSpacing: -10,
                    //     borderRadiiList: const [12],
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     listOfChipNames: model.skills,
                    //     activeBgColorList: const [Color(0xffFFEAA0)],
                    //     inactiveBgColorList: const [Color(0xffFFEAA0)],
                    //     activeTextColorList: const [Color(0xff4F4525)],
                    //     inactiveTextColorList: const [Color(0xff4F4525)],
                    //     listOfChipIndicesCurrentlySeclected: const [0],
                    //     style: const TextStyle(fontFamily: "medium", fontSize: 14),
                    //   ),
                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/icons/accompIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Tech Stack",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    model.tech_stack.isEmpty
                        ? Container(
                            margin: const EdgeInsets.all(7),
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffFFE5E5),
                            ),
                            child: const Text(
                              "NA",
                              style: TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff412A2A),
                              ),
                            ),
                          )
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.only(top: 10, left: 5, bottom: 2),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    controller: ScrollController(),
                                    itemCount: model.tech_stack.length,
                                    itemBuilder: (ctx, i) => Container(
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xffFFE5E5),
                                      ),
                                      child: Text(
                                        model.tech_stack[i],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xff412A2A),
                                          fontFamily: "medium",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    // ChipList(
                    //     shouldWrap: true,
                    //     spacing: -5,
                    //     runSpacing: -10,
                    //     borderRadiiList: const [12],
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     listOfChipNames: model.accomplishment,
                    //     activeBgColorList: const [Color(0xffFFE5E5)],
                    //     inactiveBgColorList: const [Color(0xffFFE5E5)],
                    //     activeTextColorList: const [Color(0xff412A2A)],
                    //     inactiveTextColorList: const [Color(0xff412A2A)],
                    //     listOfChipIndicesCurrentlySeclected: const [0],
                    //     style: const TextStyle(fontFamily: "medium", fontSize: 14),
                    //   ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffACEBFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Burning Desire",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff327E97),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      model.burning_desire.isEmpty ? "NA" : model.burning_desire,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffE7FAEB).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Success Is",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff327E97),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      model.passion.isEmpty ? "NA" : model.passion,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffFFEAA0).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Goal",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff4F4525),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
// SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 model.name,
//                 style: const TextStyle(
//                   fontFamily: 'medium',
//                   fontSize: 20,
//                   color: Color(0xff000000),
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: height * 0.35,
//             width: width,
//             decoration: const BoxDecoration(
//               color: ConstantColors.unSelected,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//             ),
//             child: model.profileImage != ""
//                 ? ClipRRect(
//                     borderRadius: BorderRadius.circular(7),
//                     child: Image(
//                       image: Image.network(model.profileImage).image,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 : ClipRRect(
//                     borderRadius: BorderRadius.circular(7),
//                     child: Image(
//                       image: Image.asset("assets/icons/useers.png").image,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Card(
//             elevation: 2,
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Image(
//                             image: Image.asset("assets/icons/bniYear.png").image,
//                             height: 23,
//                             width: 23,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             model.inBni,
//                             style: const TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                         child: VerticalDivider(
//                           width: 1,
//                           color: ConstantColors.black.withOpacity(.20),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Image(
//                             image: Image.asset("assets/icons/bussinessYear.png").image,
//                             height: 17,
//                             width: 18,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             model.inBussiness,
//                             style: const TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                         child: VerticalDivider(
//                           width: 1,
//                           color: ConstantColors.black.withOpacity(.20),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Image(
//                             image: Image.asset("assets/icons/petIcon.png").image,
//                             height: 18,
//                             width: 17,
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             model.inBni,
//                             style: const TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff000000),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 1,
//                     color: ConstantColors.black.withOpacity(.10),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         "assets/icons/hobbiessIcon.png",
//                         height: 15,
//                         width: 20,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Hobbies",
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           fontFamily: "medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   model.hobbiess.isEmpty
//                       ? Container(
//                           margin: const EdgeInsets.all(7),
//                           padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xffE9F2FF),
//                           ),
//                           child: const Text(
//                             "NA",
//                             style: TextStyle(fontFamily: 'medium', fontSize: 12, color: Color(0xff394556)),
//                           ),
//                         )
//                       : ChipList(
//                           shouldWrap: true,
//                           spacing: -5,
//                           runSpacing: -10,
//                           borderRadiiList: const [12],
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           listOfChipNames: model.hobbiess,
//                           activeBgColorList: const [Color(0xffE9F2FF)],
//                           inactiveBgColorList: const [Color(0xffE9F2FF)],
//                           activeTextColorList: const [Color(0xff394556)],
//                           inactiveTextColorList: const [Color(0xff394556)],
//                           listOfChipIndicesCurrentlySeclected: const [0],
//                           style: const TextStyle(fontFamily: "medium", fontSize: 14),
//                         ),
//                   Divider(
//                     thickness: 1,
//                     color: ConstantColors.black.withOpacity(.10),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         "assets/icons/networkIcon.png",
//                         height: 15,
//                         width: 20,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Network",
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           fontFamily: "medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   model.network.isEmpty
//                       ? Container(
//                           margin: const EdgeInsets.all(7),
//                           padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xffDBFFE3),
//                           ),
//                           child: const Text(
//                             "NA",
//                             style: TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff2F4D36),
//                             ),
//                           ),
//                         )
//                       : ChipList(
//                           shouldWrap: true,
//                           spacing: -5,
//                           runSpacing: -10,
//                           borderRadiiList: const [12],
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           listOfChipNames: model.network,
//                           activeBgColorList: const [Color(0xffDBFFE3)],
//                           inactiveBgColorList: const [Color(0xffDBFFE3)],
//                           activeTextColorList: const [Color(0xff2F4D36)],
//                           inactiveTextColorList: const [Color(0xff2F4D36)],
//                           listOfChipIndicesCurrentlySeclected: const [0],
//                           style: const TextStyle(fontFamily: "medium", fontSize: 14),
//                         ),
//                   Divider(
//                     thickness: 1,
//                     color: ConstantColors.black.withOpacity(.10),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         "assets/icons/skillIcon.png",
//                         height: 15,
//                         width: 20,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Skills",
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           fontFamily: "medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   model.skills.isEmpty
//                       ? Container(
//                           margin: const EdgeInsets.all(7),
//                           padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xffFFEAA0),
//                           ),
//                           child: const Text(
//                             "NA",
//                             style: TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff4F4525),
//                             ),
//                           ),
//                         )
//                       : ChipList(
//                           shouldWrap: true,
//                           spacing: -5,
//                           runSpacing: -10,
//                           borderRadiiList: const [12],
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           listOfChipNames: model.skills,
//                           activeBgColorList: const [Color(0xffFFEAA0)],
//                           inactiveBgColorList: const [Color(0xffFFEAA0)],
//                           activeTextColorList: const [Color(0xff4F4525)],
//                           inactiveTextColorList: const [Color(0xff4F4525)],
//                           listOfChipIndicesCurrentlySeclected: const [0],
//                           style: const TextStyle(fontFamily: "medium", fontSize: 14),
//                         ),
//                   Divider(
//                     thickness: 1,
//                     color: ConstantColors.black.withOpacity(.10),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         "assets/icons/accompIcon.png",
//                         height: 15,
//                         width: 20,
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       const Text(
//                         "Accomplishments",
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           fontFamily: "medium",
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 0,
//                   ),
//                   model.accomplishment.isEmpty
//                       ? Container(
//                           margin: const EdgeInsets.all(7),
//                           padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: const Color(0xffFFE5E5),
//                           ),
//                           child: const Text(
//                             "NA",
//                             style: TextStyle(
//                               fontFamily: 'medium',
//                               fontSize: 12,
//                               color: Color(0xff412A2A),
//                             ),
//                           ),
//                         )
//                       : ChipList(
//                           shouldWrap: true,
//                           spacing: -5,
//                           runSpacing: -10,
//                           borderRadiiList: const [12],
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           listOfChipNames: model.accomplishment,
//                           activeBgColorList: const [Color(0xffFFE5E5)],
//                           inactiveBgColorList: const [Color(0xffFFE5E5)],
//                           activeTextColorList: const [Color(0xff412A2A)],
//                           inactiveTextColorList: const [Color(0xff412A2A)],
//                           listOfChipIndicesCurrentlySeclected: const [0],
//                           style: const TextStyle(fontFamily: "medium", fontSize: 14),
//                         ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Visibility(
//             visible: model.image1.isNotEmpty,
//             child: Container(
//                 height: height * 0.35,
//                 width: width,
//                 decoration: const BoxDecoration(
//                   color: ConstantColors.unSelected,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(7),
//                   child: Image(
//                     image: Image.network(model.image1).image,
//                     fit: BoxFit.cover,
//                   ),
//                 )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xffACEBFF).withOpacity(0.30),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Burning Desire",
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     fontFamily: "medium",
//                     color: Color(0xff327E97),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   width: width,
//                   child: Text(
//                     model.burningDesire.isEmpty ? "NA" : model.burningDesire,
//                     style: const TextStyle(
//                       fontSize: 14.0,
//                       fontFamily: "medium",
//                       color: Color(0xff000000),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Visibility(
//             visible: model.image2.isNotEmpty,
//             child: Container(
//                 height: height * 0.35,
//                 width: width,
//                 decoration: const BoxDecoration(
//                   color: ConstantColors.unSelected,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(7),
//                   child: Image(
//                     image: Image.network(model.image2).image,
//                     fit: BoxFit.cover,
//                   ),
//                 )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xffE7FAEB).withOpacity(0.30),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Success Is",
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     fontFamily: "medium",
//                     color: Color(0xff327E97),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   width: width,
//                   child: Text(
//                     model.successIs.isEmpty ? "NA" : model.successIs,
//                     style: const TextStyle(
//                       fontSize: 14.0,
//                       fontFamily: "medium",
//                       color: Color(0xff000000),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Visibility(
//             visible: model.image3.isNotEmpty,
//             child: Container(
//                 height: height * 0.35,
//                 width: width,
//                 decoration: const BoxDecoration(
//                   color: ConstantColors.unSelected,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(7),
//                   child: Image(
//                     image: Image.network(model.image3).image,
//                     fit: BoxFit.cover,
//                   ),
//                 )),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xffFFEAA0).withOpacity(0.30),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Goal",
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     fontFamily: "medium",
//                     color: Color(0xff4F4525),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   width: width,
//                   child: Text(
//                     model.goals.isEmpty ? "NA" : model.goals,
//                     style: const TextStyle(
//                       fontSize: 14.0,
//                       fontFamily: "medium",
//                       color: Color(0xff000000),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 60,
//           ),
//         ],
//       ),
//     );