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
        // addEmployee()
        fetchEmployee()
    }
}

// MARK: - Functions
extension CoreDataVC {
    func addEmployee() {
        let employee = Employee(context: PersistantStorage.shared.context)
        employee.name = "Shubham J."
        PersistantStorage.shared.saveContext()
    }
    
    func fetchEmployee() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        
        do {
            let records = try PersistantStorage.shared.context.fetch(Employee.fetchRequest())
            records.forEach { employee in
                debugPrint(employee.name ?? "")
            }
        } catch (let error) {
                debugPrint(error)
        }
    }
}
