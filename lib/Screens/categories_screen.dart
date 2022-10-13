import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //راح نستخدمها عشان نعطي ونحدد حجم كل تصنيف على الشاشة وبشكل تلقائي راح يحط عقد ما بقدر من التصنيفات
          maxCrossAxisExtent: 200,
          //هيك بحدد كام عمود راح يتم عرضو على حجم شاشة كل موبايل
          childAspectRatio: 7 / 8,
          // بنحدد عرض وارتفاع كل عنصر عشكل نسبة وتناسب هيك بكون الارتفاع ضعف العرض
          mainAxisSpacing: 10,
          //فراغات بين العناصر بشكل افقي
          crossAxisSpacing: 10, // بشكل عمودي
        ),
        children: Categories_data.map((categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.imageUrl))
            .toList(),

    );
  }
}
