import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
          child: ListView(
              children:[
                Container(width: width,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(6.0),

                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image:
                              Image.asset('lib/assets/icons/useers.png').image,

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
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Job",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Date | Time",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0x99c2d4ee),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: ImageIcon(
                                            Image.asset('lib/assets/icons/callIcon.png').image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),

                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ]
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(width: width,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(6.0),

                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image:
                              Image.asset('lib/assets/icons/useers.png').image,

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
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Job",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Date | Time",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0x99c2d4ee),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: ImageIcon(
                                            Image.asset('lib/assets/icons/callIcon.png').image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),

                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ]
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(width: width,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(6.0),

                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image:
                              Image.asset('lib/assets/icons/useers.png').image,

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
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Job",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Date | Time",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0x99c2d4ee),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: ImageIcon(
                                            Image.asset('lib/assets/icons/callIcon.png').image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),

                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ]
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(width: width,
                  height: 160,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(6.0),

                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            width: 140,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image:
                              Image.asset('lib/assets/icons/useers.png').image,

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
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Job",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Date | Time",
                                  style: TextStyle(
                                    color: Color(0xb2000000),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0x99c2d4ee),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: ImageIcon(
                                            Image.asset('lib/assets/icons/callIcon.png').image,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                      const SizedBox(width: 5,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5,),

                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: const Color(0x99c2d4ee),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            child: ImageIcon(
                                              Image.asset('lib/assets/icons/callIcon.png').image,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ]
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ]
          ),
        ));
  }
}