//
//  PersistantStorage.swift
//  iOS
//
//  Created by Shubham Jitiya on 26/07/23.
//

import Foundation
import CoreData

final class PersistantStorage {
        
    // MARK: - Variables
    static let shared = PersistantStorage()
    lazy var context = persistentContainer.viewContext

    private init() { }
    
    // MARK: - Functions
    
    // Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    // Core Data Saving support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
