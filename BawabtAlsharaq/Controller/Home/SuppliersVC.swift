//
//  SuppliersVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire

class SuppliersVC: UIViewController {
    
    @IBOutlet weak var vendorTableView: UITableView!
    
    var vendor = [Vend]()
    var infoVendor: Vend?
    var imagePath = ""
    var products = [Product]()
    var productHome: Product!
    
    var page = 1
    var totalItems = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        vendorTableView.rowHeight = UITableView.automaticDimension
//            vendorTableView.estimatedRowHeight = 44
        fetchCompany(for: page)
        self.navigationController?.navigationBar.isHidden = false
        vendorTableView.delegate = self
        vendorTableView.dataSource = self
        vendorTableView.register(UINib(nibName: "SupliersCell", bundle: nil), forCellReuseIdentifier: "SupliersCell")
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
}
extension SuppliersVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SupliersCell = vendorTableView.dequeueReusableCell(withIdentifier: "SupliersCell", for: indexPath) as! SupliersCell
        let vendr = vendor[indexPath.row]
        cell.nameVendor.text = vendr.company
        
        cell.imageVendor.sd_setImage(with: URL(string: imagePath ), placeholderImage: UIImage(named: "bawabt elsharq logo banar"))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoCompanyVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoVendoerVC") as! InfoVendoerVC
        if tableView == vendorTableView {
            let productView = vendor[indexPath.item]
            infoCompanyVC.infoVendor = productView
        }else{
            let productComp = products[indexPath.item]
            infoCompanyVC.product = productComp
        }
        self.navigationController?.pushViewController(infoCompanyVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == totalItems - 1 {
            page += 1
            fetchCompany(for: page)
        }
    }
    func fetchCompany(for page: Int) -> Void {
        let ind = MyIndicator(frame: CGRect(x: 160, y: 470, width: 70, height: 70), image: UIImage(named: "bawaba_logo_last")!)
        view.addSubview(ind)
        ind.startAnimating()
        let username = "support@bawabtalsharq.com"
        let password = "C16in4QukO5536UCe7R483ugvH903NVm"
        
        let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
        
        let url =  "https://www.gatetoeast.com/demo4/api/vendors/?page=\(page)&items_per_page=25&status=A&sort_by=name&sort_order=asc&extend[]=description&extend[]=full_description"
        
        AF.request(url, method: .get )
            .authenticate(with: credential)
            .responseJSON { [weak self] response in
                guard let self = self else { return }
                do {
                    print(url)
                    print(response)
                    let vendorTableResponse = try JSONDecoder().decode(Vendors.self, from: response.data!)
                    self.vendor += vendorTableResponse.vendors
                    print(vendorTableResponse)
                    self.totalItems += vendorTableResponse.vendors.count
                    
                    self.vendorTableView.reloadData()
                    ind.stopAnimating()
                    
                } catch {
                    print(error)
                }
        }
        
    }
    
    
}

