//
//  CDEmployee+CoreDataProperties.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/07/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID
    @NSManaged public var profilePic: Data?
    
    func convertToEmployee() -> Employee {
        return Employee(name: self.name, email: self.email, profilePicture: self.profilePic, uuid: self.id)
    }
}

extension CDEmployee : Identifiable {

}
