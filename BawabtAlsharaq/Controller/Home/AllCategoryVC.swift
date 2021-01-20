//
//  AllCategoryVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class AllCategoryVC: UIViewController {
    @IBOutlet weak var allCategorytableView: UITableView!
    
     var categories = [CategoryElement]()
     var imagePath = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        
        self.allCategorytableView.register(UINib.init(nibName: "SupliersCell", bundle: nil), forCellReuseIdentifier: "SupliersCell")
        allCategorytableView.dataSource = self
        allCategorytableView.delegate = self
        fetchCategory()
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

}
extension AllCategoryVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SupliersCell = allCategorytableView.dequeueReusableCell(withIdentifier: "SupliersCell", for: indexPath) as! SupliersCell
        let category = categories[indexPath.row]
        cell.nameVendor.text = category.category
        cell.imageVendor.sd_setImage(with: URL(string: imagePath ), placeholderImage: UIImage(named: "icon 5"))
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 50.0
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductsVC") as! ProductsVC
        let allCate = categories[indexPath.item]
        productVC.categories = allCate
        print("\(allCate.category) is selected")
        print("\(allCate.categoryID) is selected")
        
        self.navigationController?.pushViewController(productVC, animated: true)
        
    }
    func fetchCategory() -> Void {
    
        let username = "support@bawabtalsharq.com"
        let password = "C16in4QukO5536UCe7R483ugvH903NVm"
        
        let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
        
        AF.request("https://www.gatetoeast.com/demo4/api/categories", method: .get )
            .authenticate(with: credential)
            .responseJSON { [weak self] response in
                guard let self = self else { return }
                do {
                    print(response)
                    let categoryTableResponse = try JSONDecoder().decode(CategoriesModel.self, from: response.data!)
                    self.categories = categoryTableResponse.categories
                    print(categoryTableResponse)
                    self.allCategorytableView.reloadData()
                  
                    
                } catch {
                    print(error)
                }
        }
        
    }
    
    
}
