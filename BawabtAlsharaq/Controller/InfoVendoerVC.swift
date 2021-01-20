//
//  InfoVendoerVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

class InfoVendoerVC: UIViewController {
    @IBOutlet weak var segmentVendor: UISegmentedControl!
    @IBOutlet weak var containerViewVendor: UIView!
       
       var infoVendies = [Vend]()
       var infoVendor: Vend?
       var product: Product!
       var companyId = ""
    
       private lazy var detailsVendorVC: DetailsVendorVC = {
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           var viewController = storyboard.instantiateViewController(withIdentifier: "DetailsVendorVC") as! DetailsVendorVC
           
           viewController.infoVendor = self.infoVendor
           viewController.companyId = self.companyId
        self.addChild(viewController)
            
            return viewController }()
        
        private lazy var productVendorView: ProductsVC = {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            var viewController = storyboard.instantiateViewController(withIdentifier: "ProductsVC") as! ProductsVC
            viewController.infoVendor = self.infoVendor
            viewController.campanyID = self.companyId
            self.addChild(viewController)
                return viewController }()
            
            static func viewController() -> InfoVendoerVC {
                return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Viewer") as! InfoVendoerVC
            }
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            }
            
            @IBAction func segmentAction(_ sender: UISegmentedControl) {
                updateView()
            }
            private func add(asChildViewController viewController: UIViewController) {
                addChild(viewController)
                containerViewVendor.addSubview(viewController.view)
                viewController.view.frame = containerViewVendor.bounds
                viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                viewController.didMove(toParent: self)
            }
            private func remove(asChildViewController viewController: UIViewController) {
                viewController.willMove(toParent: nil)
                viewController.view.removeFromSuperview()
                viewController.removeFromParent()
            }
            private func updateView() {
                if segmentVendor.selectedSegmentIndex == 0 {
                    UIView.animate(withDuration: 0.5, animations:{
                        self.remove(asChildViewController: self.detailsVendorVC)
                        self.add(asChildViewController: self.productVendorView)
                    })
                }else {
                    UIView.animate(withDuration: 0.5, animations:{
                        self.remove(asChildViewController: self.productVendorView)
                        self.add(asChildViewController: self.detailsVendorVC)
                    })
                }
            }
            func setupView() {
                updateView()
            }
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
            }
            
            override func viewDidAppear(_ animated: Bool) {
                super.viewDidAppear(animated)
            }
            
            
            

    override func viewDidLoad() {
        super.viewDidLoad()

       self.setupView()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    

    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

              if let swipeGesture = gesture as? UISwipeGestureRecognizer {

                  switch swipeGesture.direction {
                  case .right:
                    segmentVendor.selectedSegmentIndex = 0
                    self.add(asChildViewController: self.productVendorView)
                      print("Swiped right")
                  case .left:
                       segmentVendor.selectedSegmentIndex = 1
                       self.add(asChildViewController: self.detailsVendorVC)
                      print("Swiped left")
                  default:
                      break
                  }
              }
          }
       
    @IBAction func sellerInfo(_ sender: UIButton) {
        
        let detailsVendVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVendorVC") as! DetailsVendorVC
        
        detailsVendVC.companyId =  self.infoVendor?.companyID ?? companyId
        self.navigationController?.pushViewController(detailsVendVC, animated: true)
    }
    
    @IBAction func sendQuestion(_ sender: UIButton) {
        
    }
}
