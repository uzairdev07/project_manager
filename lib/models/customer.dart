import 'package:khata_app/models/Project.dart';

class Customer {
  String _name;
  double total;
  List<Project> projects = [];

  Customer(this._name, this.total, this.projects);

  // Factory method to create a Customer object from JSON
  factory Customer.fromJson(Map<String, dynamic> json) {
    // Parse the properties from the JSON map
    String name = json['name'];
    double total = json['total'] ?? 0.0;
    List<Project>? projects = [];
    if (json['projects'] != null) {
      // Parse the projects list from JSON and create Project objects
      var projectList = json['projects'] as List;
      projects = projectList
          .map((projectJson) {
            return Project.fromJson(projectJson);
          })
          .cast<Project>()
          .toList();
    }

    // Create and return the Customer object
    return Customer(name, total, projects);
  }

  // Convert Customer object to a JSON representation (Map<String, dynamic>)
  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'total': total,
      'projects': projects.map((project) => project.toJson()).toList(),
    };
  }

  void addProject(Project project) {
    projects.add(project);
    total += project.getBudget;
  }

  void updateProject(Project updatedProject) {
    int index = projects.indexWhere(
        (project) => project.getDateTime == updatedProject.getDateTime);
    if (index != -1) {
      projects[index] = updatedProject;
    }
  }

  double totalAmount() {
    double total = 0;
    for (Project project in projects) {
      total += project.remaining;
    }
    return total;
  }

  double get getTotal => total;

  set setTotal(double value) {
    total = value;
  }

  String get getName => _name;

  set setName(String value) {
    _name = value;
  }
}
