import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

void main() {
  runApp( CustomAppBar(title: ''));
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  late final String title;

  CustomAppBar({Key? key, required this.title, }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45);

  @override
  initState(){ title=''; }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) =>
          Transform.rotate(
            angle: 0,
            child: IconButton(
                icon: const Icon(Icons.notes_rounded),
                // color: Colors.black,
                iconSize: 30.0,
                onPressed: () => Scaffold.of(context).openDrawer()
            ),
          ),
      ),
      leadingWidth: 50,
      toolbarHeight: 45,
      title: Text(widget.title),
      centerTitle: true,
      titleSpacing: 0,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: const BorderSide(width: 1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CartWidget(),),
            // );
          },
        ),
      ],
    );
  }
}

