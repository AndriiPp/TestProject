//
//  CoreDataWork.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit
import CoreData

class CoreDataWork {
   
    
    public var context: NSManagedObjectContext = {
            var appDelegate = UIApplication.shared.delegate as! AppDelegate
            return  appDelegate.persistentContainer.viewContext
       
    }()

   
    
    func getCarsFromCoreData(completion : @escaping (_ cars : [Car]) -> ()){
        let fetchRequest : NSFetchRequest<Car> = Car.fetchRequest()
        do {
            let toDoCars =  try context.fetch(fetchRequest)
            completion(toDoCars)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setCarsToCoreData(car : CarModel){
        let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)
        let managedObject  = NSManagedObject(entity: entity!, insertInto: context) as! Car
       
        managedObject.company = car.firm
        managedObject.model = car.model
        managedObject.bodyCar = car.bodyCar
        managedObject.releaseYear = car.yearOfRelease
        
        do {
            try context.save()
        }catch {
            print(error.localizedDescription)
        }
    }
    func deleteCarFromCoreData(car : Car){
        context.delete(car)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
