import 'package:flutter/material.dart';
import 'package:find_places/views/result_view.dart';
import 'package:find_places/widgets/search_view_header.dart';

class SearchView extends StatelessWidget {
  SearchView({Key key}) : super(key: key);
  final TextEditingController _placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchViewHeader(),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _placeController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          InkWell(
            onTap: () {
              if (_placeController.text.isNotEmpty)
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultView(
                      placeToFind: _placeController.text,
                    ),
                  ),
                );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(5),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
