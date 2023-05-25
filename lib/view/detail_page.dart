import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final url, title, description, publishedAt, author, urlToImage;

  const DetailPage({
    super.key,
    this.title,
    this.url,
    this.description,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Detail",
            style: TextStyle(color: Colors.black),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            urlToImage != null
                ? Image.network(urlToImage)
                : Container(
                    margin: const EdgeInsets.all(20),
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey),
                  ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$title',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$publishedAt',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  Text(
                    '$description',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  Text(
                    '$author',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '$url',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
