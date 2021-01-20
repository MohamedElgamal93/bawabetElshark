//
//  ProfileVC.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 26/11/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewDown: UIView!
    
    @IBOutlet weak var signAndRegister: UIButton!
    
    @IBOutlet weak var profileUser: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTop.dropShadown()
        viewDown.dropShad()
        signAndRegister.layer.cornerRadius = 8
        signAndRegister.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileEdit(_ sender: UIButton) {
        
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profile = mainSB.instantiateViewController(withIdentifier: "ProfileUserVC") as! ProfileUserVC
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    @IBAction func signAndRegister(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let sign = mainSB.instantiateViewController(withIdentifier: "SwithingLogingVC") as! SwithingLogingVC
        self.navigationController?.pushViewController(sign, animated: true)
        
    }
    
    @IBAction func AboutUs(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let set = mainSB.instantiateViewController(withIdentifier: "AboutOurPlatVC") as! AboutOurPlatVC
        self.navigationController?.pushViewController(set, animated: true)
    }
    
    
    @IBAction func WhoWeR(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let qAndA = mainSB.instantiateViewController(withIdentifier: "WhoWeAreVC") as! WhoWeAreVC
        self.navigationController?.pushViewController(qAndA, animated: true)
    }
    
    @IBAction func ContactUs(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ship = mainSB.instantiateViewController(withIdentifier: "ConatctUsVC") as! ConatctUsVC
        self.navigationController?.pushViewController(ship, animated: true)
        
    }
    
    
    @IBAction func sociaMediaBtnPress(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let sociaMedia = mainSB.instantiateViewController(withIdentifier: "SocialMediaVC") as! SocialMediaVC
        self.navigationController?.pushViewController(sociaMedia, animated: true)
    }
    
    @IBAction func PoliceAndTerms(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let help = mainSB.instantiateViewController(withIdentifier: "PoliceAndTermVC") as! PoliceAndTermVC
        self.navigationController?.pushViewController(help, animated: true)
        
    }
    
   
    
    

}
extension UIView {
    func dropShadown(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 3
    }
    func dropShad(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 4
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 3
    }
}
