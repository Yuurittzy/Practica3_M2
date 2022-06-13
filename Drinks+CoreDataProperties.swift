//
//  Drinks+CoreDataProperties.swift
//  yuritzy.practica4
//
//  Created by Yu on 13/04/22.
//
//

import Foundation
import CoreData


extension Drinks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drinks> {
        return NSFetchRequest<Drinks>(entityName: "Drinks")
    }

    @NSManaged public var name: String?
    @NSManaged public var directions: String?
    @NSManaged public var ingredients: String?
    @NSManaged public var image: String?

}

extension Drinks : Identifiable {

}
