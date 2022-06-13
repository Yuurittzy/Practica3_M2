//
//  Drinks+CoreDataClass.swift
//  yuritzy.practica4
//
//  Created by Yu on 13/04/22.
//
//

import Foundation
import CoreData

@objc(Drinks)
public class Drinks: NSManagedObject {
    
    func inicializaCon(_ dict: [String:String]) {
        let image = (dict["image"]) ?? ""
        let directions = (dict["directions"]) ?? ""
        let ingredients = (dict["ingredients"]) ?? ""
        let name = (dict["name"]) ?? ""
        self.image = image
        self.directions = directions
        self.ingredients = ingredients
        self.name = name
    }

}
