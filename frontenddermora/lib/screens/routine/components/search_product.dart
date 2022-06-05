// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontenddermora/screens/routine/components/search_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/api_routine.dart';
import '../../../util/styles.dart';
import '../models/products.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final String urlImage;

  const Book({
    required this.id,
    required this.author,
    required this.title,
    required this.urlImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'urlImage': urlImage,
      };
}

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, required this.label, required this.addItem})
      : super(key: key);

  String label;
  void Function(dynamic product, String label) addItem;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Products> products = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    // final products = await ProductsApi.getAllProducts();
    // setState(() => this.products = products);
  }

  final allBooks = <Book>[
    Book(
      id: 1,
      author: 'Ardi Evans',
      title: 'Modern Buildings',
      urlImage:
          'https://images.unsplash.com/photo-1615347497551-277d6616b959?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=692&q=80',
    ),
    Book(
      id: 2,
      author: 'Lerone Pieters',
      title: 'Busy City Life',
      urlImage:
          'https://images.unsplash.com/photo-1615346340977-cf7f5a8f3059?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    ),
    Book(
      id: 3,
      author: 'Uliana Kopanytsia',
      title: 'Sweets and Cakes',
      urlImage:
          'https://images.unsplash.com/photo-1615351897596-d3a9fffb5797?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=665&q=80',
    ),
    Book(
      id: 4,
      author: 'Riccardo Andolfo',
      title: 'Vast Deserts',
      urlImage:
          'https://images.unsplash.com/photo-1615333619365-a44d7e655661?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80',
    ),
    Book(
      id: 5,
      author: 'Miguel Arguibide',
      title: 'Parkour',
      urlImage:
          'https://images.unsplash.com/photo-1615286505008-cbca9896192f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=962&q=80',
    ),
    Book(
      id: 6,
      author: 'Tran Mau Tri Tam',
      title: 'Cute Kitties',
      urlImage:
          'https://images.unsplash.com/photo-1615369794017-f65e6f0c0393?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ),
    Book(
      id: 7,
      author: 'Josh Hemsley',
      title: 'Beahces',
      urlImage:
          'https://images.unsplash.com/photo-1615357633073-a7b67638dedb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80',
    ),
    Book(
      id: 8,
      author: 'Carlos Mesa',
      title: 'Tides',
      urlImage:
          'https://images.unsplash.com/photo-1615185054269-363482a365ad?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=809&q=80',
    ),
    Book(
      id: 9,
      author: 'Kellen Riggin',
      title: 'Magnificent Forests',
      urlImage:
          'https://images.unsplash.com/photo-1615331224984-281512856592?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ),
    Book(
        id: 10,
        author: 'Navi Photography',
        title: 'Butterflies',
        urlImage:
            'https://images.unsplash.com/photo-1615300236079-4bdb43bd9a9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xF04967FF),
                Color(0xFF8CC1F7),
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: buildSearch(),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(70))),
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: allBooks.length,
                      itemBuilder: (context, index) {
                        final books = allBooks[index];

                        return buildProduct(books);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onClicked: searchProduct,
      );

  Future searchProduct(String query) async => debounce(() async {
        // print(query);
        // final products = await ProductsApi.getProducts(query);

        // if (!mounted) return;

        // setState(() {
        //   this.query = query;
        //   this.products = products;
        // });
      });

  Widget buildProduct(Book product) => ListTile(
        leading: Image.network(
          product.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        trailing: InkWell(
          onTap: () {
            widget.addItem(
                {"image": "assets/images/cleanser.png", "label": "Amirah"},
                widget.label.trim());
          },
          child: Text("Add",
              style: GoogleFonts.poppins(
                color: klightGrey.withOpacity(0.7),
                decoration: TextDecoration.underline,
                fontSize: 12.0,
              )),
        ),
        title: Text(product.title),
        subtitle: Text(product.author),
      );
}
