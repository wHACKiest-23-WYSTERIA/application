
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


import 'package:provider/provider.dart';
import 'package:whackiest_2023/provider/register_provider.dart';
import 'package:whackiest_2023/utils/colorConstants.dart';


class Registration extends StatefulWidget {
  const Registration({
    Key? key,
  }) : super(key: key);


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final ImagePicker _picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    var reg = Provider.of<RegisterProvider>(context);


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> interests= ["space","coding","cpp","dsa","development","racing","dance","music","sports","Astronomy","stargazing","Astronautics","Telescope","management","Photography"];
    List<String> techstack = ["flutter","react","django","express",".net","spring boot","Cad","Solid works"];
    List<String> programming_languages = ["python","javascript","c","c++"];


    List<String> age = [
      "Age",
      "17",
      "18",
      "19",
      "20",
      "21",
      "22",
      "23",
      "24",
      "25",
      "26",
      "27",
      "28",
      "29",
      "30"
    ];
    List<String> gender = ["Male", "Female", "Others"];
    void _settingModalBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SizedBox(
              height: 150,
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text('Camera'),
                      onTap: () async {
                        Navigator.pop(context);
                        final pickedFile = await _picker.pickImage(source: ImageSource.camera, maxHeight: 500, maxWidth: 500, imageQuality: 50);
                        reg.uploadProfileImage(pickedFile!.path);


                      }),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      final pickedFile = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500, imageQuality: 50);
                      reg.uploadProfileImage(pickedFile!.path);

                    },
                  ),
                ],
              ),
            );
          });
    }

    return
      Scaffold(
        backgroundColor:Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: Image.asset('lib/assets/icons/goback.png').image,
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 100,
                    width: 115,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x260081ff),
                          offset: Offset(0, 3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                            image: Image.asset('lib/assets/icons/Filled Circle.png').image,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                              onTap: () {
                                _settingModalBottomSheet();
                              },
                              child: reg.profileImage.isEmpty
                                  ? ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 150,
                                    image: Image.asset('lib/assets/icons/Filled Circle.png').image,
                                  ))
                                  : ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.file(
                                  File(reg.profileImage),
                                  fit: BoxFit.cover,
                                  height: 120,
                                  width: 120,
                                ),
                              )),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "YOUR PICTURE * ",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(fillColor: Color(
                        0x190bd3f6), filled: true, border: InputBorder.none),
                    controller: reg.nameController,

                  ),
                ),
                Visibility(
                 visible: reg.nameError,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "*Name is Invalid.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(fillColor: Color(
                        0x190bd3f6), filled: true, border: InputBorder.none),
                    controller: reg.emailController,

                  ),
                ),
                Visibility(
                  visible: reg.emailError,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "*Email is Invalid.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(fillColor: Color(
                        0x190bd3f6), filled: true, border: InputBorder.none),
                    controller: reg.passwordController,

                  ),
                ),
                Visibility(
                  visible: reg.passwordError,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "*Password is Invalid.",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),


                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                   const Text(
                    "AGE",
                    style: TextStyle(
                      color: ConstantColors.text,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      color: ConstantColors.button,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                        alignment: AlignmentDirectional.centerStart,
                        //   borderRadius: BorderRadius.circular(12),
                        //   color: ConstantColors.mainColor,
                        // ),
                        buttonHeight: 20,
                        buttonWidth: 60,
                        itemHeight: 35,
                        dropdownMaxHeight: height * 0.60,
                        value: reg.age,
                        icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                        onChanged: (newValue) {
                          reg.updateAge(newValue!);
                        },
                        items: age.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(value,
                                    style: const TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.black,
                                      fontSize: 17,
                                    ))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Gender",
                    style: TextStyle(
                      color:ConstantColors.text,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      color:  ConstantColors.button,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                        alignment: AlignmentDirectional.centerStart,
                        //   borderRadius: BorderRadius.circular(12),
                        //   color: ConstantColors.mainColor,
                        // ),
                        buttonHeight: 20,
                        buttonWidth: 60,
                        itemHeight: 35,
                        dropdownMaxHeight: height * 0.60,
                        value: reg.gender,
                        icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                        onChanged: (newValue) {
                          reg.updateGender(newValue!);
                        },
                        items: gender.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(value,
                                    style: const TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.black,
                                      fontSize: 17,
                                    ))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Phone No",
                      style: TextStyle(
                        color:ConstantColors.text,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: ConstantColors.button,
                        filled: true,
                        border: InputBorder.none),
                    controller: reg.phoneController,

                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Interests",
                        style: TextStyle(
                          color: ConstantColors.text,
                          fontSize: 16,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    SizedBox(width: 5,),
                    Container(

                      height: 40,
                      width: width * 0.40,
                      decoration: BoxDecoration(
                        color:  ConstantColors.button,
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                          alignment: AlignmentDirectional.centerStart,
                          //   borderRadius: BorderRadius.circular(12),
                          //   color: ConstantColors.mainColor,
                          // ),
                          buttonHeight: 20,
                          buttonWidth: 60,
                          itemHeight: 35,
                          dropdownMaxHeight: height * 0.60,
                          value: reg.interests,
                          icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.white),
                          onChanged: (newValue) {
                            reg.updateinterests(newValue!);
                          },
                          items: interests.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(value,
                                      style: const TextStyle(
                                        fontFamily: "regular",
                                        color: Colors.black,
                                        fontSize: 17,
                                      ))
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
          ]
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Tech Stack",
                        style: TextStyle(
                          color: ConstantColors.text,
                          fontSize: 16,
                          fontFamily: "Sansation",
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  Container(
                    height: 40,
                    width: width * 0.40,
                    decoration: BoxDecoration(
                      color:  ConstantColors.button,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                        alignment: AlignmentDirectional.centerStart,
                        //   borderRadius: BorderRadius.circular(12),
                        //   color: ConstantColors.mainColor,
                        // ),
                        buttonHeight: 20,
                        buttonWidth: 60,
                        itemHeight: 35,
                        dropdownMaxHeight: height * 0.60,
                        value: reg.techstack,
                        icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                        onChanged: (newValue) {
                          reg.updatetechstack(newValue!);
                        },
                        items: techstack.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(value,
                                    style: const TextStyle(
                                      fontFamily: "regular",
                                      color: Colors.black,
                                      fontSize: 17,
                                    ))
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],),
                SizedBox(height: 10,),

                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Hobbies",
                      style: TextStyle(
                        color: ConstantColors.text,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: reg.hobbiesController,
                    decoration: const InputDecoration(
                        fillColor: ConstantColors.button,
                        filled: true,
                        border: InputBorder.none),

                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Burning Desire",
                      style: TextStyle(
                        color: ConstantColors.text,
                        fontSize: 16,
                        fontFamily: "Sansation",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: ConstantColors.button,
                        filled: true,
                        border: InputBorder.none),
                   controller: reg.burning_desireController,
                  ),
                ),


                const SizedBox(height: 20,),            Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "passion",
                      style: TextStyle(
                        color: ConstantColors.text,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 50,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        fillColor: ConstantColors.button,
                        filled: true,
                        border: InputBorder.none),
                    controller: reg.passionController,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [


                    Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          "Programming Languages",
                          style: TextStyle(
                            color: ConstantColors.text,
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        )),





                    SizedBox(width: 5,),
                    Container(
                      height: 40,
                      width: width * 0.40,
                      decoration: BoxDecoration(
                        color:  ConstantColors.button,
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          buttonPadding: const EdgeInsets.only(left: 8, right: 8),
                          alignment: AlignmentDirectional.centerStart,
                          //   borderRadius: BorderRadius.circular(12),
                          //   color: ConstantColors.mainColor,
                          // ),
                          buttonHeight: 20,
                          buttonWidth: 60,
                          itemHeight: 35,
                          dropdownMaxHeight: height * 0.60,
                          value: reg.programming_languages,
                          icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.white),
                          onChanged: (newValue) {
                            reg.updateprogramming_languages(newValue!);
                          },
                          items: programming_languages.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(value,
                                      style: const TextStyle(
                                        fontFamily: "regular",
                                        color: Colors.black,
                                        fontSize: 17,
                                      ))
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),


                  ]
                ),

                const SizedBox(
                  height: 10,
                ),

                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                      width: width,
                      height: 50,
                      padding:  const EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:  ConstantColors.button,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onPressed: () {
                          reg.register(context);
                          reg.reommendationsclub;


                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 71.13,
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                color: ConstantColors.text,
                                fontSize: 20,
                              ),
                            )),

                      )),
                ),
                const SizedBox(height: 20,)
              ])),
        ),

      );
  }
}
