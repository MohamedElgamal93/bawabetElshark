////
////  SignUpVC.swift
////  Bawabt Al sharaq
////
////  Created by mohamed mosadik on 20/12/2020.
////  Copyright © 2020 Bawabt Al sharaq. All rights reserved.
////
//
import UIKit
import Reachability
import MBProgressHUD
import Alamofire


class SignUpVC: UIViewController {

    @IBOutlet weak var imagePreson: UIImageView!
    @IBOutlet weak var TapToChangImage: UIButton!
    
    @IBOutlet weak var fristNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var numberPhone: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confiPasswordLabel: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var faceBookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!

    var reachability:Reachability?
    var imagePicket: UIImagePickerController!
    var iconClick = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Sign Up"
//        imagePreson.makeRounded()
//        registerButton.layer.cornerRadius = 8
//        registerButton.clipsToBounds = true
//        faceBookButton.layer.cornerRadius = 8
//        faceBookButton.clipsToBounds = true
//        googleButton.layer.cornerRadius = 8
//        googleButton.clipsToBounds = true
        

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicket))
        imagePreson.isUserInteractionEnabled = true
        imagePreson.addGestureRecognizer(imageTap)
        TapToChangImage.addTarget(self, action: #selector(openImagePicket), for: .touchUpInside)
        imagePicket = UIImagePickerController()
        imagePicket.allowsEditing = true
        imagePicket.sourceType = .photoLibrary
        imagePicket.delegate = self 
    }


    @objc func openImagePicket(){
        self.present(imagePicket, animated: true, completion:  nil)
        
    }
    
    @IBAction func showPasswordBtn(_ sender: UIButton) {
        if(iconClick == true) {
            
            passwordLabel.isSecureTextEntry = false
        } else {
            passwordLabel.isSecureTextEntry = true
        }

        iconClick = !iconClick
    }
    
    @IBAction func showConPasswordBtn(_ sender: UIButton) {
        if(iconClick == true) {
            
            passwordLabel.isSecureTextEntry = false
        } else {
            passwordLabel.isSecureTextEntry = true
        }

        iconClick = !iconClick
    }
    
    
    @IBAction func RegisterVendorBtn(_ sender: UIButton) {
        let mainSB:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerVendor = mainSB.instantiateViewController(withIdentifier: "RegisterVendorVC") as! RegisterVendorVC
        self.navigationController?.pushViewController(registerVendor, animated: true)
        
    }
    
    @IBAction func signUpBtnPress(_ sender: UIButton) {

        if fristNameLabel.text! != "" && lastNameLabel.text! != "" && emailLabel.text! != "" && numberPhone.text! != "" && passwordLabel.text! != "" && confiPasswordLabel.text! != "" {

          apiCalling()
            
        }else{

            let alart = UIAlertController(title: "", message: "Plz all field are requried", preferredStyle: .alert)
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
            let users = [
                "user_id": "".trimmed as AnyObject,
                "user_login": "".trimmed as AnyObject,
                "is_root": "".trimmed as AnyObject,
                "user_type": "C".trimmed as AnyObject,
                "status": "".trimmed as AnyObject,
                "firstname": self.fristNameLabel.text?.trimmed as AnyObject,
                "lastname": self.lastNameLabel.text?.trimmed as AnyObject,
                "email": self.emailLabel.text?.trimmed as AnyObject,
                "company": "".trimmed as AnyObject,
                "company_id": "".trimmed as AnyObject,
                "phone": self.numberPhone.text?.trimmed as AnyObject,
                
                "password": self.passwordLabel.text?.trimmed as AnyObject,
                "conforimPassword": self.confiPasswordLabel.text?.trimmed as AnyObject,
                
                
            ]
            let username = "support@bawabtalsharq.com"
            let password = "C16in4QukO5536UCe7R483ugvH903NVm"
            
            let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
            
            let encodeURL = apiCall
            let requestOfApi = AF.request(encodeURL, method: .post, parameters: users, encoding: JSONEncoding.default, headers: nil, interceptor: nil).authenticate(with: credential)
            
            requestOfApi.responseJSON(completionHandler: {(response) -> Void in
                
                
                print(response.request!)
                print(response.result)
                print(response.response!)
                
                
                switch response.result{
                    case .success(let payload):
                        MBProgressHUD.hide(for: self.view, animated: true)
                        if let x = payload as? Dictionary<String, AnyObject>{
                            print(x)
                            let resultValue = x as NSDictionary
                            let code = resultValue["result"] as? String
                            let message = resultValue["message"] as? String
                            
                            if code == "1"{
                                
                                let data = resultValue["data"] as! NSDictionary
                                let token = resultValue["token"] as! String
                                let userId = resultValue["id"] as! Int
                                UserDefaults.standard.set(userId, forKey: "UserId")
                                UserDefaults.standard.set("\(token)", forKey: "ApiToken")
                                UserDefaults.standard.set(data, forKey: "Data")
                                
                                let alart = UIAlertController(title: "", message: "Seccuess ", preferredStyle: .alert)
                                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                                    print("close")
                                })
                                alart.addAction(closeAction)
                                self.present(alart, animated: true, completion: nil)
                            }else{
                                let alart = UIAlertController(title: "", message: "\(message)", preferredStyle: .alert)
                                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                                    print("close")
                                })
                                alart.addAction(closeAction)
                                self.present(alart, animated: true, completion: nil)
                            }
                    }
                    case .failure(let error):
                    print(error)
                    let alart = UIAlertController(title: "", message: "App cannot connect server", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                        print("close")
                    })
                    alart.addAction(closeAction)
                    self.present(alart, animated: true, completion: nil)
                }
            })


        }else{

            let alart = UIAlertController(title: "", message: "Plz check Your Internet", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("close")
            })
            alart.addAction(closeAction)
            self.present(alart, animated: true, completion: nil)

        }


    }


}
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicket = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.imagePreson.image = imagePicket
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = .zero
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
