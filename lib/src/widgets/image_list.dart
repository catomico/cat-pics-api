import 'package:flutter/material.dart';
import 'package:pics_api/src/models/image_model.dart';
import '../../src/models/image_model.dart';

// The image list holds data that changes, i.e., add to list, but the parent widget of the app state is responsible for the changing data, not the image list itself, and won't re-render itself.
class ImageList extends StatelessWidget {
  // instance variable -> a list that will contain images
  // final is like var but var can change later, final is immutable.
  // makes sense to use final inside of a stateless widget
  final List<ImageModel> images;

  // constructor
  // this. assumes there is an stance variable
  ImageList(this.images);
// when the item builder function gets called, the a widget representing an image from the ImageList(this.image) is returned.
// but the are not provided directly to the builder, below. Instead they are refered by the index

  Widget build(BuildContext context) {
    return ListView.builder(
      // number of images to show = all of them
      itemCount: images.length,
      itemBuilder: (context, int index) {
        // return a text element that references the ImageList or imaage[look up the index] and pull out the .url
        return buildImageStyle(images[index]);
        // Container(
        // there can be too much here so take it out to buildImageStyles method below.
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.pink[300]!),
        // ),
        // padding: EdgeInsets.all(20.0),
        // margin: EdgeInsets.all(20.0),
        // child: Image.network(images[index].url),
        // );
      },
    );
  }
}

// pass in the image Modoel instance add some style, but don't go look for the list of images here: Image.network(images[index].url)
Widget buildImageStyle(ImageModel image) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.pink[300]!),
    ),
    padding: EdgeInsets.all(20.0),
    margin: EdgeInsets.all(20.0),
    // to show something inside a conatainer, asign it to the containers child property, but the container expects to only recieve one widgert, so to show two things they must be wrapped in a
    child: Column(
      // the children list will only contain <Widget> type elements
      children: <Widget>[
        Padding(
          child: Image.network(image.url),
          padding: EdgeInsets.only(bottom: (10.0)),
        ),
        Text(image.title),
      ],
    ),
  );
}
