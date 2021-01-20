//
//  LogInVC.swift
//  Bawabt Al sharaq
//
//  Created by mohamed mosadik on 20/12/2020.
//  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
//

import UIKit
import Reachability
import MBProgressHUD
import Alamofire
import Firebase
import Foundation



class LogInVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    var reachability: Reachability?
    var iconClick = true
    var tagPassedOver = ""
    var userTye = ""
    var encadingEmail = ""
  //  var window = UIWindow.init()

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        radiusOfBtn()
        
        if tagPassedOver == "Login as Seller"{
        
        registerBtn.setTitle("Become A Supplier", for: .normal)
        }else{
            
        }

//        if let loggedUsername = UserDefaults.standard.string(forKey: "UserID") {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
//            mainTabBarController.modalPresentationStyle = .fullScreen
//
//            self.present(mainTabBarController, animated: true, completion: nil)
//        }
    }
    
    func radiusOfBtn(){
//        loginButton.layer.cornerRadius = 8
//        loginButton.clipsToBounds = true
//        registerBtn.layer.cornerRadius = 8
//        registerBtn.clipsToBounds = true
    }
    @IBAction func showPasswordBtnPress(_ sender:  AnyObject) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            passwordLabel.isSecureTextEntry = false
        } else {
            passwordLabel.isSecureTextEntry = true
        }
    }

    @IBAction func logInBtnPress(_ sender: UIButton) {
        if emailLabel.text!.trimmed != "" || passwordLabel.text!.trimmed != "" {
           
            apiCalling()
        }
        else{
            let alart = UIAlertController(title: "", message: " Plz all field are requried", preferredStyle: .alert)
                       let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                           print("close")
                       })
                       alart.addAction(closeAction)
                       self.present(alart, animated: true, completion: nil)
                   }
        
        }
        
    func apiCalling(){
            do {
            self.reachability = try Reachability.init()
            }catch{
                print("unableto start notifier")
            }
            if ((reachability!.connection) != .unavailable){

                MBProgressHUD.showAdded(to: self.view, animated: true)
                
                let username = "support@bawabtalsharq.com"
                let password = "C16in4QukO5536UCe7R483ugvH903NVm"
                
                let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
                if userTye == "V" {
                    let encodeURL = loginAsVendor
                
                let requestOfApi = AF.request(encodeURL, method: .get, encoding: JSONEncoding.default, headers: nil, interceptor: nil).authenticate(with: credential)
                
                requestOfApi.responseJSON(completionHandler: { [weak self] response in
                                   guard let self = self else {return }
                    
                    
                    print(response.request!)
                    print(response.result)
                    print(response.response!)
                   
                    switch response.result{
                        case .success(let payload):
                            MBProgressHUD.hide(for: self.view, animated: true)
                            do {
                                print(response)
                                if let data = response.data {
                                    let usersModel = try JSONDecoder().decode(LoginSwitching.self, from: data)
                                    for user in usersModel.users {
                                        let email = user["email"]
                                        var userType = user["user_type"]
                                        
                                        print(email)
                                        print(userType)
                                        if userType == self.userTye {
                                        if email == self.emailLabel.text?.trimmed {
//////  ////////////////////////////////////                                          print(user["user_id"])\\
                                            let userID = user["user_id"]
                                            let firstName = user["firstname"]
                                            let lastName = user["lastname"]
                                            let email = user["email"]
                                            let numPhone = user["phone"]
                                            
/////////////////////////////////////////////////////////////////////////
                                            UserDefaults.standard.set(userID, forKey: "UserID")
                                            UserDefaults.standard.set(firstName, forKey: "FristName")
                                            UserDefaults.standard.set(lastName, forKey: "LastName")
                                           
                                            UserDefaults.standard.set(numPhone, forKey: "Phone")
                                            UserDefaults.standard.set(email, forKey: "Email")
                                            
                                            
                                            
                                            /*
                                            guard let  userId = userID , let userName = firstName else {
                                                return
                                            }
                                            let reference = Database.database().reference()
                                            let userss = reference.child("userss").child(userId ?? "Null")
                                            let dataArray : [String: Any] = ["username" : userName]
                                            userss.setValue(dataArray)
                                            
                                            */
                                            
                                            self.goToHome()
                                            
                                            
                                            
                                            
                                            print(UserDefaults.standard.string(forKey: "UserID"))
                                           
                                            print(UserDefaults.standard.string(forKey: "Phone"))
                                            print(UserDefaults.standard.string(forKey: "FristName"))
                                            print(UserDefaults.standard.string(forKey: "LastName"))
                                            print(UserDefaults.standard.string(forKey: "Email"))
                                            
                                            
                                        }
                                        
                                    }
                                    }
                                }
                            } catch {
                                print(error)
                        }
                        case .failure(let error):
                        print(error)
                        MBProgressHUD.hide(for: self.view, animated: true)
                        let alart = UIAlertController(title: "", message: "App cannot connect server", preferredStyle: .alert)
                        let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                            print("close")
                            
                        })
                        alart.addAction(closeAction)
                        self.present(alart, animated: true, completion: nil)
                    }
                })

                }else{
                    let encodeURL = loginAsCustomer
                                    
                                    
                                    let requestOfApi = AF.request(encodeURL, method: .get, encoding: JSONEncoding.default, headers: nil, interceptor: nil).authenticate(with: credential)
                                    
                                    requestOfApi.responseJSON(completionHandler: { [weak self] response in
                                                       guard let self = self else {return }
                                        
                                        
                                        print(response.request!)
                                        print(response.result)
                                        print(response.response!)
                                       
                                        switch response.result{
                                            case .success(let payload):
                                                MBProgressHUD.hide(for: self.view, animated: true)
                                                do {
                                                    print(response)
                                                    if let data = response.data {
                                                        let usersModel = try JSONDecoder().decode(UsersModel.self, from: data)
                                                        for user in usersModel.users {
                                                            let email = user["email"]
                                             var userType = user["user_type"]
                                                            
                                                          print(email)
                                                            print(userType)
                if userType == self.userTye {
                                                            if email == self.emailLabel.text?.trimmed {
                    //                                            print(user["user_id"])
                                                                let userID = user["user_id"]
                                                                let firstName = user["firstname"]
                                                                let lastName = user["lastname"]
                                                                let email = user["email"]
                                                                
                                                                let numPhone = user["phone"]
                    //
        UserDefaults.standard.set(userID, forKey: "UserID")
    UserDefaults.standard.set(firstName, forKey: "FristName")
                                                                UserDefaults.standard.set(lastName, forKey: "LastName")
                                                                UserDefaults.standard.set(email, forKey: "Email")
                                                                
                                                                UserDefaults.standard.set(numPhone, forKey: "Phone")
                                      
                                                                
func  safeEmail (emailAddress: String) -> String{
    var safeEmail = emailAddress.replacingOccurrences(of : ".", with : ",")
    safeEmail = safeEmail.replacingOccurrences(of : "@", with : "_")
                        return safeEmail
                                                                }
                                                                
                                                                
                    self.encadingEmail = safeEmail(emailAddress: email as! String)
                                                                //database users
                                                                
                let  UserEmail = self.encadingEmail
                let userName = firstName
                  
                let reference = Database.database().reference()
                let userss = reference.child("userss").child((UserEmail ?? "Null") )
                let dataArray : [String: Any] = ["username" : userName]
                        userss.setValue(dataArray)
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                self.goToHome()
                                                                print(UserDefaults.standard.string(forKey: "UserID"))
                                                                print(UserDefaults.standard.string(forKey: "FristName"))
                                                                print(UserDefaults.standard.string(forKey: "LastName"))
                                                                print(UserDefaults.standard.string(forKey: "Email"))
                                                                
                                                                print(UserDefaults.standard.string(forKey: "Phone"))
                                                            }
                                                            }else{
                                                                let alart = UIAlertController(title: "", message: " Your account Not Customer", preferredStyle: .alert)
                                                                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                                                                    print("close")
                                                                })
                                                                alart.addAction(closeAction)
                                                                self.present(alart, animated: true, completion: nil)
                                                            }
                                                        }
                            
                                                    }
                                                } catch {
                                                    print(error)
                                            }
                                            case .failure(let error):
                                            print(error)
                                            MBProgressHUD.hide(for: self.view, animated: true)
                                            let alart = UIAlertController(title: "", message: "App cannot connect server", preferredStyle: .alert)
                                            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                                                print("close")
                                                
                                            })
                                            alart.addAction(closeAction)
                                            self.present(alart, animated: true, completion: nil)
                                        }
                                    })

                    
                }
            }else{

                let alart = UIAlertController(title: "", message: "Plz check Your Internet", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                    print("close")
                })
                alart.addAction(closeAction)
                self.present(alart, animated: true, completion: nil)

            }


        }
   
    @IBAction func forgetPassword(_ sender: UIButton) {
//        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let forgetPWVC = mainSB.instantiateViewController(withIdentifier: "forgetPasswordVC") as! forgetPasswordVC
//        self.navigationController?.pushViewController(forgetPWVC, animated: true)
        
        
    }
    
    @IBAction func registerBtnPress(_ sender: UIButton) {
          
        
        if tagPassedOver == "Login as Seller" {
      
        
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "RegisterVendorVC") as! RegisterVendorVC
        self.navigationController?.pushViewController(homeVC, animated: true)
        }else{
            let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = mainSB.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
    }
    
    private func goToHome() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
       //        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        var myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
//
//            var appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        self.appDelegate.window.rootViewController = myTabBar
      
        
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = mainTabBarController
//        window?.makeKeyAndVisible()
//       self.performSegue(withIdentifier: "mySegueIdentifier", sender: nil)
        
//
//        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let homeVC = mainSB.instantiateViewController(withIdentifier: "mySegueIdentifier") as! UITabBarController
//        var appDelegate = UIApplication.shared.delegate as! AppDelegate
//        self.appDelegate.window.rootViewController = homeVC
        
       
//        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigationControllerH") as! NavigationControllerH
//               self.navigationController?.pushViewController(homeVC, animated: true)
//
}

}
