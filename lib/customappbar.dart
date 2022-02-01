import 'package:flutter/material.dart';

void main() {
  runApp( CustomAppBar(title: ''));
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  String? title;

  CustomAppBar({Key? key, required this.title, }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(45);

  initState(){ title=''; }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 55,
      title: Text(title!,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor
          )
      ),
      centerTitle: false,
      titleSpacing: 12,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        // side: const BorderSide(width: 1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
      ),
      actions: <Widget>[
        Builder(builder: (context) =>
            Transform.rotate(
              angle: 0,
              child: IconButton(
                  icon: const Icon(Icons.notes_rounded),
                  // color: Colors.black,
                  iconSize: 27.0,
                  onPressed: () => Scaffold.of(context).openEndDrawer()
              ),
            ),
        ),
        const SizedBox(width: 3)
      ],
    );
  }
}

