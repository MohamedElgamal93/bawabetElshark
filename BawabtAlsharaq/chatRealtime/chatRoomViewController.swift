//
//  chatRoomViewController.swift
//  BawabtAlsharaq
//
//  Created by MAC on 1/18/21.
//  Copyright © 2021 MM. All rights reserved.
//

import UIKit
import Firebase
class chatRoomViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatTextField: UITextField!
    var encadingEmail = ""
    var encodingSellerEmail = ""
    var room : Room?
    var chatmessages = [Message]()
    let userId =   UserDefaults.standard.string(forKey: "UserID")
    let FristName = UserDefaults.standard.string(forKey: "FristName")
    let LastName =  UserDefaults.standard.string(forKey: "LastName")
    let Email =   UserDefaults.standard.string(forKey: "Email")
    let Phone =   UserDefaults.standard.string(forKey: "Phone")
    let sellerEmail = UserDefaults.standard.string(forKey: "sellerEmail")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        // Do any additional setup after loading the view.
        chatTableView.separatorStyle = .none
        chatTableView.allowsSelection = false
        observeMessages()
    }
    func observeMessages(){
        let dataBaseRef = Database.database().reference()
        /*
        guard let roomId = self.room?.roomId else {
            return
        }
        */
        
        
        dataBaseRef.child("conversations").child("-MRUhL4KXnOUHa1MWXEL").child("chat").observe(.childAdded )
        {(snapshot) in
   print (snapshot)
if let dataArray = snapshot.value as? [String: Any]{
guard let senderName = dataArray["name"]  as? String
, let messageText = dataArray["message"] as? String else {
                    return
                }
    let message = Message.init(messageKey: snapshot.key, senderName: senderName, messageText: messageText)
    self.chatmessages.append(message)
    self.chatTableView.reloadData()
            }
            
            
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatmessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.chatmessages[indexPath.row]
        let cell =  chatTableView.dequeueReusableCell(withIdentifier: "chatCell") as! ChatRealCell
        
        // Access messageData from Sender
        cell.setMessageForData(message: message)
        
        if (message.senderName == FristName){
            cell.setBubbletype(type: .incomming)
        }else{
            cell.setBubbletype(type: .outgoing)
        }
        
        
        //test
        /*
        cell.setBubbletype(type: .outgoing)
        if (indexPath.row == 1){
            cell.setBubbletype(type: .incomming)
        }
        */
        return cell
    }
    


    @IBAction func didPressSendButton(_ sender: UIButton) {
        
  /*
        if let messageText = self.chatTextField.text{
            self.sendMessage(text: messageText)
        }
*/
        
        //////////
        
        func  safeEmail (emailAddress: String) -> String{
            var safeEmail = emailAddress.replacingOccurrences(of : ".", with : ",")
            safeEmail = safeEmail.replacingOccurrences(of : "@", with : "_")
                                return safeEmail
                                                                        }
                                                                        
                                                                        
        self.encadingEmail = safeEmail(emailAddress: Email!)
        
        let sellerEmail = self.sellerEmail
        
        self.encodingSellerEmail = safeEmail(emailAddress: sellerEmail ?? "")
        
        
        //database users
        guard let chatText = self.chatTextField.text , chatText.isEmpty == false else {
            return
        }
        
        let databaseRef = Database.database().reference()
        let user = databaseRef.child("userss").child(self.encadingEmail)
        user.child("username").observeSingleEvent(of: .value) { (snapShot) in
            if let userName = snapShot.value as? String {
               // print ("firstname is\(userName)")
            
    let roomId = self.room?.roomId
        print ("room iddddddd \(roomId))")
                
         
                
                let dataArray :[String: Any] = ["name": userName, "message": chatText , "email": self.encodingSellerEmail, "time" : ServerValue.timestamp()]
                
               // let senderName = dataArray["senderName"]
                
let conversation =  databaseRef.child("conversations").child("-MRUhL4KXnOUHa1MWXEL")
let newMessageRef = conversation.child("chat").childByAutoId()
            newMessageRef.updateChildValues(dataArray)
                self.chatTextField.text = ""
                self.chatTextField.resignFirstResponder()

            }
        }
        /////////////
        
        
    }
    
    /*
    func sendMessage(text: String?){
        if let userId = Auth.auth().currentUser?.uid,
           let roomId = self.room?.roomId{
            
            let roomRef = Database.database().reference().child("rooms").child(roomId)
            let newMessageRef = roomRef.child("messages").childByAutoId()
            //   ServerValue.timestamp()
            let ref = Database.database().reference().child("users").child(userId).child("username")
            ref.observeSingleEvent(of: .value) { (snapshot) in
                let userName = snapshot.value as! String
                if(text != nil){
                    let messageData:[String: Any] = ["senderId": userId, "senderName" : userName, "text": text!, "date":ServerValue.timestamp()]
                    newMessageRef.updateChildValues(messageData)
                }
                
                self.chatTextField.text = ""
                self.chatTextField.resignFirstResponder()
            }
        }
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
