import SwiftUI

struct EmployeeListView: View {
    @FetchRequest(entity: Employee.entity(), sortDescriptors: []) var employees: FetchedResults<Employee>
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            List(employees, id: \.self) { employee in
                if searchText.isEmpty || employee.wrappedEmployeeName.localizedCaseInsensitiveContains(searchText) {
                    NavigationLink(destination: EmployeeView(employee: employee)) {
                                            Text(employee.wrappedEmployeeName)
                                        }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Employees")
        }
    }
}
