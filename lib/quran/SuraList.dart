import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../MyTheme.dart';
import 'SuraListEntry.dart';
class SuraList extends StatelessWidget {
  SuraList({Key? key}) : super(key: key);


  final List<String> suraNames = ["الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس", "هود"
    , "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه", "الأنبياء", "الحج", "المؤمنون"
    , "النّور", "الفرقان", "الشعراء", "النّمل", "القصص", "العنكبوت", "الرّوم", "لقمان", "السجدة", "الأحزاب", "سبأ"
    , "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر", "فصّلت", "الشورى", "الزخرف", "الدّخان", "الجاثية", "الأحقاف"
    , "محمد", "الفتح", "الحجرات", "ق", "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة"
    , "الحشر", "الممتحنة", "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج"
    , "نوح", "الجن", "المزّمّل", "المدّثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس", "التكوير", "الإنفطار"
    , "المطفّفين", "الإنشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد", "الشمس", "الليل", "الضحى", "الشرح"
    , "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات", "القارعة", "التكاثر", "العصر",
    "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر", "المسد", "الإخلاص", "الفلق", "الناس"];

  final List<int> suraSizes = [7,286,200,176,120,165,206,75,129,109,124,112,43,53,100,128,
    112,112,98,135,110,78,118,64,79,228,93,89,69,61,34,31,75,54,44,83,182,90,76,85,54,
    54,90,60,37,34,38,29,19,45,60,50,62,56,79,96,29,22,25,13,14,11,12,18,13,12,30,52,
    52,45,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,8,19,
    5,8,8,11,11,8,3,9,5,4,7,3,6,3,5,4,5,6];

  @override
  Widget build(BuildContext context) {
    final borderSide = Theme
        .of(context)
        .brightness == Brightness.dark ?
    MyThemeData.darkThemeBorderSide : MyThemeData.lightThemeBorderSide;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Expanded(
        flex: 3,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          top: borderSide,
                          bottom: borderSide,
                          right: borderSide,
                        )
                      ),
                      child: Text(AppLocalizations.of(context)!.numberofversus)
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          top: borderSide,
                          bottom: borderSide,
                        )
                      ),
                      child: Text(AppLocalizations.of(context)!.surahname)
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 8/1,
                ),
                itemCount: suraSizes.length,
                itemBuilder: (context, index) {
                  return SuraListEntry(
                    suraNumber: index + 1,
                    suraName: suraNames[index],
                    suraSize: suraSizes[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}