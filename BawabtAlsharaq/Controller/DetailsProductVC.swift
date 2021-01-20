//
//  DetailsProductVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire

class DetailsProductVC: UIViewController {

     @IBOutlet weak var imageProduct: UIImageView!
     @IBOutlet weak var DescriptionLabel: UILabel!
    
    var descrp: Detail?
    var productHome: Product!
    var productVendorDetails: ProductVendor?
    var productVDetails = [Product]()
    var infoVendor: Vend?
    var slid = ""
    override func viewDidLoad() {
        super.viewDidLoad()

         getProductDetails(productID: productHome?.productID ?? "")
        
            let imagePath = productHome?.mainPair?.detailed.imagePath
             imageProduct.sd_setImage(with: URL(string: imagePath ?? ""), placeholderImage: UIImage(named: "imageNotFound"))
    }
  func getProductDetails(productID: String) -> Void {
               let username = "support@bawabtalsharq.com"
               let password = "C16in4QukO5536UCe7R483ugvH903NVm"

               let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)

    AF.request( "https://www.gatetoeast.com/demo4/api/products/\(productID)", method: .get )
                   .authenticate(with: credential)
                   .responseJSON { [weak self] response in
                       guard let self = self else { return }
                       do {
                           print(response)
                           if let data = response.data {
                               let detailsResponse = try JSONDecoder().decode(Detail.self, from: data)
                            self.DescriptionLabel.text = detailsResponse.fullDescription.htmlToString

                                                       }
                                                    } catch {
                                                       print(error)
                                                   }
                                           }


                                }

                            }

extension UIView {
    func dropShadoww(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf16) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}

