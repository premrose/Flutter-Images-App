import 'package:flutter/material.dart';

void main() {
  runApp(const SearchWidget());
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          maxLines : 1,
          expands : false,
          enableSuggestions : true,
          decoration: const InputDecoration(
            hintText: "Search Products or Accounts",
            hintStyle: TextStyle(
              color: Color.fromRGBO(146, 146, 146, 0.7300000190734863),
              fontFamily: 'Roboto',
              fontSize: 16,
            ),
            contentPadding : EdgeInsets.all(8),
            disabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent)),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent,)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent,)),
            focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red,)),
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavouriteWidget(),),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: const MyStatefullWidget(),
    );
  }
}

class MyStatefullWidget extends StatefulWidget  {
  const MyStatefullWidget({Key? key}) : super(key: key);

  @override
  _MyStatefullWidgetState createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          children :const [

          ]
      ),
    );
  }

}