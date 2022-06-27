import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haber_uygulamasi/model/newsModel.dart' as newsModel;
import 'package:shimmer/shimmer.dart';

class News extends StatefulWidget {
  News({Key? key, required this.model}) : super(key: key);

  newsModel.Article model;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<newsModel.Article> articlelist = [];
  @override
  /*  void initState() {
    super.initState();
    ApiServices.getNews().then((value) {
      articlelist = value!;
    });
  } */
  String image =
      "https://www.huaweiailesi.com/wp-content/uploads/2021/07/share.png";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Haberler',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: 'Staatliches'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Hero(
                tag: widget.model.urlToImage ?? image,
                child: Image.network(
                  widget.model.urlToImage ?? image,
                  width: double.infinity,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Text(
                widget.model.title.toString(),
                style: GoogleFonts.playfairDisplay(
                    fontSize: 17, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: Text(widget.model.description!,
                    style: GoogleFonts.notoSansDisplay(fontSize: 14))),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(widget.model.author!),
            )
          ]),
        ));
  }
}
