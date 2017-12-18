//
//  ItemCell.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 14.12.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(itemSection:ItemSection){
        firstLabel.text = itemSection.itemTitle
        secondLabel.text = itemSection.itemTitle
    }
    
    func updateName(_firstLabel:String){
        firstLabel.text = _firstLabel
    }
    
    func updateRSSI(_secondLabel:String){
        secondLabel.text = _secondLabel
    }

    
}


