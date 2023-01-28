
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/achivement_provider.dart';
import 'package:whackiest_2023/provider/clubProvider.dart';
import 'package:whackiest_2023/provider/committe_provider.dart';
import 'package:whackiest_2023/provider/event_providr.dart';
import 'package:whackiest_2023/provider/register_provider.dart';
import 'package:whackiest_2023/screens/main_class.dart';




class AllClubs extends StatefulWidget {
  const AllClubs({Key? key}) : super(key: key);

  @override
  State<AllClubs> createState() => _AllClubsState();
}

class _AllClubsState extends State<AllClubs> with SingleTickerProviderStateMixin{
  static var _isInit = true;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<clubProvider>(context, listen: false).getclubs();
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
    final data = Provider.of<clubProvider>(context);
    final data1 = Provider.of<AchievementProvider>(context);
    final data2 = Provider.of<CommitteeProvider>(context);
    final data3 = Provider.of<EventProvider>(context);
    final reg = Provider.of<RegisterProvider>(context);




    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(appBar: AppBar(
      title: Text("All Clubs")

    ),
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: SafeArea(
            child:
            Column(
              children: [

                GridView.builder(
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
                        GestureDetector(
                          onTap: (){
                            data.updatedcid(context, data.Items[i].cid);
                            data1.updatedcid(context, data.Items[i].cid);
                            data2.updatedcid(context, data.Items[i].cid);
                            data3.updatedcid(context, data.Items[i].cid);




                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: width*0.15,
                              backgroundImage:NetworkImage(data.Items[i].club_logo)

                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(

                          data.Items[i].club_name,
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
              ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Club Recommendations",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                SizedBox(height: 20,),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child:  Text(
                      reg.recommendations,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
          ]
            )
        )
    );
  }


}
