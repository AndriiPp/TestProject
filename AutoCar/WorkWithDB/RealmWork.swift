//
//  RealmWork.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWork: NSObject {
    let realm = try! Realm()
    
    func setCarToRealm(car : CarModel){
        try! realm.write {
            let newCar = CarRealm()
            newCar.firm = car.firm
            newCar.model = car.model
            newCar.bodyCar = car.bodyCar
            newCar.yearOfRelease = car.yearOfRelease
            self.realm.add(newCar)
        }
    }
    func getCarsFromRealm(completion : @escaping (Results<CarRealm>) -> ()){
        let cars: Results<CarRealm> = {self.realm.objects(CarRealm.self)}()
        completion(cars)
    }
}
