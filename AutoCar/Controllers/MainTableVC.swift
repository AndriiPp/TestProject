//
//  ViewController.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit

class MainTableVC: UIViewController {

    private lazy var provider: DataProvider = DataProvider.init()
    private lazy var workData = CoreDataWork.init()
    private lazy var mersedesModel = CarModel.init(firm: "mersedes", model: "cx500", yearOfRelease: "2013", bodyCar: "sedan")
    private lazy var tableView: UITableView = {
        let view = UITableView.init()
        view.rowHeight = UITableView.automaticDimension
        view.tableFooterView = UIView.init()
        view.register(UserCell.self, forCellReuseIdentifier:
            String(describing: UserCell.self))
        return view
    }()
    
    let button : UIButton = {
           let bt = UIButton(type: .system)
           bt.translatesAutoresizingMaskIntoConstraints = false
           bt.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        bt.addTarget(self, action: #selector(addNewCar), for: .touchUpInside)
           return bt
       }()
    override func viewWillAppear(_ animated: Bool) {
        workData.setCarsToCoreData(car: mersedesModel)
        loadAll()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewAndButton()
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    func loadAll(){
        self.provider.delegate = self
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now()+1) {
            self.provider.workData.getData { [weak self](cars) in
                guard let self = self else {return}
                self.provider.cars = cars
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func setupTableViewAndButton(){
        self.view.addSubview(tableView)
        self.view.addSubview(button)
        
        self.tableView.dataSource = provider
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.button.frame = CGRect.init(x: self.view.center.x, y: self.view.center.x, width: 30, height: 30)
    }
    @objc func addNewCar(){
        let addVc = AddVC()
        self.present(addVc, animated: true, completion: nil)
    }
}

extension MainTableVC : DataProviderProtocol {
    var table: UITableView {
        return tableView
    }
}

