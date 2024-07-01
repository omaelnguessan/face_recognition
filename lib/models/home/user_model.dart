
class User {
  String? matricule;
  String? name;
  String? designation;
  String? department;
  String? confidence;
  double? latitude;
  double? longitude;

  User({this.matricule, this.name, this.designation,  this.department, this.confidence, this.latitude, this.longitude});

  User.fromJson(Map<String, dynamic> json) {
    matricule = json['EmployeeID'];
    name = json['Name'];
    designation = json['Designation'];
    department = json['Department'];
    confidence = json['Confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matricule'] = matricule;
    data['name'] = name;
    data['designation'] = designation;
    data['department'] = department;
    data['confidence'] = confidence;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}