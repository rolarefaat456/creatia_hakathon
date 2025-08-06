import 'package:flutter/material.dart';
import 'package:hacathon_app/components/utils/app_colors.dart';
import 'package:hacathon_app/components/utils/app_text.dart';
import 'package:hacathon_app/generated/l10n.dart';
/// ويدجت البحث - لما المستخدم يضغط عليها، تفتح شاشة البحث
class Search extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTap: () {
          // فتح شاشة البحث عند الضغط على الكونتينر
          showSearch(
            context: context,
            delegate: mySearch()
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 // نص الإرشاد داخل حقل البحث
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    S.of(context).search_hint,
                    style: AppText.style12w400(context).copyWith(fontFamily: 'Tajawal', color: AppColors.Grey)
                  ),
                ),
                // أيقونة البحث
                Icon(Icons.search_sharp, size: 20, color: Colors.black,),
              ],
            ),
          ),
    );
  }
}
// delegate مخصص للبحث باستخدام SearchDelegate
class mySearch extends SearchDelegate
{

    List<String> allItems = ['flutter', 'Ux/Ui', 'web', 'cybar security'];
    /// زر المسح (يظهر يمين حقل البحث)

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // يمسح النص اللي المستخدم كتبه
          query = '';
        },
      )
    ];
  }
/// زر العودة للخلف (يظهر على يسار الشاشة)
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return BackButton();// يرجع للخلف عند الضغط
  }
/// النتيجة الفعلية للبحث (بعد ما المستخدم يكتب ويضغط Enter أو يختار اقتراح)
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // تصفية العناصر حسب الكلمة المكتوبة
    final results = allItems.where(
      (item) => item.toLowerCase().contains(query.toLowerCase())
    ).toList();
// عرض النتائج
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(results[index]),
      ),
    );
  }
/// الاقتراحات اللي تظهر أثناء الكتابة
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // تصفية العناصر أثناء ما المستخدم بيكتب
    final suggestions = allItems.where(
      (item) => item.toLowerCase().contains(query.toLowerCase())
    ).toList();
// عرض الاقتراحات
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () {
          // لما المستخدم يضغط على اقتراح، نعرضه كنتيجة
          query = suggestions[index];
          showResults(context);
        },
      ),
    );
  }
}