//
//  UserCell.swift
//  AutoCar
//
//  Created by Andrii Pyvovarov on 11/13/19.
//  Copyright © 2019 Andrii Pyvovarov. All rights reserved.
//

import UIKit

class UserCell : UITableViewCell {
    private let titleLable = UILabel()
    
    
    public var titleText: String = "" {
           willSet {
               self.titleLable.text = newValue
           }
       }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.commonInit()
        }
    
    
    private func commonInit(){
        self.contentView.addSubview(titleLable)
        self.titleLable.text = "Label"
        self.titleLable.numberOfLines = 0
        self.titleLable.textColor = .black
        self.titleLable.textAlignment = .left
        
        self.titleLable.frame = CGRect.init(x: 0, y: 0, width: self.contentView.frame.size.width, height: 50)
    }
}
