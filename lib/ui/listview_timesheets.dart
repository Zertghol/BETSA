import 'package:barnett_electric_timesheet_app/model/timesheet.dart';
import 'package:barnett_electric_timesheet_app/util/database_helper.dart';
import 'package:flutter/material.dart';
import 'timesheet_screen.dart';

class ListViewTimeSheet extends StatefulWidget {
  @override
  _ListViewTimeSheetState createState() => new _ListViewTimeSheetState();
}

class _ListViewTimeSheetState extends State<ListViewTimeSheet> {
  List<TimeSheet> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllTimeSheets().then((tss) {
      setState(() {
        tss.forEach((timesheet) {
          items.add(TimeSheet.fromMap(timesheet));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Sheets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Sheets'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(15.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      title: Text(
                        '${items[position].jobNo}',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].week}',
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 15.0,
                          ),
                          IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => _deleteTimeSheet(context, items[position], position)),
                        ],
                      ),
                      onTap: () => _navigateToTimeSheet(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewTimeSheet(context),
        ),
      ),
    );
  }

  void _deleteTimeSheet(BuildContext context, TimeSheet ts, int position) async {
    db.deleteTimeSheet(ts.jobNo, ts.week).then((tss) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToTimeSheet(BuildContext context, TimeSheet ts) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TimeSheetScreen(ts)),
    );

    print(1);
    print(result);

    if (result == 'update') {
      db.getAllTimeSheets().then((tss) {
        setState(() {
          items.clear();
          tss.forEach((ts) {
            items.add(TimeSheet.fromMap(ts));
          });
        });
      });
    }
  }

  void _createNewTimeSheet(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TimeSheetScreen(TimeSheet('', 0,'','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0))),
    );

    print(2);
    print(result);
    if (result == 'save') {
      db.getAllTimeSheets().then((tss) {
        setState(() {
          items.clear();
          tss.forEach((ts) {
            items.add(TimeSheet.fromMap(ts));
          });
        });
      });
    }
  }
}