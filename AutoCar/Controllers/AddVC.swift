//
//  AddVC.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    let coreDataWork = CoreDataWork.init()
    let workWithDta = WorkWithData.init()
    
    let saveButton : UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(saveDataToDB), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor.darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let backButton : UIButton = {
           let button = UIButton(type: .system)
           button.addTarget(self, action: #selector(backToTable), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Cancel", for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 5
           button.layer.masksToBounds = true
           button.backgroundColor = UIColor.darkGray
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
           return button
       }()
    
    let inputsContainer : UIView = {
       let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.white
        cv.layer.cornerRadius = 5
        cv.layer.masksToBounds = true
        return cv
    }()
    
    let firmText : UITextField = {
           let tf = UITextField()
           tf.placeholder = "Firm"
           tf.translatesAutoresizingMaskIntoConstraints = false
          return tf
       }()

    let firmSeparator : UIView = {
           let  cv = UIView()
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.backgroundColor = UIColor(r: 220, g: 220, b: 220)
           return cv
       }()
    
    
    let modelText : UITextField = {
           let tf = UITextField()
           tf.placeholder = "Model"
           tf.translatesAutoresizingMaskIntoConstraints = false
          return tf
       }()

       let modelSeparator : UIView = {
           let  cv = UIView()
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.backgroundColor = UIColor(r: 220, g: 220, b: 220)
           return cv
       }()
    
    let releaseText : UITextField = {
           let tf = UITextField()
           tf.placeholder = "Year Of Release"
           tf.translatesAutoresizingMaskIntoConstraints = false
          return tf
       }()

       let releaseSeparator : UIView = {
           let  cv = UIView()
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.backgroundColor = UIColor(r: 220, g: 220, b: 220)
           return cv
       }()
    
    let  bodyTypeText : UITextField = {
           let tf = UITextField()
           tf.placeholder = "Body Type"
           tf.translatesAutoresizingMaskIntoConstraints = false
          return tf
       }()

      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
    }
    
    @objc func saveDataToDB(){
        let carModel = CarModel.init(firm: firmText.text!, model: modelText.text!, yearOfRelease: releaseText.text!, bodyCar: bodyTypeText.text!)
        coreDataWork.setCarsToCoreData(car: carModel)
        
    }
    
    @objc func backToTable(){
        self.dismiss(animated: true, completion: nil)
        workWithDta.getData { (cars) in
            for car in cars {
                print(car)
            }
        }
    }
    
    func setupConstraints(){
        view.addSubview(inputsContainer)
        view.addSubview(saveButton)
        view.addSubview(backButton)
        inputsContainer.addSubview(firmText)
        inputsContainer.addSubview(firmSeparator)
        inputsContainer.addSubview(modelText)
        inputsContainer.addSubview(modelSeparator)
        inputsContainer.addSubview(releaseText)
        inputsContainer.addSubview(releaseSeparator)
        inputsContainer.addSubview(bodyTypeText)
        
        inputsContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainer.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainer.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        firmText.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 12).isActive = true
        firmText.topAnchor.constraint(equalTo: inputsContainer.topAnchor).isActive = true
        firmText.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        firmText.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/4).isActive = true
        
        firmSeparator.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        firmSeparator.topAnchor.constraint(equalTo: firmText.bottomAnchor).isActive = true
        firmSeparator.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        firmSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        modelText.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 12).isActive = true
        modelText.topAnchor.constraint(equalTo: firmSeparator.bottomAnchor).isActive = true
        modelText.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        modelText.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/4).isActive = true
        
        modelSeparator.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        modelSeparator.topAnchor.constraint(equalTo: modelText.bottomAnchor).isActive = true
        modelSeparator.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        modelSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        releaseText.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 12).isActive = true
        releaseText.topAnchor.constraint(equalTo: modelSeparator.bottomAnchor).isActive = true
        releaseText.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        releaseText.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/4).isActive = true
        
        releaseSeparator.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        releaseSeparator.topAnchor.constraint(equalTo: releaseText.bottomAnchor).isActive = true
        releaseSeparator.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        releaseSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        bodyTypeText.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 12).isActive = true
        bodyTypeText.topAnchor.constraint(equalTo: releaseSeparator.bottomAnchor).isActive = true
        bodyTypeText.widthAnchor.constraint(equalTo: inputsContainer.widthAnchor).isActive = true
        bodyTypeText.heightAnchor.constraint(equalTo: inputsContainer.heightAnchor, multiplier: 1/4).isActive = true
        
        saveButton.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        saveButton.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: inputsContainer.bottomAnchor, constant: 20).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        backButton.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        backButton.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
}
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
    self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
