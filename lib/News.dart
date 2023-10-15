import 'package:flutter/material.dart';


class NewsItem {
  final String datetime;
  final String title;
  final String image;
  final String content;

  NewsItem(this.datetime, this.title, this.image, this.content);
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Center(
          child: CardWidgetList(),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final NewsItem newsItem;

  CardWidget(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.network(newsItem.image),
          ListTile(
            title: Text(newsItem.title),
            subtitle: Text(newsItem.datetime),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(newsItem.content),
          ),
          ButtonBar(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Xử lý sự kiện Bookmark
                },
                child: Text('Bookmark'),
              ),
              TextButton(
                onPressed: () {
                  // Xử lý sự kiện Like
                },
                child: Text('Like'),
              ),
              TextButton(
                onPressed: () {
                  // Xử lý sự kiện Share
                },
                child: Text('Share'),
              ),
            ],
          ),
        ],
      ),

    );
  }
}

class CardWidgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<NewsItem> newsItems = [
      NewsItem(
        '2023-10-12 08:00',
        'Tiêu đề bản tin 1',
        'https://thebrooknetwork.org/wp-content/uploads/2017/11/GoodNews.jpg',
        'Nội dung bản tin 1...',
      ),
      NewsItem(
        '2023-10-13 09:00',
        'Tiêu đề bản tin 2',
        'https://media.boingboing.net/wp-content/uploads/2018/04/newspaper.jpg',
        'Nội dung bản tin 2...',
      ),
      NewsItem(
        '2023-10-14 10:00',
        'Tiêu đề bản tin 3',
        'https://3.bp.blogspot.com/-9pR0iRDLnxA/Vs7_dn-xdAI/AAAAAAAACFk/zlW92uxNNqg/s1600/London%2BNews.jpg',
        'Nội dung bản tin 3...',
      ),
      NewsItem(
        '2023-10-15 11:00',
        'Tiêu đề bản tin 4',
        'https://kchanews.com/wp-content/uploads/2014/09/bigstock-Breaking-News-Screen-36237841.jpg',
        'Nội dung bản tin 4...',
      ),
    ];

    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        return CardWidget(newsItems[index]);
      },
    );
  }
}
