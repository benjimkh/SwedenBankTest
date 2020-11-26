//
//  PresistanceManager.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import CoreData

class PresistanceManager {
    
    private init() {}
    static let shared = PresistanceManager()
    var context : NSManagedObjectContext { return persistentContainer.viewContext }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SwedBankHomeWork")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func save () {
        let context = persistentContainer.viewContext
        //        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
                debugPrint("BBBB ||| **** SAVED SUCCESSFULLY ****")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchDataFromDB() -> [BankObject] {
        
        var bnkobj: [BankObject] = []
        do {
            let r = NSFetchRequest<NSFetchRequestResult>(entityName: "BankObject")
            let f = try persistentContainer.viewContext.fetch(r)
            bnkobj = f as! [BankObject]
        } catch let error as NSError {
            print("Error Happend in Fetching Process \(error)")
        }
        
        return bnkobj
    }
    
    func deleteAllData(_ entity:String? = "BankObject") {
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "BankObject")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        
    }
    
    
    
}
