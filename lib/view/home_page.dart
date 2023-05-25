import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/view/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiUrl =
      "https://newsapi.org/v2/everything?q=tesla&apiKey=11318d4ee7154e39a3bfea0c622296f3";

  List _get = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _get = data['articles'];
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'News App',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  focusColor: Colors.amber,
                  leading: SizedBox(
                    width: 100,
                    child: _get[index]['urlToImage'] != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              _get[index]['urlToImage'],
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Center(
                            child: Text("no-image"),
                          ),
                  ),
                  title: Text(
                    '${_get[index]['title']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    '${_get[index]['description']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => DetailPage(
                          url: _get[index]['url'],
                          title: _get[index]['title'],
                          description: _get[index]['description'],
                          urlToImage: _get[index]['urlToImage'],
                          author: _get[index]['author'],
                          publishedAt: _get[index]['publishedAt'],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ),
    );
  }
}
