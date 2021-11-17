import 'package:flutter/material.dart';
import 'article_model.dart';
import 'article_view.dart';
import 'category_model.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CategoryModel> categories;
  late List<ArticleModel> articles;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getArticles();
  }

  void getArticles() async {
    articles = await loadArticles();
    setState(() => {
      _loading = false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: const <Widget>[
            Text("News App")
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      name: categories[index].categoryName,
                    );
                  }),
            ),
            const SizedBox(height: 10),
            Container(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleTile(
                      urlToImage: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      content: articles[index].content,
                      url: articles[index].url,
                      author: articles[index].author,
                  );
                }
              )
            )
          ]
        )
      )
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String image;
  final String name;

  const CategoryTile({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 14),
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              height: 60,
              width: 120,
              fit: BoxFit.cover,
            )
        ])
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String author, title, description, url, content, urlToImage;

  const ArticleTile({required this.urlToImage, required this.author, required this.title, required this.description, required this.url, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ArticleView(
                postUrl: url,
              )
          ));
        },
    child: Container(
      child: Column(
        children: <Widget>[
          Image.network(
              urlToImage,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
          ),
          Text(
            title,
            maxLines: 2,
            style: const TextStyle(
              color: Color.fromRGBO(10, 64, 191, 1),
              fontSize: 20),
            ),
          const SizedBox(height: 5),
          Text(description),
          const SizedBox(height: 5),
        ]
      )
    )
    );
  }
}