//
//  MuseumCollectionViewController+CellDelegates.swift
//  Museum
//
//  Created by Gramos Begolli on 7/27/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import Foundation
import UIKit

extension MuseumCollectionViewController{
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let paintings = self.paintings{
            return paintings.count
        }else{
            return 0
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MuseumCollectionViewCell
        
        let paintingToShow = self.paintings![indexPath.row]
        cell.configureCell(paintingToShow)
        
        return cell
    }
    
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        
        return CGSizeMake(self.view.frame.width, self.view.frame.width / 2 + MuseumCollectionViewCell.infoTextViewHeight(self.paintings![indexPath.row]))
    }
   

}