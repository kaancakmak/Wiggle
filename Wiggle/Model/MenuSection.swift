//
//  MenuSection.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 10.11.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import Foundation

class MenuSection{
    
    private var _sectionTitle: String!
    
    var sectionTitle: String{
        return _sectionTitle
    }
    
    init(sectionTitle: String){
        _sectionTitle = sectionTitle
    }
    
}
