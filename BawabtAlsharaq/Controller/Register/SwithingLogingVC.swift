//
//  SwithingVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 08/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire
import Reachability
import MBProgressHUD

class SwithingLogingVC: UIViewController {

    @IBOutlet weak var logASeller: UIButton!
    @IBOutlet weak var logACustomer: UIButton!
    
    var reachability: Reachability?
//    var userType = true
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   @IBAction func logAsSeller(_ sender: UIButton){
    
    let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let logASeller = mainSB.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
    
    logASeller.tagPassedOver = sender.currentTitle!
    logASeller.userTye = "V"
        
   print(sender.currentTitle)
    self.navigationController?.pushViewController(logASeller, animated: true)
            
    }

    @IBAction func logAsCustomer(_ sender: UIButton){
        
        
        let loginCustomer = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as!  LogInVC
       
        loginCustomer.tagPassedOver = sender.currentTitle!
        loginCustomer.userTye = "C"
        self.navigationController?.pushViewController(loginCustomer, animated: true)
    }
 private func goToLogin(){
       let loginVendor = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as!  LogInVC
        self.navigationController?.pushViewController(loginVendor, animated: true)
    }

}
    
//    print(sender.tag)
//    performSegue(withIdentifier: "startToTopicSegue", sender: sender)
//
//
    
//    if (logASeller != nil) {
//                  apiCallingLoginCustomer()
//                  }else{
//                      let alart = UIAlertController(title: "", message: " Login As Vendor", preferredStyle: .alert)
//                      let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                          print("close")
//                      })
//                      alart.addAction(closeAction)
//                      self.present(alart, animated: true, completion: nil)
//                  }

//
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "startToTopicSegue"{
//            let destinationVC = segue.destination as! LogInVC
//            if let button = sender as? UIButton {
//                destinationVC.tagPassedOver = button.tag
//            }
//        }
//    }
//    }
//    func apiCallingLogVendor(){
//                do {
//                self.reachability = try Reachability.init()
//                }catch{
//                    print("unableto start notifier")
//                }
//                if ((reachability!.connection) != .unavailable){
//
//                    MBProgressHUD.showAdded(to: self.view, animated: true)
//
//                    let username = "support@bawabtalsharq.com"
//                    let password = "C16in4QukO5536UCe7R483ugvH903NVm"
//
//                    let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
//
//                    let encodeURL = loginAsVendor
//                    let requestOfApi = AF.request(encodeURL, method: .get, encoding: JSONEncoding.default, headers: nil, interceptor: nil).authenticate(with: credential)
//
//                    requestOfApi.responseJSON(completionHandler: { [weak self] response in
//                                       guard let self = self else { return }
//
//                        print(response.request!)
//                        print(response.result)
//                        print(response.response!)
//
//
//                        switch response.result{
//                            case .success(let _):
//                                MBProgressHUD.hide(for: self.view, animated: true)
//                                do {
//                                    print(response)
//                                    if let data = response.data {
//                                        let loginSwitching = try JSONDecoder().decode(LoginSwitching.self, from: data)
//                                        for user in loginSwitching.users {
//                                          var userType = user["user_type"]
//
//
//                                           print(userType)
////                                            if userType == "V" {
//
//
////                                            }
//                                        }
//           self.goToLogin()
//                                    }
//                                } catch {
//                                    print(error)
//                            }
//                            case .failure(let error):
//                            print(error)
//                            MBProgressHUD.hide(for: self.view, animated: true)
//                            let alart = UIAlertController(title: "", message: "App cannot connect server", preferredStyle: .alert)
//                            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                                print("close")
//
//                            })
//                            alart.addAction(closeAction)
//                            self.present(alart, animated: true, completion: nil)
//                        }
//                    })
//
//
//                }else{
//
//                    let alart = UIAlertController(title: "", message: "Plz check Your Internet", preferredStyle: .alert)
//                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                        print("close")
//                    })
//                    alart.addAction(closeAction)
//                    self.present(alart, animated: true, completion: nil)
//
//                }
//
//
//            }
    

//        if (logACustomer != nil) {
//               apiCallingLoginCustomer()
//               }else{
//                   let alart = UIAlertController(title: "", message: " Login As Vendor", preferredStyle: .alert)
//                   let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                       print("close")
//                   })
//                   alart.addAction(closeAction)
//                   self.present(alart, animated: true, completion: nil)
//               }

    
    
//   func apiCallingLoginCustomer(){
//         do {
//                        self.reachability = try Reachability.init()
//                        }catch{
//                            print("unableto start notifier")
//                        }
//                        if ((reachability!.connection) != .unavailable){
//
//                            MBProgressHUD.showAdded(to: self.view, animated: true)
//
//                            let username = "support@bawabtalsharq.com"
//                            let password = "C16in4QukO5536UCe7R483ugvH903NVm"
//
//                            let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
//
//                            let encodeURL = loginAsCustomer
//                            let requestOfApi = AF.request(encodeURL, method: .get, encoding: JSONEncoding.default, headers: nil, interceptor: nil).authenticate(with: credential)
//
//                            requestOfApi.responseJSON(completionHandler: { [weak self] response in
//                                               guard let self = self else { return }
//
//                                print(response.request!)
//                                print(response.result)
//                                print(response.response!)
//
//
//                                switch response.result{
//                                    case .success(let _):
//                                        MBProgressHUD.hide(for: self.view, animated: true)
//                                        do {
//                                            print(response)
//                                            if let data = response.data {
//                                                let loginSwitching = try JSONDecoder().decode(LoginSwitching.self, from: data)
//                                                for user in loginSwitching.users {
//                                                    _ = user["user_type"]
//
//
//        //                                            print(userType)
//        //                                            if userType == "V" {
//
//
//        //                                            }
//                                                }
//                   self.goToLogin()
//                                            }
//                                        } catch {
//                                            print(error)
//                                    }
//                                    case .failure(let error):
//                                    print(error)
//                                    MBProgressHUD.hide(for: self.view, animated: true)
//                                    let alart = UIAlertController(title: "", message: "App cannot connect server", preferredStyle: .alert)
//                                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                                        print("close")
//
//                                    })
//                                    alart.addAction(closeAction)
//                                    self.present(alart, animated: true, completion: nil)
//                                }
//                            })
//
//
//                        }else{
//
//                            let alart = UIAlertController(title: "", message: "Plz check Your Internet", preferredStyle: .alert)
//                            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                                print("close")
//                            })
//                            alart.addAction(closeAction)
//                            self.present(alart, animated: true, completion: nil)
//
//                        }
//
//
//                    }
    
   
