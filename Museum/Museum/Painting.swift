//
//  Museum.swift
//  Museum
//
//  Created by Gramos Begolli on 7/23/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import Foundation
import ObjectMapper

class Painting: Mappable {
    var imageUrl: String?
    var infoText: String?
    var infoTextSize: Int?
    var infoTextColor: String?
    var infoTextIsSelected: Bool

    required init?(_ map: Map) {
        self.infoTextIsSelected = false
    }
    
    func mapping(map: Map) {
        imageUrl <- map["image_url"]
        infoText <- map["info_text"]
        infoTextSize <- map["info_text_size"]
        infoTextColor <- map["info_text_color"]
    }
}
