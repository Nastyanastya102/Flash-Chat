//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        navigationItem.hidesBackButton = true
        loadMessages()
    }
    
    func loadMessages() {
            
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
                .addSnapshotListener { (querySnapshot, error) in
                
                self.messages = []
                
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            print(doc)
                            let data = doc.data()
                            if let messageSender = data[Constants.FStore.senderField] as? String, let messageBody = data[Constants.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                            }
                        }
                    }
                }
            }
        }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        Task { @MainActor in
            if let mgs = messageTextfield.text, let sender = Auth.auth().currentUser?.email
            {
                do {
                    let ref = try await db.collection(Constants.FStore.collectionName).addDocument(data: [
                        Constants.FStore.senderField: sender,
                        Constants.FStore.bodyField: mgs,
                        Constants.FStore.dateField: Date().timeIntervalSince1970
                    ])
                    print("Sending message with ID: \(ref.documentID)")
                } catch {
                    print("Error sending message: \(error)")
                    
                    DispatchQueue.main.async {
                      self.messageTextfield.text = ""
                    }
                }
                
            } else {
                
            }
        }
    }
    

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        let msg = messages[indexPath.row]
        print(msg)
        if msg.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.text = msg.body
            cell.label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBuble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            cell.label.text = msg.body
            cell.label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
     
        
        return cell
    }
}

//extension ChatViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//}
