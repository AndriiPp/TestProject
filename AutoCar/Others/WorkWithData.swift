//
//  getData.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation

class  WorkWithData {
    
    let coreDataWork = CoreDataWork.init()
    let realmWork = RealmWork.init()
    let userDefaultsWork = UserDefaultsWork.init()
    var automo =  [CarModel]()
    
    
    func getData(completion : @escaping (_ automobiles : [CarModel]) -> () ){
        completion(getDataFromCoreData())
    }
    
    func getDataFromCoreData() -> [CarModel]{
        coreDataWork.getCarsFromCoreData { (cars) in
                  for car in cars {
                      let auto = CarModel.init(firm: car.company!, model: car.model!, yearOfRelease: car.releaseYear!, bodyCar: car.bodyCar!)
                      self.automo.append(auto)
            }
        }
         return automo
    }
    func getDataFromRealm() -> [CarModel]{
        realmWork.getCarsFromRealm { (cars) in
            for car in cars {
                let auto = CarModel.init(firm: car.firm, model: car.model, yearOfRelease: car.yearOfRelease, bodyCar: car.bodyCar)
                self.automo.append(auto)
            }
        }
        return automo
    }
}

