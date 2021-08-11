



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/sura_link.dart';
import 'package:islami/utility/get_file_data.dart';

class SuraList extends StatefulWidget {
  const SuraList({Key? key}) : super(key: key);

  static const borderSide = BorderSide(
    color: Color(0xFFB7935F),
    width: 3.0,
  );

  @override
  State<SuraList> createState() => _SuraListState();
}

class _SuraListState extends State<SuraList> {

  late Future<List<Widget>> futureSuraList;

  Future<List<Widget>> buildSuraList() async {


    final List<Widget> suraList = [
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
              top: SuraList.borderSide,
              bottom: SuraList.borderSide,
              right: SuraList.borderSide,
            )
        ),
        child: Text("عدد الآيات"),
      ),
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            top: SuraList.borderSide,
            bottom: SuraList.borderSide,
          )
        ),
        child: Text("اسم السورة")
      )
    ];

    String data = await getFileData("assets/sura_names.txt");
    List<String> suras = data.split(",");

    data = await getFileData("assets/sura_size.txt");
    List<String> suraSize = data.split(" ");


    suras.map((sura) {
      return sura.replaceAll('"', '');
    }).toList().asMap().forEach((index, sura) {
      suraList.add(
        SuraLink(
          suraNumber: index + 1,
          decoration: BoxDecoration(
              border: Border(
                right: SuraList.borderSide,
              )
          ),
          text: suraSize[index], suraName: sura,
        )
      );

      suraList.add(
        SuraLink(
          suraNumber: index + 1,
          text: sura, suraName: sura,
        )
      );
    });

    return suraList;
  }

  @override
  void initState() {
    super.initState();
    futureSuraList = buildSuraList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: futureSuraList,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4/1,
              children: snapshot.data!.toList(),
            ),
          );
        }
        else if (snapshot.hasError){
          return Text("${snapshot.error}");
        }

        return const CircularProgressIndicator();
      }
    );
  }
}
