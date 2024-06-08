// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:azkar/model/screen_model.dart';
import 'package:azkar/screen/section_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("أذكار المسلم",style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 29, 62, 83),
                  Color.fromARGB(255, 21, 67, 78),
                  Color.fromARGB(255, 27, 79, 82)
                ])),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
