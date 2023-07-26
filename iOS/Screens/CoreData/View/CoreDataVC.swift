//
//  CoreDataViewController.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/07/23.
//

import UIKit

class CoreDataVC: UIViewController {
    

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        testQueries()
    }
}

// MARK: - Functions
extension CoreDataVC {
    func testQueries() {
        let employeeManager = EmployeeManager()
        
        // create
//        let newEmployee = Employee(name: "Shubham J", email: "simform@gmail.com", uuid: UUID())
//        employeeManager.addEmployee(employee: newEmployee)
        
      
        // update
//        let newEmployee = Employee(name: "Shubham", email: "simform@gmail.com", uuid: UUID())
//        employeeManager.updateEmployee(employee: newEmployee)
//
        
        // fetch
        let employees = employeeManager.fetchEmployees()
        debugPrint("Employees: ", employees)
    }
}
