//
//  Museum.swift
//  Museum
//
//  Created by Gramos Begolli on 7/24/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import Foundation
import ObjectMapper

class Museum: Mappable {
    
    var paintings: [Painting]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        paintings <- map["paintings"]
        
    }
}