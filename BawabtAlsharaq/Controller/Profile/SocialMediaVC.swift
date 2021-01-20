//
//  SocialMediaVC.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 26/11/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import UIKit

class SocialMediaVC: UIViewController {
    
    @IBOutlet weak var faceBook: UIView!
    @IBOutlet weak var whatsApp: UIView!
    @IBOutlet weak var youTube: UIView!
    @IBOutlet weak var instgram: UIView!
    @IBOutlet weak var twetter: UIView!
    @IBOutlet weak var linkedIn: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        faceBook.layer.cornerRadius = 8
        faceBook.clipsToBounds = true
        
        whatsApp.layer.cornerRadius = 8
        whatsApp.clipsToBounds = true
        
        youTube.layer.cornerRadius = 8
        youTube.clipsToBounds = true
        
        instgram.layer.cornerRadius = 8
        instgram.clipsToBounds = true
        
        twetter.layer.cornerRadius = 8
        twetter.clipsToBounds = true
        
        linkedIn.layer.cornerRadius = 8
        linkedIn.clipsToBounds = true
    }
    
    
    
    @IBAction func whatsApp(_ sender: UIButton) {
        let whatsApps = "https://api.whatsapp.com/send?phone=+201111526888"
        let whatsAppsUrl = NSURL(string: whatsApps)
        if UIApplication.shared.canOpenURL(whatsAppsUrl! as URL) {
            
            UIApplication.shared.openURL(whatsAppsUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: whatsApps)! as URL)
        }
    }
    
    
    
    
    
    @IBAction func linkedIN(_ sender: UIButton) {
        let linkedIn = "https://www.linkedin.com/company/bawabtalsharq"
        let linkedInUrl = NSURL(string: linkedIn)
        if UIApplication.shared.canOpenURL(linkedInUrl! as URL) {
            
            UIApplication.shared.openURL(linkedInUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: linkedIn)! as URL)
        }
    }
    
    
    
    
    @IBAction func twiteer(_ sender: UIButton) {
        let twitter = "https://twitter.com/AlsharqBawabt"
        let twitterUrl = NSURL(string: twitter)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
            
            UIApplication.shared.openURL(twitterUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: twitter)! as URL)
        }
    }
    
    
    
    
    @IBAction func youTube(_ sender: UIButton) {
        let youTube = "https://www.youtube.com/channel/UCrxsSE1877L5p9pPrb1VHsQ"
        let youTubeUrl = NSURL(string: youTube)
        if UIApplication.shared.canOpenURL(youTubeUrl! as URL) {
            
            UIApplication.shared.openURL(youTubeUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: youTube)! as URL)
        }
    }
    
    
    
    @IBAction func instgram(_ sender: UIButton) {
        let instegram = "https://www.instagram.com/bawabtalsharq_b2b"
        let instgramUrl = NSURL(string: instegram)
        if UIApplication.shared.canOpenURL(instgramUrl! as URL) {
            
            UIApplication.shared.openURL(instgramUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: instegram)! as URL)
        }
    }
    
    
    
    
    @IBAction func faceBookButon(_ sender: UIButton) {
        let facebook = "https://www.facebook.com/Bawabtalsharqegypt"
        let facebookUrl = NSURL(string: facebook)
        if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
            
            UIApplication.shared.openURL(facebookUrl! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: facebook)! as URL)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//extension UIApplication {
//    class func tryURL(urls: [String]) {
//        let application = UIApplication.sharedApplication()
//        for url in urls {
//            if application.canOpenURL(NSURL(string: url)!) {
//                application.openURL(NSURL(string: url)!)
//                return
//            }
//        }
//    }
//}
