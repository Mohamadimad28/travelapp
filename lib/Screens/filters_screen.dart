import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeNamed = '/filters';
  final saveFilters; //نوعها function
  //هي ال function الي مررتها عن طريق الكونستركتر عن طريق الراوت
final  currentFilters;//Map<String,bool>
  //اعطيتو كونستركتور عشان اقدر استدعيه عن طريق الراوت واعطيه قيممة الفينكشن
  FiltersScreen(this.saveFilters,this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _summer = false;
  bool _winter = false;
  bool _family = false;

  @override
  initState() {
    //عملنا اوفر رايد لل function initState
    //راح نوخد المتغيرات الاربعة ونغير قيميهم عن طريق القيم المستوردة من ال current
    //ونسند قيم جديدة للمتغيرات
    _summer = widget.currentFilters['summer'];
    _winter = widget.currentFilters['winter'];
    _family =widget.currentFilters['family'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, updateValue) {
    return SwitchListTile(
      //تساعد على اظهار محول او قاطع
      title: Text(title),
      value: currentValue,//حالة السويتش
      subtitle: Text(description),
      onChanged: updateValue,
      //updateValue اصلها فونيكشن
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الفتلرة"),
        actions: [
          IconButton(
            //اقون بوتون عشان لمه اضغط عليها تقوم بالحفظ
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectdFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };

              // //function  لمه اضغط عليها تتنفد
              // //راح نكتبها بالمين ونربطها مع بعض
              // final Map<String, bool> selectedFilters = {
              //   //نوعها   Map<String, bool>
              //   //ماب معينة قيمها المفروض تتساوى مع قيم المتغيرات الاربعة الي عرفناهم
              //   'صيف': _isInSummer,
              //   'شتاء': _isInWinter,
              //   'vegan': _isForFamily,
              // };
              widget.saveFilters(selectdFilters);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "هذه صفحة الفلترة",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            //تاخد كل المساحة المتبقية في الكلوم ةتتحكم فيه
            child: ListView(
              children: [
                buildSwitchListTile(
                  "الرحلات الصيفية",
                  "اظهار الرحلات في فصل الصيف فقط",
                  _summer,
                  (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "الرحلات الشتوية",
                  "اظهار الرحلات في فصل الشتاء فقط",
                  _winter,
                  (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  "للعائلات",
                  "اظهار الرحلات التي للعائلات فقط",
                  _family,
                  (newValue) {
                    setState(() {
                      _family = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
