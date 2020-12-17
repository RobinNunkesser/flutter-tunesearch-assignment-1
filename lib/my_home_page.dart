import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunesearch_assignment_1/search_term_dto.dart';
import 'package:tunesearchexample_mockcore/tunesearchexample_mockcore.dart';
import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var searchCommand = MockSearchTracksCommand();
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    searchCommand
        .execute(
        inDTO: SearchTermDTO(term: "Search term"))
        .then(success)
        .catchError((error) => failure(error));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  void success(List<TrackCollection> collections) {
    logger.i(collections.toString());
  }

  void failure(Exception error) {
    logger.e(error);
  }

}
