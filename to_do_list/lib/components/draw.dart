import 'package:flutter/material.dart';

import 'package:to_do_list/main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('Todo List'),
                ), 
              ),
            ),
              ListTile(
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(Icons.home)),
                Text("- Home"),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          Divider(color: Colors.black38),
  
        ],
      ),
    );
  }
}

