//
//  InivitationsViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class InvitationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.reloadData()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationCell") as! InvitationCell
        
        cell.senderText.text = "Mina"
        cell.groupNameText.text = "Hangout"
        
        return cell
    }
    
    
//
//
//    @IBAction func create(_ sender: Any) {
//        if(!tweetTextView.text.isEmpty){
//            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
//                self.dismiss(animated: true, completion: nil)
//            }, failure: { (error) in
//                print("Error posting tweet \(error)")
//                self.dismiss(animated: true, completion: nil)
//            })
//        }
//        else{
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//
//
//    @objc func createNewGroup {
//
//
//
//    }
    

    
    
    
    

}
