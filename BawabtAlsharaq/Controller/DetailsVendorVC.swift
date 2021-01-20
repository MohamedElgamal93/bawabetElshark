//
//  DetailsVendorVC.swift
//  BawabtAlsharaq
//
//  Created by mohamed mosadik on 03/01/2021.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
import Firebase

class DetailsVendorVC: UIViewController {
    
    @IBOutlet weak var viewInfoCompany: UIView!
    @IBOutlet weak var imageVendor: UIImageView!
    @IBOutlet weak var NameOfCompany: UILabel!
    @IBOutlet weak var emailOfSeller: UILabel!
    @IBOutlet weak var locationOfSeller: UILabel!
    @IBOutlet weak var numberOfSeller: UILabel!
    
    @IBOutlet weak var chatNow: UIButton!
    
    var infoVendor: Vend?
    var infoVendors = [Vend]()
    // var product: Product!
    var imagePath = ""
    var companyId = ""
    var encadingEmail = ""
    var  encodingSellerEmail = ""
    var rooms = [Room]()
//    var chatMessage: ChatMessage?
//    var user: User
    override func viewDidLoad() {
        super.viewDidLoad()
        getinfCompany(companyID: infoVendor?.companyID ?? companyId)
        observeRooms()
    }
    
    @IBAction func chatNow(_ sender: UIButton){
        
        openChatChannal()
    }
    
    func observeRooms(){
        
        let databaseRef = Database.database().reference()
        databaseRef.child("conversationss").observe(.childAdded) { (snapshot) in
            print(snapshot)
            if (snapshot.value as? [String : Any]) != nil{
                let room = Room.init(roomId: snapshot.key)
                self.rooms.append(room)
                print ("ggggggggggggggg\(self.rooms)")
            }
        }

    }
    
    
    
    func openChatChannal() {
        /*
        guard let userSender =  UserDefaults.standard.string(forKey: "UserID") else {return}
        
        guard let senderFirstName =  UserDefaults.standard.string(forKey: "FristName") else {return}
        
        guard let senderLastName = UserDefaults.standard.string(forKey: "LastName") else {return}
*/
        
        //DataBase
        func  safeEmail (emailAddress: String) -> String{
            var safeEmail = emailAddress.replacingOccurrences(of : ".", with : ",")
            safeEmail = safeEmail.replacingOccurrences(of : "@", with : "_")
                                return safeEmail
                                                                        }
        let Email =   UserDefaults.standard.string(forKey: "Email")

        
                        self.encadingEmail = safeEmail(emailAddress: Email as! String)
                        let  UserEmail = self.encadingEmail
        
        let sellerEmail = emailOfSeller.text!
        
        UserDefaults.standard.set(sellerEmail, forKey: "sellerEmail")
        
        
        self.encodingSellerEmail = safeEmail(emailAddress:  sellerEmail as! String)
        let sellerMail = self.encodingSellerEmail
      
        let databaseRef = Database.database().reference()
        let conversations = databaseRef.child("conversations").childByAutoId()
        
        let dataArray : [String: Any] = ["buyer" : UserEmail, "supplier" : sellerMail]
        //let dataArray : [String: Any] = ["buyer" : UserEmail, "seller" : emailOfSeller.text!]
        conversations.setValue(dataArray)
        
        
        let allCategoryVC = self.storyboard?.instantiateViewController(withIdentifier: "chatRoom") as! chatRoomViewController
        self.navigationController?.pushViewController(allCategoryVC, animated: true)
/*
        let vc = ChatViewController(with: "\(emailOfSeller.text!)", id: "1")
        
        navigationController?.pushViewController(vc, animated: true)
        
        */
        
/////////////////////////
        
        
        
        
//        let vc = ChatViewController(with: "\(emailOfSeller.text)", id: userSender)
        
//        let view = User(firstName: "M", lastName: "M")
//
//        let Sender = User(uid: userSender, firstName: senderFirstName, lastName: senderLastName, avatarURL: "", email: senderEmail, isOnline: false)
//
//          let recip = User(uid: "", firstName: "\(NameOfCompany.text!)", lastName: "", avatarURL: "", email: "\(emailOfSeller.text!)", isOnline: false)
//
//        let chats = ChatMessage(sender: Sender, recipient: recip)
//
//               let channel = ChatChannel(email: "\(emailOfSeller.text!)", name: "\(NameOfCompany.text!)")
//
//               let uiConfig = ChatUIConfiguration(primaryColor: UIColor(hexString: "#0084ff"),
//                                                  secondaryColor: UIColor(hexString: "#f0f0f0"),
//                                                  inputTextViewBgColor: UIColor(hexString: "#f4f4f6"),
//                                                  inputTextViewTextColor: .black,
//                                                  inputPlaceholderTextColor: UIColor(hexString: "#979797"))
//
//              let vc = ChatThreadViewController(user: view, chat: chats, uiConfig: uiConfig)
        
//        (user: view, channal: channel, uiConfig: uiConfig)
               
        
        
//
//       let User = User(uid: userSender, firstName: senderFirstName, lastName: senderLastName, avatarURL: "", email: senderEmail, isOnline: false, sender: <#T##User#>, recived: <#T##User#>)
//        (uid: userSender, firstName: senderFirstName, lastName: senderLastName, avatarURL: "", email: senderEmail, isOnline: false, sender: )
        
//        let recipient = User(uid: "", firstName: "\(NameOfCompany.text!)", lastName: "", avatarURL: "", email: "\(emailOfSeller.text!)", isOnline: false)
        
//       let user1 = User(firstName: "\(Sender)", lastName: "\(recipient)")
        
        
//        let chat = ChatMessage(sender: Sender, recipient: recipient)
        
//        let channal = ChatChannel(email: "\(emailOfSeller.text!)", name: "\(NameOfCompany.text!)")
        
        
//        let channel = ChatChannel(email: "\(emailOfSeller.text ?? "NoEmail")", name: "\(NameOfCompany.text!)")
        
        
        
        
//        let user = User(firstName: "Test F", lastName: "Test L")
        
        
        
        
       
//        (user: user1, chat: chat, uiConfig: uiConfig)
        
//        (user: user1, channel: channel, uiConfig: uiConfig)
        
//        let con = Conversation(id: <#T##String#>, name: <#T##String#>, otherUserEmail: <#T##String#>, latestMessage: <#T##LatestMessage#>)
        
        
        
        
        
        
        
        
        
    }
    
    func getinfCompany(companyID: String) -> Void {
        MBProgressHUD.showAdded(to: self.view, animated: true)
                   let username = "support@bawabtalsharq.com"
                   let password = "C16in4QukO5536UCe7R483ugvH903NVm"
    
                   let credential = URLCredential(user: username, password: password, persistence: URLCredential.Persistence.forSession)
    let url = "https://www.gatetoeast.com/demo4/api/vendors/\(companyID)"
        print(url)
        AF.request(url , method: .get )
                       .authenticate(with: credential)
                       .responseJSON { [weak self] response in
                           guard let self = self else { return }
    
                           do {
                               print(response)
                               if let data = response.data {
                                let infocompany = try JSONDecoder().decode(Vend.self, from: data)
                                self.NameOfCompany.text = infocompany.company
                                self.emailOfSeller.text = infocompany.email
                                self.imageVendor.sd_setImage(with: URL(string: self.imagePath ), placeholderImage: UIImage(named: "bawaba_logo_last"))
                                MBProgressHUD.hide(for: self.view, animated: true)
                               }
                            } catch {
                               print(error)
                           }
                   }
    
    
        }
    
    

}
