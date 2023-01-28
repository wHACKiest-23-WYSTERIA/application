
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/achivement_provider.dart';




class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> with SingleTickerProviderStateMixin{
  static var _isInit = true;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<AchievementProvider>(context, listen: false).getAchievement();
      setState(() {
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
    final data = Provider.of<AchievementProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: SafeArea(
          child:       GridView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: data.Items.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (BuildContext context, int i) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.rectangle),
              child: Container(
                  decoration: const BoxDecoration(

                  ),
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top:5,
                  ),
                  child: Column(children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: width*0.15,
                        backgroundImage:data.Items[i].image.isEmpty? Image.asset("lib/assets/icons/useers.png").image
                            :
                        NetworkImage(data.Items[i].image)

                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(

                      data.Items[i].title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xff1f1d1d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ])),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          )
        )
    );
  }


}
