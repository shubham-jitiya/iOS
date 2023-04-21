//
//  UserModel.swift
//  iOS
//
//  Created by Shubham Jitiya on 01/05/23.
//

import UIKit

struct UserModel {
    // MARK: Variables
    var imgProfile: UIImage?
    var fName, lName, age: String?
    
    static func dummyData() -> (Array<UserModel>, Array<UserModel>) {
        let newUsers = [
            UserModel(imgProfile: UIImage(systemName: Constants.Images.personCircleFilled.rawValue), fName: "Manthan", lName: "Nagpurkar", age: "21"),
            UserModel(imgProfile: UIImage(systemName: Constants.Images.personCircleFilled.rawValue), fName: "Shubham", lName: "Jitiya", age: "22"),
            UserModel(imgProfile: UIImage(systemName: Constants.Images.personCircleFilled.rawValue), fName: "Shyam", lName: "Sartanpara", age: "21"),
            
        ]
        let deletedUsers: [UserModel] = [
            UserModel(imgProfile: UIImage(systemName: Constants.Images.personCircleFilled.rawValue), fName: "Bhakti", lName: "Trivedi", age: "22"),
        ]
        return (newUsers, deletedUsers)
    }
}
