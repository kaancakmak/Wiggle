//
//  MenuCell.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 10.11.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var SectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(menuSection:MenuSection){
        SectionLabel.text = menuSection.sectionTitle
    }
    

}

