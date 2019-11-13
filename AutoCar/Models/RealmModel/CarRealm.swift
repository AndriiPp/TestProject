//
//  CarRealm.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation
import RealmSwift

class CarRealm : Object {
    dynamic var firm : String = ""
    dynamic var model : String = ""
    dynamic var yearOfRelease : String = ""
    dynamic var bodyCar : String = ""
}
