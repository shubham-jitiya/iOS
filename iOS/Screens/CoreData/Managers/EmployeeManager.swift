//
//  EmployeeManager.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/07/23.
//

import Foundation

struct EmployeeManager {
    private let _employeeRepository = EmployeeDataRepository()
    
    func addEmployee(employee: Employee) {
        _employeeRepository.add(employee: employee)
    }
    
    func fetchEmployees() -> [Employee]? {
        return _employeeRepository.getAll()
    }
    
    func fetchEmployee(id: UUID) -> Employee? {
        return _employeeRepository.get(id: id)
    }
    
    func updateEmployee(employee: Employee) -> Bool {
        return _employeeRepository.update(employee: employee)
    }
    
    func deleteEmployee(id: UUID) -> Bool {
        return _employeeRepository.delete(id: id)
    }
}
