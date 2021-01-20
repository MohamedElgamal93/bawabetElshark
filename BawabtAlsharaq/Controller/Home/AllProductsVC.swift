//
//  AllProductsVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire

class AllProductsVC: UIViewController {

    @IBOutlet weak var allProductHome: UICollectionView!
    
    var products = [Product]()
    var details = [Detail]()
    var productHome: Product?
    
    var page = 1
    var totalItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allProductHome.backgroundView?.backgroundColor = .red
        fetchProducts(for: page)
            
               allProductHome.delegate = self
               allProductHome.dataSource = self
               allProductHome.collectionViewLayout = UICollectionViewFlowLayout()
        allProductHome.register( HomeProductCell.nib(), forCellWithReuseIdentifier: HomeProductCell.identifer)
                     
    }
    
}


extension AllProductsVC: UICollectionViewDelegate, UICollectionViewDataSource{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
    
}
  

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellHome: HomeProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
               
    let product = products[indexPath.row]
    
    let price = product.price
    let textData = Float(price)!
    let price2Desmail = String(format: "%.2f", arguments: [textData])
    cellHome.priceProductHome.text = "price: \(price2Desmail) $"

    cellHome.nameProductHome.text = product.product
    cellHome.minQutyProductHome.text = "Min Qty: \(product.minQty)"
    let imagePath = product.mainPair?.detailed.imagePath
    cellHome.imageProductHome.sd_setImage(with: URL(string: imagePath ?? ""))
    cellHome.delegate = self
  return cellHome
}
func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.item == totalItems - 1 {
        page += 1
        fetchProducts(for: page)
    }
}
}
extension AllProductsVC: HomeProductCellDelegate{
    func didTabButton(with title: String) {
        
        let detailsVendVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVendorVC") as! DetailsVendorVC
                
        detailsVendVC.companyId = productHome!.companyID
                
        //        detailsVendVC.companyId =  self.infoVendor?.companyID ?? companyId
                self.navigationController?.pushViewController(detailsVendVC, animated: true)
//         guard let userID = UserDefaults.standard.string(forKey: "UserID") else { return }
//               guard let firstName =  UserDefaults.standard.string(forKey: "FristName") else {return}
//               guard let lastName = UserDefaults.standard.string(forKey: "LastName") else {return}
//               guard let email = UserDefaults.standard.string(forKey: "Email") else {return}
//
////        fetchProducts(for: page)
//
//               let user = User(uid: userID, firstName: firstName, lastName: lastName, avatarURL: "", email: email, isOnline: false)
//
//        // email of company and move it to info vendor
//        let channel = ChatChannel(id: productHome?.companyID ?? "\(String(describing: productHome?.companyID))", name: "")
//                  let uiConfig = ChatUIConfiguration(primaryColor: UIColor(hexString: "#0084ff"),
//                                                        secondaryColor: UIColor(hexString: "#f0f0f0"),
//                                                        inputTextViewBgColor: UIColor(hexString: "#f4f4f6"),
//                                                        inputTextViewTextColor: .black,
//                                                        inputPlaceholderTextColor: UIColor(hexString: "#979797"))
//                  let vc = ChatThreadViewController(user: user, channel: channel, uiConfig: uiConfig)
//                  navigationController?.pushViewController(vc, animated: true)

               
    }
    
    
}
extension AllProductsVC: UICollectionViewDelegateFlowLayout{
    
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = (UIScreen.main.bounds.height / 3.1) - 3
        return CGSize(width: (collectionView.frame.width / 2) - 5, height: height)

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let profileProdVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileProductVC") as! ProfileProductVC
     if collectionView == allProductHome {
     let product = products[indexPath.item]

  print("\(product.product) is selected")
  print("\(product.productID) is selected")
  profileProdVC.productHome = product
}else{
        let profileProdVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileProductVC") as! ProfileProductVC
        let descrption = details[indexPath.item]
print("\(description.description) is seleced")
profileProdVC.descrp = descrption
 }
     self.navigationController?.pushViewController(profileProdVC, animated: true)
    
    
}
func fetchProducts(for page: Int) -> Void {

        let ind = MyIndicator(frame: CGRect(x: 150, y: 250, width: 70, height: 70), image: UIImage(named: "bawaba_logo_last")!)
        view.addSubview(ind)
        ind.startAnimating()
let username = "support@bawabtalsharq.com"
            let password = "C16in4QukO5536UCe7R483ugvH903NVm"
            
            let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
            
        let url = "https://www.gatetoeast.com/demo4/api/products?page=\(page)&items_per_page=20&status=A"
            AF.request(url, method: .get )
                .authenticate(with: credential)
                .responseJSON { [weak self] response in
                    guard let self = self else { return }
                    do {
                        print(url)
                        print(response)
                        if let data = response.data {
                             
                            let productsResponse = try JSONDecoder().decode(Products.self, from: data)
//                            for company in productsResponse.products{
//                                let companyID = company["company_id"]
//
//                            }
                            self.products += productsResponse.products
                            print(productsResponse)
                            
                           
                            self.totalItems += productsResponse.products.count
                        

                            self.allProductHome.reloadData()


                            ind.stopAnimating()
                          
                        }
                        
                    } catch {
                        print(error)
                    }
            }
            
        }

    }
   

