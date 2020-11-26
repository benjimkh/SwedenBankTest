//
//  BankObject+CoreDataProperties.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/6/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//
//

import Foundation
import CoreData


extension BankObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BankObject> {
        return NSFetchRequest<BankObject>(entityName: "BankObject")
    }

    @NSManaged public var address: String?
    @NSManaged public var availability: String?
    @NSManaged public var coinStation: Bool
    @NSManaged public var country: String?
    @NSManaged public var id: Int64
    @NSManaged public var info: String?
    @NSManaged public var latitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var name: String?
    @NSManaged public var noCash: Bool
    @NSManaged public var region: String?
    @NSManaged public var type: Int32

}
