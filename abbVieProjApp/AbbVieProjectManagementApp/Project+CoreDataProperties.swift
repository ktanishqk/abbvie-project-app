//
//  Project+CoreDataProperties.swift
//  AbbVieProjectManagementApp
//
//  Created by Alfredo Sandoval-Luis on 2/2/24.
//
//

import Foundation
import CoreData


extension Project {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }
    
    @NSManaged public var projectName: String?
    @NSManaged public var projectDescription: String?
    @NSManaged public var projectEndDate: Date?
    @NSManaged public var projectStartDate: Date?
    @NSManaged public var employee: NSSet?
    
    // added codde
    public var wrappedProjectName: String {
        projectName ?? "Unknown Project Name"
    }
    
    public var wrappedProjectDescription: String {
        projectDescription ?? "Unknown Project Description"
    }
    
    public var wrappedProjectStartDate: Date {
        projectStartDate ?? Date()
    }

    public var wrappedProjectEndDate: Date {
        projectEndDate ?? Date()
    }
    
    // establishing to core data that it is an array of employees
    public var employeeArray: [Employee] {
        let set = employee as? Set<Employee> ?? []
        // how we are sorting employees, currently by names
        // position is another option
        return set.sorted {
            $0.wrappedEmployeeName < $1.wrappedEmployeeName
        }
    }

}

// MARK: Generated accessors for employee
extension Project {

    @objc(addEmployeeObject:)
    @NSManaged public func addToEmployee(_ value: Employee)

    @objc(removeEmployeeObject:)
    @NSManaged public func removeFromEmployee(_ value: Employee)

    @objc(addEmployee:)
    @NSManaged public func addToEmployee(_ values: NSSet)

    @objc(removeEmployee:)
    @NSManaged public func removeFromEmployee(_ values: NSSet)

}

extension Project : Identifiable {

}
