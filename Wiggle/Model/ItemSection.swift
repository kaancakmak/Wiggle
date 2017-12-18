//
//  ItemSection.swift
//  Wiggle
//
//  Created by Kaan Cakmak on 14.12.2017.
//  Copyright © 2017 Kaan Cakmak. All rights reserved.
//

import Foundation

class ItemSection{
    
    private var _itemTitle: String!
    private var _itemRssi: String!
    
    var itemTitle: String{
        return _itemTitle
    }
    
    var itemRssi: String{
        return _itemRssi
    }
    
    init(itemTitle: String, itemRssi: String){
        _itemTitle = itemTitle
        _itemRssi = itemRssi
    }
    
}

