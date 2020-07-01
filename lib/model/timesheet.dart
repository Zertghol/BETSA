class TimeSheet{
  int sent;
  String name;
  int jobNo;
  String jobName;
  String week;
  int monHours;
  int monOT;
  int monDT;
  int tueHours;
  int tueOT;
  int tueDT;
  int wedHours;
  int wedOT;
  int wedDT;
  int thurHours;
  int thurOT;
  int thurDT;
  int friHours;
  int friOT;
  int friDT;
  int satHours;
  int satOT;
  int satDT;
  int sunHours;
  int sunOT;
  int sunDT;

  static final columns = ["week", "jobNo"];

  TimeSheet(
      this.name,
      this.jobNo,
      this.jobName,
      this.week,
      this.monHours,
      this.monOT,
      this.monDT,
      this.tueHours,
      this.tueOT,
      this.tueDT,
      this.wedHours,
      this.wedOT,
      this.wedDT,
      this.thurHours,
      this.thurOT,
      this.thurDT,
      this.friHours,
      this.friOT,
      this.friDT,
      this.satHours,
      this.satOT,
      this.satDT,
      this.sunHours,
      this.sunOT,
      this.sunDT);



  TimeSheet.fromMap(Map<String, dynamic> data) {
        this.sent = data['sent'];
        this.name = data['name'];
        this.jobNo = data['jobNo'];
        this.jobName = data['jobName'];
        this.week = data['week'];
        this.sent = data['sent'];
        this.monHours = data['monHours'];
        this.monOT = data['monOT'];
        this.monDT = data['monDT'];
        this.tueHours = data['tueHours'];
        this.thurOT = data['tueOT'];
        this.tueDT = data['tueDT'];
        this.wedHours = data['wedHours'];
        this.wedOT = data['wedOT'];
        this.wedDT = data['wedDT'];
        this.thurHours = data['thurHours'];
        this.thurOT = data['thurOT'];
        this.thurDT = data['thurDT'];
        this.friHours = data['friHours'];
        this.friOT = data['friOT'];
        this.friDT = data['friDT'];
        this.satHours = data['satHours'];
        this.satOT = data['satOT'];
        this.satDT = data['satDT'];
        this.sunHours = data['sunHours'];
        this.sunOT = data['sunOT'];
        this.sunDT = data['sunDT'];

  }

  Map<String, dynamic> toMap() {
    return {
      'sent': 0,
      'name': name,
      'jobNo': jobNo,
      'jobName': jobName,
      'week': week,
      'monHours': monHours,
      'monOT': monOT,
      'monDT': monDT,
      'tueHours': tueHours,
      'tueOT': tueOT,
      'tueDT': tueDT,
      'wedHours': wedHours,
      'wedOT': wedOT,
      'wedDT': wedDT,
      'thurHours': thurHours,
      'thurOT': thurOT,
      'thurDT': thurDT,
      'friHours': friHours,
      'friOT': friOT,
      'friDT': friDT,
      'satHours': satHours,
      'satOT': satOT,
      'satDT': satDT,
      'sunHours': sunHours,
      'sunOT': sunOT,
      'sunDT': sunDT
    };
  }

}
