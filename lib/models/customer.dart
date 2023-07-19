import 'package:khata_app/models/Project.dart';

class Customer {
  String _name;
  double total;
  List<Project> projects = [];

  Customer(this._name, this.total, this.projects);

  void addProject(Project project) {
    projects.add(project);
    for (Project project in projects) {
      total += project.getBudget - project.getReceived();
    }
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
