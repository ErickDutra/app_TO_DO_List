import 'package:flutter/material.dart';
import 'package:to_do_list/components/tasks_day.dart';
import 'package:to_do_list/components/tasks_month.dart';
import 'package:to_do_list/components/tasks_week.dart';
import 'package:to_do_list/components/tasks_year.dart';
import 'package:to_do_list/main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Container(
                child: Center(
                  child: Text("To do List"),
                ),
              )),
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
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(Icons.calendar_view_day)),
                Text("- Day"),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TasksDay()));
            },
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(Icons.calendar_view_week)),
                Text("- Week"),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TasksWeek()));
            },
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(Icons.calendar_view_month)),
                Text("- Month"),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) =>TasksMonth()));
            },
          ),
          Divider(color: Colors.black38),
          ListTile(
            title: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: Icon(Icons.calendar_today)),
                Text("- Year"),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TasksYear()));
            },
          ),
          Divider(color: Colors.black38),
        ],
      ),
    );
  }
}

