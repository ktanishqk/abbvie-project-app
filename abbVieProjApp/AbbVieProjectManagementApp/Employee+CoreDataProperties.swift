//
//  Employee+CoreDataProperties.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var employeeName: String?
    @NSManaged public var employeeId: UUID?
    @NSManaged public var employeePosition: String?
    @NSManaged public var employeePicture: Data?
    @NSManaged public var project: NSSet?
    
    public var wrappedEmployeeName: String {
        employeeName ?? "Unknown Employee Name"
    }
    
    public var wrappedEmployeePosition: String {
        employeePosition ?? "Unknown Employee Position"
    }

    public var projectArray: [Project] {
        let set = project as? Set<Project> ?? []
        // how we are sorting projects, currently by name
        // there are other options
        return set.sorted {
            $0.wrappedProjectName < $1.wrappedProjectName
        }
    }

}

// MARK: Generated accessors for project
extension Employee {

    @objc(addProjectObject:)
    @NSManaged public func addToProject(_ value: Project)

    @objc(removeProjectObject:)
    @NSManaged public func removeFromProject(_ value: Project)

    @objc(addProject:)
    @NSManaged public func addToProject(_ values: NSSet)

    @objc(removeProject:)
    @NSManaged public func removeFromProject(_ values: NSSet)

}

extension Employee : Identifiable {

}
