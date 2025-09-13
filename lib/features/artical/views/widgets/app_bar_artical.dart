import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/helper/my_navgitor.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../home/data/models/models_top_headline/Artical_Top_Headline.dart';
import '../../../../core/database/article_db_helper.dart'; // استدعاء الهيلبر

class AppBarArtical extends StatefulWidget {
  const AppBarArtical({super.key, required this.model});
  final ArticlesTopheadline model;

  @override
  State<AppBarArtical> createState() => _AppBarArticalState();
}
class _AppBarArticalState extends State<AppBarArtical> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _checkIfSaved();
  }

  Future<void> _checkIfSaved() async {
    final articles = await ArticleDBHelper.getArticles();
    final exists = articles.any((a) => a['title'] == widget.model.title);
    if (mounted) {
      setState(() {
        isSaved = exists;
      });
    }
  }

  Future<void> _toggleSave() async {
    if (isSaved) {
      await ArticleDBHelper.deleteArticle(widget.model.title ?? '');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Article removed",
          style: TextStyle(color: Colors.black),)
          ,backgroundColor:Colors.red,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      await ArticleDBHelper.insertArticle(widget.model);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Article saved"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }

    if (mounted) {
      setState(() {
        isSaved = !isSaved;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      decoration: const BoxDecoration(
        color: AppColors.Grey1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                MyNavigator.goBack(context);
              },
              icon: SvgPicture.asset(AppIcons.arrowLeft),
            ),
            const Spacer(),
            IconButton(
              onPressed: _toggleSave,
              icon: SvgPicture.asset(
                isSaved ? AppIcons.ssaveicon2 : AppIcons.saveicon,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.IconWrapper),
            ),
          ],
        ),
      ),
    );
  }
}
