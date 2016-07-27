//
//  Network.swift
//  Museum
//
//  Created by Gramos Begolli on 7/23/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Network {
    
    class func getPaintings(onSussess :[Painting] -> (), onFailure:NSError -> ()) {
        
        let URL = "https://www.bevuta.com/museum/paintings.json"

        Alamofire.request(.GET, URL).responseObject { (response: Response<Museum, NSError>) in
            
            if let paintingResponse = response.result.value{
                onSussess(paintingResponse.paintings!)
            }else{
                onFailure(response.result.error!)
            }
        }
    }
}