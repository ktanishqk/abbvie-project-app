//
//  EmployeeView.swift
//  AbbVieProjectManagementApp
//
//  Created by Khurana, Tanishq on 2/13/24.
//

import SwiftUI

struct EmployeeView: View {
    let employee: Employee

    var body: some View {
        VStack {
            if let employeeName = employee.employeeName {
                Text("Name: \(employeeName)")
            }

            if let employeePosition = employee.employeePosition {
                Text("Position: \(employeePosition)")
            }

            if let employeePictureData = employee.employeePicture,
               let employeePicture = UIImage(data: employeePictureData) {
                Image(uiImage: employeePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
            }
        }
        .navigationTitle("Employee")
    }
}
