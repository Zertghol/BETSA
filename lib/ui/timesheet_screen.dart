import 'package:barnett_electric_timesheet_app/model/timesheet.dart';
import 'package:barnett_electric_timesheet_app/util/database_helper.dart';
import 'package:flutter/material.dart';

class TimeSheetScreen extends StatefulWidget {
  final TimeSheet ts;
  TimeSheetScreen(this.ts);

  @override
  State<StatefulWidget> createState() => new _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> {
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _nameController;
  TextEditingController _jobNoController;
  TextEditingController _jobNameController;
  TextEditingController _weekController;
  TextEditingController _monHoursController;
  TextEditingController _monOTController;
  TextEditingController _monDTController;
  TextEditingController _wedHoursController;
  TextEditingController _wedOTController;
  TextEditingController _wedDTController;
  TextEditingController _tueHoursController;
  TextEditingController _tueOTController;
  TextEditingController _tueDTController;
  TextEditingController _thurHoursController;
  TextEditingController _thurOTController;
  TextEditingController _thurDTController;
  TextEditingController _friHoursController;
  TextEditingController _friOTController;
  TextEditingController _friDTController;
  TextEditingController _satHoursController;
  TextEditingController _satOTController;
  TextEditingController _satDTController;
  TextEditingController _sunHoursController;
  TextEditingController _sunOTController;
  TextEditingController _sunDTController;

  @override
  void initState() {

    super.initState();


    _nameController = new TextEditingController(text: widget.ts.name);
    _jobNoController = new TextEditingController(text: widget.ts.jobNo.toString());
    _jobNameController = new TextEditingController(text: widget.ts.jobName);
    _weekController = new TextEditingController(text: widget.ts.week);
    _monHoursController = new TextEditingController(text: widget.ts.monHours.toString());
    _monOTController = new TextEditingController(text: widget.ts.monOT.toString());
    _monDTController = new TextEditingController(text: widget.ts.monDT.toString());
    _wedHoursController = new TextEditingController(text: widget.ts.wedHours.toString());
    _wedOTController = new TextEditingController(text: widget.ts.wedOT.toString());
    _wedDTController = new TextEditingController(text: widget.ts.wedDT.toString());
    _tueHoursController = new TextEditingController(text: widget.ts.tueHours.toString());
    _tueOTController = new TextEditingController(text: widget.ts.tueOT.toString());
    _tueDTController = new TextEditingController(text: widget.ts.tueDT.toString());
    _thurHoursController = new TextEditingController(text: widget.ts.thurHours.toString());
    _thurOTController = new TextEditingController(text: widget.ts.thurOT.toString());
    _thurDTController = new TextEditingController(text: widget.ts.thurDT.toString());
    _friHoursController = new TextEditingController(text: widget.ts.friHours.toString());
    _friOTController = new TextEditingController(text: widget.ts.friOT.toString());
    _friDTController = new TextEditingController(text: widget.ts.friDT.toString());
    _satHoursController = new TextEditingController(text: widget.ts.satHours.toString());
    _satOTController = new TextEditingController(text: widget.ts.satOT.toString());
    _satDTController = new TextEditingController(text: widget.ts.satDT.toString());
    _sunHoursController = new TextEditingController(text: widget.ts.sunHours.toString());
    _sunOTController = new TextEditingController(text: widget.ts.sunOT.toString());
    _sunDTController = new TextEditingController(text: widget.ts.sunDT.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Time Sheet')),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job No.',
                    ),
                    controller: _jobNoController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Job Name',
                    ),

                    controller: _jobNameController,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                    ),
                    controller: _weekController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              delegate: SliverChildListDelegate(
                [
                  Text("  "),
                  Center(
                    child: Text("Hours Worked", textAlign: TextAlign.center),
                  ),
                  Center(
                    child: Text("1.5", textAlign: TextAlign.center),
                  ),
                  Center(
                    child: Text("2", textAlign: TextAlign.center),
                  ),
                  Text("Monday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _monHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _monOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _monDTController,
                  ),
                  Text("Tuesday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _tueHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _tueOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _tueDTController,
                  ),
                  Text("Wednesday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _wedHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _wedOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _wedDTController,
                  ),
                  Text("Thursday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _thurHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _thurOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _thurDTController,
                  ),
                  Text("Friday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _friHoursController,

                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _friOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _friDTController,
                  ),
                  Text("Saturday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _satHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _satOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _satDTController,
                  ),
                  Text("Sunday"),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _sunHoursController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _sunOTController,
                  ),
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                    ),
                    controller: _sunDTController,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Wireman',
                    ),
                    controller: _nameController,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              delegate: SliverChildListDelegate(
                [
                  Text(""),
                  RaisedButton(

                    child: (widget.ts.sent.toString() != null) ? Text('Update') : Text('Add'),
                    onPressed: () {
                      print(widget.ts.sent.toString());
                      if (widget.ts.sent != null) {
                        db.updateTimeSheet(TimeSheet.fromMap({
                          'sent': 0,
                          'name': _nameController.text,
                          'jobNo': int.parse(_jobNoController.text),
                          'jobName': _jobNameController.text,
                          'week': _weekController.text,
                          'monHours': int.parse(_monHoursController.text),
                          'monOT': int.parse(_monOTController.text),
                          'monDT': int.parse(_monDTController.text),
                          'tueHours': int.parse(_tueHoursController.text),
                          'tueOT': int.parse(_tueOTController.text),
                          'tueDT': int.parse(_tueDTController.text),
                          'wedHours': int.parse(_wedHoursController.text),
                          'wedOT': int.parse(_wedOTController.text),
                          'wedDT': int.parse(_wedDTController.text),
                          'thurHours': int.parse(_thurHoursController.text),
                          'thurOT': int.parse(_thurOTController.text),
                          'thurDT': int.parse(_thurDTController.text),
                          'friHours': int.parse(_friHoursController.text),
                          'friOT': int.parse(_friOTController.text),
                          'friDT': int.parse(_friDTController.text),
                          'satHours': int.parse(_satHoursController.text),
                          'satOT': int.parse(_satOTController.text),
                          'satDT': int.parse(_satDTController.text),
                          'sunHours': int.parse(_sunHoursController.text),
                          'sunOT': int.parse(_sunOTController.text),
                          'sunDT': int.parse(_sunDTController.text),
                        })).then((_) {
                          Navigator.pop(context, 'update');
                        });
                      }else {
                        db.saveTimeSheet(TimeSheet(_nameController.text, int.parse(_jobNoController.text), _jobNameController.text, _weekController.text, int.parse(_monHoursController.text), int.parse(_monOTController.text), int.parse(_monDTController.text), int.parse(_tueHoursController.text), int.parse(_tueOTController.text), int.parse(_tueDTController.text), int.parse(_wedHoursController.text), int.parse(_wedOTController.text), int.parse(_wedDTController.text), int.parse(_thurHoursController.text), int.parse(_thurOTController.text), int.parse(_thurDTController.text), int.parse(_friHoursController.text), int.parse(_friOTController.text), int.parse(_friDTController.text), int.parse(_satHoursController.text), int.parse(_satOTController.text), int.parse(_satDTController.text), int.parse(_sunHoursController.text), int.parse(_sunOTController.text),int.parse(_sunDTController.text))).then((_) {
                          Navigator.pop(context, 'save');
                        });
                      }
                    },
                  ),
                  Text(""),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}