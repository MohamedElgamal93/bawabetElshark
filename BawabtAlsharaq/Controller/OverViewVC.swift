//
//  OverViewVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Cosmos

class OverViewVC: UIViewController {
    @IBOutlet weak var viewImage: UIView!
       @IBOutlet weak var viewName: UIView!
       @IBOutlet weak var viewLast: UIView!
       @IBOutlet weak var numOfAmount: UILabel!
       @IBOutlet weak var imageProduct: UIImageView!
       @IBOutlet weak var nameOfProduct: UILabel!
       @IBOutlet weak var priceOfProduct: UILabel!
       @IBOutlet weak var numOfMinQuty: UILabel!
       @IBOutlet weak var numOfQutity: UILabel!
       @IBOutlet weak var stars: CosmosView!
  
       @IBOutlet weak var companyID: UILabel!
       
       var productHome: Product!
       var productVendorDetails: ProductVendor?
       var infoVendor: Vend?
       var slid = ""
    override func viewDidLoad() {
        super.viewDidLoad()

         numOfAmount.layer.cornerRadius = 6
               numOfAmount.clipsToBounds = true
               
               viewImage.dropShadowww()
               viewName.dropShadowww()
               viewLast.dropShadowww()
           
               numOfAmount.text = "   \(productHome.amount) Item"
               nameOfProduct.text = productHome.product
               
               companyID.text = productHome.companyID
               
               let price = productHome.price
               let textData = Double(price)!
               print(textData)
               let text = String(format: "%.2f", arguments: [textData])
               print(text)
               priceOfProduct.text = text

               
               numOfMinQuty.text = productHome?.minQty
               let imagePath = productHome?.mainPair?.detailed.imagePath
                  imageProduct.sd_setImage(with: URL(string: imagePath ?? ""), placeholderImage: UIImage(named: "imageNotFound"))
               
    }
    

     

         @IBAction func goToInfoCompany(_ sender: UIButton) {
            let ProfileProductVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileProductVC") as! ProfileProductVC
            
                let infoVendorVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoVendoerVC") as! InfoVendoerVC
            
            infoVendorVC.companyId = companyID.text ?? ""
            
          //  ProfileProductVC.companyID = companyID.text ?? ""
            
//            let companyIdC = infoVendorVC.companyId["company_Id"]
//            UserDefaults.standard.set(companyIdC, forkey: "CompanyId")
//            print(UserDefaults.standard.string(forKey: "CompanyId"))
//
        self.navigationController?.pushViewController(infoVendorVC, animated: true)
            }
        
        
        @IBAction func stepper(_ sender: UIStepper) {
            numOfQutity.text = String(Int(sender.value))
            
        }
         

    }
    extension UIView {
        func dropShadowww(scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.4
            layer.shadowOffset = .zero
            layer.shadowRadius = 4
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 3
        }
    }



