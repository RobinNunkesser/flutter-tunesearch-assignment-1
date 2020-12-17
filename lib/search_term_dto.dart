import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

class SearchTermDTO implements SearchTerm {
  @override
  String term;

  SearchTermDTO({this.term});
}
