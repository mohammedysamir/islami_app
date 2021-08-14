import 'package:flutter/material.dart';
import 'package:islami/Hadeth/HadethLink.dart';
import 'package:islami/utility/get_file_data.dart';

class HadethList extends StatefulWidget {
  const HadethList({Key? key}) : super(key: key);

  static const borderSide = BorderSide(
    color: Color(0xFFB7935F),
    width: 3.0,
  );

  @override
  State<HadethList> createState() => _HadethListState();
}

class _HadethListState extends State<HadethList> {
  late Future<List<Widget>> futureSuraList;

  Future<List<Widget>> buildSuraList() async {
    final List<Widget> hadethList = [
      Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
            top: HadethList.borderSide,
            bottom: HadethList.borderSide,
          )),
          child: Text("اسم الحديث"))
    ];

    String data = await getFileData("assets/ahadeth_names.txt");
    List<String> ahadeath = data.split("#");

    ahadeath
        .map((hadeth) {
          return hadeth.replaceAll(' ', '');
        })
        .toList()
        .asMap()
        .forEach((index, hadeth) {
          hadethList.add(HadethLink(
            hadethNumber: index + 1,
            decoration: BoxDecoration(
                border: Border(
              right: HadethList.borderSide,
            )),
          ));

          hadethList.add(HadethLink(
            hadethNumber: index + 1,
            hadethName: hadeth,
          ));
        });

    return hadethList;
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
          if (snapshot.hasData) {
            return Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 6/1,
                children: snapshot.data!.toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const CircularProgressIndicator();
        });
  }
}
