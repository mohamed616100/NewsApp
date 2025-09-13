import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/core/widgets/Buttonlarge.dart';
import '../../../../core/database/article_db_helper.dart';
import 'item_view_bookmark.dart';
class ItemListviewBookmark extends StatefulWidget {
  const ItemListviewBookmark({super.key});
  @override
  State<ItemListviewBookmark> createState() => _ItemListviewBookmarkState();
}
class _ItemListviewBookmarkState extends State<ItemListviewBookmark> {
  List<Map<String, dynamic>> savedArticles = [];

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    final data = await ArticleDBHelper.getArticles();
    if (!mounted) return;
    setState(() {
      savedArticles = data;
    });
  }

  Future<bool> _confirmDelete(Map<String, dynamic> article) async {
    final ctx = context;
    final result = await showDialog<bool>(
      context: ctx,
      builder: (dialogCtx) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Container(
          width: double.infinity,
          height: 294.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x25000000),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Sure you want to delete this item?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ItemViewBookmark(article: article,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  children: [
                    Buttonlarge(
                      text: 'Yes,Delete',
                      onPressed: () {
                        Navigator.pop(dialogCtx, true);
                      },
                      width: 157.w,
                      height: 56.h,
                    ),
                    SizedBox(width: 16.w),
                    Buttonlarge(
                      text: 'No',
                      onPressed: () {
                        Navigator.pop(dialogCtx, false);
                      },
                      width: 75.w,
                      height: 56.h,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: savedArticles.length,
        itemBuilder: (context, index) {
          final article = savedArticles[index];

          return Dismissible(
            key: Key(article['title'] ?? index.toString()),
            direction: DismissDirection.startToEnd,
            confirmDismiss: (direction) async {
              final shouldDelete = await _confirmDelete(article);
              if (shouldDelete) {
                await ArticleDBHelper.deleteArticle(article['title']);
                await loadArticles();
                if (!mounted) return false;
              }
              return shouldDelete;
            },
            child: ItemViewBookmark(article: article),
          );
        },
      ),
    );
  }
}
