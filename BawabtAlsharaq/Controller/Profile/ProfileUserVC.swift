//
//  ProfileUserVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 12/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit

class ProfileUserVC: UIViewController {
    
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let FirstName =  UserDefaults.standard.string(forKey: "FristName") else {return}
        
        guard let LastName = UserDefaults.standard.string(forKey: "LastName") else {return}
        
        guard let Email = UserDefaults.standard.string(forKey: "Email") else {return}
        
        guard let NumPhone = UserDefaults.standard.string(forKey: "Phone") else {return}
        
        firstName.text = "First Name: \(FirstName)"
        lastName.text = "Last Name: \(LastName)"
        email.text = "Email: \(Email)"
        phoneNum.text = "Phone Number: \(NumPhone)"
    }
    
    
    
    
}
