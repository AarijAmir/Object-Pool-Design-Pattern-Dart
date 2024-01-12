void main(List<String> args) {
  StudentsPool studentsPool = StudentsPool();
  try {
    var seventhSemesterStudent = studentsPool.getClass('7th');

    Class classSeventhSemesterStudentIT = Class(
        semesterName: seventhSemesterStudent.semesterName,
        totalCourse: seventhSemesterStudent.totalCourse,
        creditHours: seventhSemesterStudent.creditHours,
        noOfStudent: seventhSemesterStudent.noOfStudent);
    print(classSeventhSemesterStudentIT);
    //  studentsPool.disposeSeventhSemester(seventhSemesterStudent);
  } on Exception {
    print('Object is already taken');
  }
  try {
    var seventhSemesterStudent = studentsPool.getClass('7th');

    Class classSeventhSemesterStudentCS = Class(
        semesterName: seventhSemesterStudent.semesterName,
        totalCourse: seventhSemesterStudent.totalCourse,
        creditHours: seventhSemesterStudent.creditHours,
        noOfStudent: seventhSemesterStudent.noOfStudent);
    print(classSeventhSemesterStudentCS);
    studentsPool.disposeSeventhSemester(seventhSemesterStudent);
  } on Exception {
    print('Object is already taken');
  }
}

class StudentsPool {
  int counterEightSemester = 1;
  int counterSeventhSemester = 1;
  static Map<String, Class?> map = {
    '8th': Class(
        semesterName: '8th', totalCourse: 4, creditHours: 28, noOfStudent: 32),
    '7th': Class(
        semesterName: '7th', totalCourse: 6, creditHours: 48, noOfStudent: 43),
  };
  Class getClass(String semester) {
    if (semester == '8th' && counterEightSemester > 0) {
      counterEightSemester--;
      var eightSemesterClassObject = map['8th'];
      map['8th'] = null;
      return map['8th']!;
    } else if (semester == '7th' && counterSeventhSemester > 0) {
      counterSeventhSemester--;
      var seventhSemesterClassObject = map['7th'];
      map['7th'] = null;
      return seventhSemesterClassObject!;
    }
    throw Exception(
        'The Object you want to get is already taken, If it is disposed then will be able to consume');
  }

  void disposeSeventhSemester(Class objectSeventhSemester) {
    map['7th'] = objectSeventhSemester;
    counterSeventhSemester++;
  }

  void disposeEightSemester(Class objectEightSemester) {
    map['8th'] = objectEightSemester;
    counterEightSemester++;
  }
}

class Class {
  String semesterName;
  int totalCourse;
  int creditHours;
  int noOfStudent;
  Class(
      {required this.semesterName,
      required this.totalCourse,
      required this.creditHours,
      required this.noOfStudent});
  @override
  String toString() {
    // TODO: implement toString
    return 'SemesterName: $semesterName, Total Course: $totalCourse, Credit Hours: $creditHours, No Of Students: $noOfStudent';
  }
}
