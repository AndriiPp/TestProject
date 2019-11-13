//
//  Car+CoreDataProperties.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var company: String?
    @NSManaged public var model: String?
    @NSManaged public var releaseYear: String?
    @NSManaged public var bodyCar: String?

}
