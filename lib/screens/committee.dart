
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/committe_provider.dart';
import 'package:whackiest_2023/utils/colorConstants.dart';

class Committee extends StatefulWidget {
  const Committee({Key? key}) : super(key: key);
  static const routeName = '/commitee';

  @override
  State<Committee> createState() => _CommitteeState();
}

class _CommitteeState extends State<Committee> {
  static var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<CommitteeProvider>(context, listen: false).getCommittee();
      setState(() {
        _isInit = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final data = Provider.of<CommitteeProvider>(context);

    return Scaffold(
      backgroundColor:  ConstantColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              GridView.builder(
                shrinkWrap: true,
                itemCount: data.commiteeItems.length,
                padding: const EdgeInsets.only(left: 10),
                itemBuilder: (BuildContext context, int i) {
                  return Card(
                    child: Container(
                      width: width*0.50,height: height/2,
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  final imageProvider =
                                      Image.network(data.commiteeItems[i].profileImage).image;

                                  showImageViewer(context, imageProvider,
                                      onViewerDismissed: () {
                                        print("dismissed");
                                      });
                                  // Navigator.popAndPushNamed(
                                  //   context,
                                  //   StallLayout.routeName,
                                  // );
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                       height: 100,
                                        image: Image.network(data.commiteeItems[i].profileImage)
                                            .image,
                                        fit: BoxFit.fitWidth))),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.commiteeItems[i].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.commiteeItems[i].designation,
                              style: const TextStyle(
                                color: Color(0xb2000000),
                                fontSize: 14,
                              ),
                            ),

                          ]),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
