//
//  File.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/14/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import Foundation
import UIKit

protocol DataProviderProtocol : class {
    var table : UITableView {get}
}

class DataProvider : NSObject {
    public var cars = [CarModel]()
    
    public lazy var workData = WorkWithData.init()
    public weak var delegate: DataProviderProtocol?
    private var carCount: Int {
        return self.cars.count
    }
    
}

extension DataProvider : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserCell.self), for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        let car = cars[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.titleText = "\(car.firm)  \(car.model)"
        return cell
    }
}
