//
//  MuseumCollectionViewController.swift
//  Museum
//
//  Created by Gramos Begolli on 7/20/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

public let reuseIdentifier = "museumCell"

class MuseumCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    var paintings: [Painting]?
    var prototypeCell : UICollectionViewCell?
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addRefreshControl()
        
        self.getPaintings()
    }
    
    func addRefreshControl(){
        refreshControl.tintColor = UIColor.grayColor()
        refreshControl.addTarget(self, action: #selector(self.refresh), forControlEvents: UIControlEvents.ValueChanged)
        self.collectionView?.addSubview(refreshControl)
    }

    func refresh(){
        getPaintings()
    }
    
    func getPaintings(){
        Network.getPaintings({ (paintings) in
            self.refreshControl.endRefreshing()
            self.paintings = paintings
            self.collectionView?.reloadData()

        }) { (error) in
            self.refreshControl.endRefreshing()
                print(error)
        }
    }
    

}
