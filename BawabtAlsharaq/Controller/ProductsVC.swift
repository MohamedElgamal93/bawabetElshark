//
//  ProductsVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire

class ProductsVC: UIViewController {
    
    @IBOutlet weak var collecionView: UICollectionView!
    
    var categories: CategoryElement?
    var infoVendor: Vend?
    var slid: String = ""
    var product: Product!
    var products = [Product]()
    var details = [Detail]()
    var imagePath = ""
    var campanyID: String = ""
    var pages = 1
    var totalItem = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collecionView.dataSource? = self
        collecionView.delegate? = self
        collecionView.collectionViewLayout = UICollectionViewFlowLayout()
        collecionView.register(UINib(nibName: "HomeProductCell", bundle: nil), forCellWithReuseIdentifier: "HomeProductCell")
       
        print(campanyID)
        
        getProductCompanyOfProd(companyID: campanyID)
        getProductCompany(companyID: infoVendor?.companyID ?? "")
        
        fetchProduct(categoryID: categories?.categoryID ?? "")
        
        navigationController?.title = "Products"
        
        
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
extension ProductsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
        
        let product = products[indexPath.row]
        cell.nameProductHome.text = product.product
        
        let price = product.price
        let textData = Double(price)!
        let price2Desmail = String(format: "%.2f", arguments: [textData])
        cell.priceProductHome.text = "price: \(price2Desmail) $"
        
        cell.minQutyProductHome.text = "MinQty: \(product.minQty)"
        let imagePath = product.mainPair?.detailed.imagePath
        cell.imageProductHome.sd_setImage(with: URL(string: imagePath ?? "" ), placeholderImage: UIImage(named: "imageNotFound"))
        
        return cell
        
    }


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = (UIScreen.main.bounds.height / 3) - 3
    return CGSize(width: (collectionView.frame.width / 2) - 5, height: height)
}
func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    if indexPath.item == totalItem - 1{
        pages += 1

        
    }
}


func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let profileProdVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileProductVC") as! ProfileProductVC
    if collectionView == collecionView {
        
        let product = products[indexPath.item]
        
        print("\(product.product) is selected")
        print("\(product.productID) is selected")
        print("\(product.companyID)companyID is seleced")
        profileProdVC.productHome = product
        profileProdVC.productHome?.companyID = product.companyID
        // overViewPVC.productHome = product
        // profileProdVC.productVendorDetails = self.productV
    }else{
        let detail = details[indexPath.item]
        profileProdVC.descrp = detail
    }
    self.navigationController?.pushViewController(profileProdVC, animated: true)
    
    
}
func getProductCompany(companyID: String) -> Void {
    let username = "support@bawabtalsharq.com"
    let password = "C16in4QukO5536UCe7R483ugvH903NVm"
    
    let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
    let url = "https://www.gatetoeast.com/demo4/api/vendors/\(companyID)/products"
    print(url)
    
    AF.request(url , method: .get )
        .authenticate(with: credential)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            
            do {
                print(response)
                if let data = response.data {
                    let ProductOVendor = try JSONDecoder().decode(ProductOfVendor.self, from: data)
                    self.products = ProductOVendor.products
                    print(self.products)
                    self.collecionView.reloadData()
                }
            } catch {
                print(error)
            }
    }
    
    
}

func getProductCompanyOfProd(companyID: String) -> Void {
    let username = "support@bawabtalsharq.com"
    let password = "C16in4QukO5536UCe7R483ugvH903NVm"
    
    let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
    let url = "https://www.gatetoeast.com/demo4/api/vendors/\(companyID)/products"
    print(url)
    
    AF.request(url , method: .get )
        .authenticate(with: credential)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            
            do {
                print(response)
                if let data = response.data {
                    let ProductOVendor = try JSONDecoder().decode(ProductOfVendor.self, from: data)
                    self.products = ProductOVendor.products
                    print(self.products)
                    self.collecionView.reloadData()
                }
            } catch {
                print(error)
            }
    }
    
    
}
func getProductCompanyInfo(companyID: String) -> Void {
    let username = "support@bawabtalsharq.com"
    let password = "C16in4QukO5536UCe7R483ugvH903NVm"
    
    let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
    let url = "https://www.gatetoeast.com/demo4/api/vendors/\(companyID)/products"
    print(url)
    
    AF.request(url , method: .get )
        .authenticate(with: credential)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            
            do {
                print(response)
                if let data = response.data {
                    let ProductOVendor = try JSONDecoder().decode(ProductOfVendor.self, from: data)
                    self.products = ProductOVendor.products
                    print(self.products)
                    self.collecionView.reloadData()
                }
            } catch {
                print(error)
            }
    }
    
    
}

func fetchProduct(categoryID: String) -> Void {
    
    let username = "support@bawabtalsharq.com"
    let password = "C16in4QukO5536UCe7R483ugvH903NVm"
    
    let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
    let url = "https://www.gatetoeast.com/demo4/api/categories/\(categoryID)/products?&status=A"
    print(url)
    AF.request(url, method: .get )
        .authenticate(with: credential)
        .responseJSON { [weak self] response in
            guard let self = self else { return }
            do {
                print(response)
                if let data = response.data {
                    let productsResponse = try JSONDecoder().decode(Products.self, from: data)
                    self.products = productsResponse.products
                    print(productsResponse)
                    self.collecionView.reloadData()
                    
                    
                }
                
            } catch {
                print(error)
            }
    }
    
}

}
