//
//  MuseumCollectionViewCell.swift
//  Museum
//
//  Created by Gramos Begolli on 7/20/16.
//  Copyright © 2016 Gramos Begolli. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MuseumCollectionViewCell: UICollectionViewCell {
    
    enum Layout {
        static let screenWidth : CGFloat = UIScreen.mainScreen().applicationFrame.width
        static let marginTop : CGFloat = 8.0
        static let marginBottom: CGFloat = 8.0
        static let textViewTopAndBottomMargin : CGFloat = 8.0
    }
    
    @IBOutlet weak var museumImageView: UIImageView!
    @IBOutlet weak var museumInfo: UITextView!
    var painting : Painting!
    
    override func awakeFromNib() {
        
        let infoTextViewTapgesture = UITapGestureRecognizer(target: self, action: #selector(MuseumCollectionViewCell.infoTextViewTapped(_:)))
        museumInfo.addGestureRecognizer(infoTextViewTapgesture)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.museumImageView.image = nil
    }
    
    func infoTextViewTapped(sender : UITapGestureRecognizer){

        if self.painting.infoTextIsSelected == true {
            self.painting.infoTextIsSelected = false
        }else{
            self.painting.infoTextIsSelected = true
        }
        
        self.colorTextViewInfo()
    }
    
    func configureCell(painting: Painting){
        
        self.painting = painting
        
        self.addImage(painting)
        
        self.addTextInfo(painting)
        
    }
    func addImage(painting: Painting){
        
        var paintingToShowImageUrl = NSURL()
        if let paintingUrl = NSURL(string:painting.imageUrl!){
            paintingToShowImageUrl = paintingUrl
        }else{
            let modifiedUrl = painting.imageUrl!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            paintingToShowImageUrl = NSURL(string: modifiedUrl!)!
        }
        
        self.museumImageView.af_setImageWithURL(paintingToShowImageUrl)
        
        if self.museumImageView.image == nil {
            self.museumImageView.image = UIImage(named: "museumPlaceholder")
        }
    }
    func addTextInfo(painting: Painting){
        
        if let textSize = painting.infoTextSize{
            self.museumInfo.attributedText = MuseumCollectionViewCell.attributtedTextWithMessage(painting.infoText!, font: UIFont.systemFontOfSize(CGFloat(textSize)))
        }else{
            self.museumInfo.attributedText = MuseumCollectionViewCell.attributtedTextWithMessage(painting.infoText!, font: UIFont.systemFontOfSize(16))
        }
        
        self.colorTextViewInfo()
    }
    
    func colorTextViewInfo(){
        
        if self.painting.infoTextIsSelected == true {
            if let infoTextColor = self.painting.infoTextColor{
                self.museumInfo.textColor = UIColor.init(hexString : infoTextColor)
            }else{
                self.museumInfo.textColor = UIColor.blackColor()
            }
        }else{
            self.museumInfo.textColor = UIColor.blackColor()

        }
    }
    
    static func attributtedTextWithMessage(message : String, font : UIFont) -> NSAttributedString{
        
        var attributedString = NSMutableAttributedString()
        attributedString =  NSMutableAttributedString(string:message, attributes: [NSFontAttributeName: font])
        return attributedString
        
    }
    
    static func infoTextViewHeight(painting: Painting) -> CGFloat{
        
        var attributedString = NSAttributedString()
        
        if let textSize = painting.infoTextSize{
            attributedString = MuseumCollectionViewCell.attributtedTextWithMessage(painting.infoText!, font: UIFont.systemFontOfSize(CGFloat(textSize)))
        }else{
            attributedString = MuseumCollectionViewCell.attributtedTextWithMessage(painting.infoText!, font: UIFont.systemFontOfSize(16))
        }
        
        let constraintRect = CGSize(width:Layout.screenWidth,  height: CGFloat.max)
        let boundingBox =  attributedString.boundingRectWithSize(constraintRect, options:[NSStringDrawingOptions.UsesLineFragmentOrigin], context: nil)
        let height = boundingBox.height + Layout.marginTop + Layout.marginBottom + Layout.textViewTopAndBottomMargin
        
        return height
        
    }
}
