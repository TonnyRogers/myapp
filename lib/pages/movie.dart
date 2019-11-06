import '../models/movie.dart';
import '../widgets/circular_clipper.dart';
import '../widgets/content_scrool.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage({this.movie});

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(
                        blurRadius: 20.0,
                      ),
                      child: Image(
                        height: 400.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.movie.imageUrl),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black),
                  Text('App'),
                  /*Image(
                    image: AssetImage('src/assets/netflix_logo.png'),
                    height: 60.0,
                    width: 150.0,
                  ),*/
                  IconButton(
                      onPressed: () => print('Add to favorites'),
                      icon: Icon(Icons.favorite_border),
                      iconSize: 30.0,
                      color: Colors.black),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () => print(' Add to my list'),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 20.0,
                child: IconButton(
                  onPressed: () => print(' Share it'),
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Ano',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'País',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie.country.toString(),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Duração',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0,),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                      child: Text(
                      widget.movie.description.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Cenas',
            imageHeight: 200.0,
            imageWidth: 250.0,
          )
        ],
      ),
    );
  }
}
