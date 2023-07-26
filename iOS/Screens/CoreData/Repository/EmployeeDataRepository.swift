//
//  EmployeeRepository.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/07/23.
//

import Foundation
import CoreData

protocol EmployeeRepository {
    func add(employee: Employee)
    func getAll() -> [Employee]?
    func get(id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
}

struct EmployeeDataRepository: EmployeeRepository {
    func add(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistantStorage.shared.context)
        cdEmployee.name     = employee.name
        cdEmployee.email    = employee.email
        cdEmployee.id       = employee.uuid
        cdEmployee.profilePic = employee.profilePicture
        PersistantStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let cdEmployees = PersistantStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        var employees: [Employee] = []
        cdEmployees?.forEach({ employee in
            employees.append(employee.convertToEmployee())
        })
        return employees
    }
    
    func get(id: UUID) -> Employee? {
        let cdEmployee = getCDEmployee(id: id)
        guard let cdEmployee else { return nil }
        return cdEmployee.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        let cdEmployee = getCDEmployee(id: employee.uuid)
        guard cdEmployee != nil else { return false }
        cdEmployee?.name     = employee.name
        cdEmployee?.email   = employee.email
        cdEmployee?.profilePic = employee.profilePicture
        PersistantStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let cdEmployee = getCDEmployee(id: id)
        if let cdEmployee {
            PersistantStorage.shared.context.delete(cdEmployee)
            PersistantStorage.shared.saveContext()
            return true
        } else {
            return false
        }
    }
    
    private func getCDEmployee(id: UUID) -> CDEmployee? {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistantStorage.shared.context.fetch(CDEmployee.fetchRequest()).first
            return result
        } catch (let error) {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}
