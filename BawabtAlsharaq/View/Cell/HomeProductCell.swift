//
//  HomeProductCell.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

protocol HomeProductCellDelegate {
    func didTabButton(with title: String)
}

class HomeProductCell: UICollectionViewCell {
    
    @IBOutlet weak var ShadowViewImage: UIView!
       @IBOutlet weak var uiViewCollectionHome: UIView!
       @IBOutlet weak var imageProductHome: UIImageView!
       @IBOutlet weak var nameProductHome: UILabel!
       @IBOutlet weak var priceProductHome: UILabel!
       @IBOutlet weak var minQutyProductHome: UILabel!
       @IBOutlet weak var buy: UIButton!
    
    @IBOutlet weak var chatNow: UIButton!
    
     var delegate: HomeProductCellDelegate?
    
    static let identifer = "HomeProductCell"
    static func nib() -> UINib {
        return UINib(nibName: "HomeProductCell", bundle: nil)
    }
    
    @IBAction func didTabButton() {
        delegate!.didTabButton(with: title)
    }
    private var title: String = ""
    
    func configure(with title: String){
        self.title = title
        chatNow.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatNow.setTitleColor(.link, for: .normal)
            ShadowViewImage.dropShadowo()
               buy.layer.cornerRadius = 10
               buy.clipsToBounds = true
               uiViewCollectionHome.layer.cornerRadius = 5
               uiViewCollectionHome.clipsToBounds = true
               ShadowViewImage.layer.cornerRadius = 5
               ShadowViewImage.clipsToBounds = true
    }

}
extension UIView {
    func dropShadowo(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 2
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 3
    }
}
