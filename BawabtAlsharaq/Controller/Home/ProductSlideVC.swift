//
//  ProductSlideVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire

class ProductSlideVC: UIViewController {
    
    @IBOutlet weak var nameCategory: UILabel!
       
       @IBOutlet weak var productSliderCollectionV: UICollectionView!
       
       var slid: String = ""
       var nameCat: String = ""
       
       var details = [Detail]()
       var products = [Product]()
       var product: Product!
       var page = 1
       var totalItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchProducts(categoryID: slid, for: page)
        productSliderCollectionV.dataSource? = self
        productSliderCollectionV.delegate? = self
        productSliderCollectionV.collectionViewLayout = UICollectionViewFlowLayout()
        productSliderCollectionV.register(UINib(nibName: "HomeProductCell", bundle: nil), forCellWithReuseIdentifier: "HomeProductCell")
        navigationController?.title = "Products"
        
        nameCategory.text = nameCat
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

}
extension ProductSlideVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
        let product = products[indexPath.row]
        
        let price = product.price
        let textData = Double(price)!
        let price2Desmail = String(format: "%.2f", arguments: [textData])
        cell.priceProductHome.text = "price: \(price2Desmail) $"
        
        cell.nameProductHome.text = product.product
        cell.minQutyProductHome.text = "Min Quty: \(product.minQty)"
        let imagePath = product.mainPair?.detailed.imagePath
        cell.imageProductHome.sd_setImage(with: URL(string: imagePath ?? "" ))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == totalItems - 1 {
            page += 1
            fetchProducts(categoryID: slid, for: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let profileProdVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileProductVC") as! ProfileProductVC
        
        if collectionView == productSliderCollectionV {
        let product = products[indexPath.item]
        print("\(product.product) is selected")
        print("\(product.productID) is selected")
        profileProdVC.productHome = product
        
        }else{
             let detail = details[indexPath.item]
            profileProdVC.descrp = detail
            
        }
        self.navigationController?.pushViewController(profileProdVC, animated: true)
}
}
extension ProductSlideVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (UIScreen.main.bounds.height / 3.1) - 3
        return CGSize(width: (collectionView.frame.width / 2) - 5, height: height)
    }
    
    func fetchProducts(categoryID: String, for page: Int) -> Void {
        let ind = MyIndicator(frame: CGRect(x: 160, y: 450, width: 70, height: 70), image: UIImage(named: "bawaba_logo_last")!)
        view.addSubview(ind)
        ind.startAnimating()
        let username = "support@bawabtalsharq.com"
        let password = "C16in4QukO5536UCe7R483ugvH903NVm"
        
        let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
        
        let url = "https://www.gatetoeast.com/demo4/api/products?cid=\(categoryID)&subcats=Y&page=\(page)&items_per_page=20&extend[]=description&extend[]=full_description&status=A"
        AF.request(url, method: .get )
            .authenticate(with: credential)
            .responseJSON { [weak self] response in
                guard let self = self else { return }
                do {
                    print(url)
                    print(response)
                    if let data = response.data {
                        
                        let productsSliderResponse = try JSONDecoder().decode(Products.self, from: data)
                        
                        self.products += productsSliderResponse.products
                        print(productsSliderResponse)
                        self.totalItems += productsSliderResponse.products.count
                        self.productSliderCollectionV.reloadData()
                          ind.stopAnimating()
                        //  self.stopIndicator()
                        //self.allProductHome.hideLoading()
                    }
                    
                } catch {
                    print(error)
                }
        }
        
    }
    
}

