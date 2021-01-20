//
//  ProfileProductVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Cosmos

class ProfileProductVC: UIViewController {

    @IBOutlet weak var segmentControall: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var buy: UIButton!
    @IBOutlet weak var chat: UIButton!
    
    var productVDetails = [ProductVendor]()
    var productVendorDetails: ProductVendor?
    var productHome: Product?
    var descrp: Detail?
//    var infoVendor: Vend?
//     var companyId = ""

    var slid = ""
    var companyID = ""
   // var conversations: Conversation?
    
    private lazy var overViewVC: OverViewVC = {
     let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
     var viewController = storyboard.instantiateViewController(withIdentifier: "OverViewVC") as! OverViewVC
     viewController.productHome = self.productHome
     viewController.productVendorDetails = self.productVendorDetails
     viewController.slid = self.slid
  
     
     self.addChild(viewController)
     
     return viewController }()
    
    private lazy var details: DetailsProductVC = {
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           var viewController = storyboard.instantiateViewController(withIdentifier: "DetailsProductVC") as! DetailsProductVC
    
           viewController.productHome = self.productHome
           viewController.productVendorDetails = self.productVendorDetails
           viewController.descrp = self.descrp
           viewController.slid = self.slid
           self.addChild(viewController)
         
           return viewController }()
       
       
       static func viewController() -> ProfileProductVC {
           return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Viewer") as! ProfileProductVC
       }
       
       
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
       
       
       
       @IBAction func segmentAction(_ sender: UISegmentedControl) {
           updateView()
       }
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    private func updateView() {
        if segmentControall.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations:{
                self.remove(asChildViewController: self.details)
                self.add(asChildViewController: self.overViewVC)
            })
        }else {
            UIView.animate(withDuration: 0.5, animations:{
                self.remove(asChildViewController: self.overViewVC)
                self.add(asChildViewController: self.details)
            })
        }
    }
    func setupView() {
        updateView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       self.setupView()
        
        buy.layer.cornerRadius = 17
        buy.clipsToBounds = true
        chat.layer.cornerRadius = 17
        chat.clipsToBounds = true
        
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
                  segmentControall.selectedSegmentIndex = 0
                  self.add(asChildViewController: self.overViewVC)
                    print("Swiped right")
                case .left:
                     segmentControall.selectedSegmentIndex = 1
                     self.add(asChildViewController: self.details)
                    print("Swiped left")
                default:
                    break
                }
            }
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }
        
       
        
       @IBAction func chat(_ sender: UIButton) {
        
        let detailsVendVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVendorVC") as! DetailsVendorVC
        
        detailsVendVC.companyId = productHome!.companyID
        
//        detailsVendVC.companyId =  self.infoVendor?.companyID ?? companyId
        self.navigationController?.pushViewController(detailsVendVC, animated: true)
        
//        guard let senderUserID = UserDefaults.standard.string(forKey: "UserID") else { return }
//        guard let senderFirstName =  UserDefaults.standard.string(forKey: "FristName") else {return}
//        guard let senderLastName = UserDefaults.standard.string(forKey: "LastName") else {return}
//        guard let senderEmail = UserDefaults.standard.string(forKey: "Email") else {return}
        /////////////////////////////////////
        
//        guard let companyID = UserDefaults.standard.string(forKey: "company_id") else {return}
        
        
//        let user = User(uid: senderUserID, firstName: senderFirstName, lastName: senderLastName, avatarURL: "", email: senderEmail, isOnline: false)
        ///////////////////////////////
//        let user1 = User(firstName: senderFirstName, lastName: senderLastName)
//
//                let channel = ChatChannel(id: "200", name: "CompanyName")
//        let uiConfig = ChatUIConfiguration(primaryColor: UIColor(hexString: "#0084ff"),
//                                                 secondaryColor: UIColor(hexString: "#f0f0f0"),
//                                                 inputTextViewBgColor: UIColor(hexString: "#f4f4f6"),
//                                                 inputTextViewTextColor: .black,
//                                                 inputPlaceholderTextColor: UIColor(hexString: "#979797"))
//           let vc = ChatThreadViewController(user: user1, channel: channel, uiConfig: uiConfig)
//           navigationController?.pushViewController(vc, animated: true)
//
//

       }
    @IBAction func buy(_ sender: UIButton) {
        
    }

}
