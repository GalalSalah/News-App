
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:news_app/moduls/web_view/web_view.dart';



Widget defaultFormField(
    {
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  required Function? onChange,
  IconData? suffix,
  Function? suffixPressed,
  bool isPassword = false,
  bool isClicked = true,
  Function? validate,
  required String label,
  required IconData prefix,
}) {
  return InkWell(
    onTap: () {
      onTap!();
    },
    child: TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Value is missing";
        }
        return null;
      },
      enabled: isClicked,
      decoration: InputDecoration(
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          labelText: label,
          prefixIcon: Icon(prefix),
          border: const OutlineInputBorder()),
    ),
  );
}



Widget buildArticleItems(article, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(
            article['url'],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: article['urlToImage'] == null
                          ? const NetworkImage(
                              'https://m.media-amazon.com/images/I/71JN-6UNnAL.jpg')
                          : NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget articleBuilder(list, BuildContext context,{isSearch = false}) => BuildCondition(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItems(list[index], context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[400],
          ),
        ),
        itemCount: list.length,
      ),
      fallback:(context) => isSearch ? Container() :   const Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
