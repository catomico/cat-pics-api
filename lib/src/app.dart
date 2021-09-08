import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics_api/src/widgets/image_list.dart';
import '/src/models/image_model.dart';
import 'dart:convert';

class AppWidget extends StatefulWidget {
  // @override
  State<StatefulWidget> createState() {
    return AppWidgetState();
  }
}

class AppWidgetState extends State<AppWidget> {
  // this is an instance variable
  int counter = 0;
  String catSpeak = 'mew';

  // make a list data type to hold the multiple instances of image model that the user creates when pressing the button.
  List<ImageModel> images = [];

  // This method ccould go inside the below widget, but to keep things cleann it is here. Type is void since, it returns nothing, it is only called.
  void fetchImage() async {
    counter++;
    // response variable is not only the json data it is info about the data and has the json data nested inside
    final response = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    // Creat a new model image instance,
    // take the json out, and construct a new image model -> imageModel.
    // so call the named constuctor from json -> fromJson
    // pass in json from the response object, -> (response
    // which is availeble on response body -> .body)
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    //adds to the list - this will cause the app to re-render, therefore call setState
    setState(() {
      images.add(imageModel);
    });
  }

  // defines a method that returns, or 'builds', the widgets that my custom AppWidget will show
  // @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Cat Pics App'),
        ),
        body: ImageList(images),
        // Column(
        //   children: [
        //     Align(
        //       alignment: Alignment.topCenter,
        //       child: Text(
        //         'How many meows?' + '\n$counter ' + '$catSpeak',
        //         style: TextStyle(fontSize: 20),
        //       ),
        //     ),
        //     ImageList(images)
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          hoverColor: Colors.pink[300],
          child: Icon(Icons.pets_rounded),
          // If onpressed is only used to call another function, then use this shorthand. if fetchImage were fetchImage() it would run each time the build method were invoked
          // onPressed: fetchImage,
          onPressed: () {
            setState(() {
              fetchImage();
              counter += 1;
              catSpeak = 'mews';
            });
            print('meow?');
          },
        ),
      ),
    );
  }
}
