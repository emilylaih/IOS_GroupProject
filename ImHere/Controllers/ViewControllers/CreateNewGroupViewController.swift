//
//  CreateNewGroupViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit
import Firebase
import SDWebImage

class CreateNewGroupViewController: UIViewController {
    
    private var users = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var newGroupName: UITextField!

    @IBAction func createNewGroupButton(_ sender: Any) {
        
        if newGroupName.text != "" {
            
            guard let groupName = newGroupName.text else { return }
            
            let docRef = Firestore.firestore().collection("groups").document(groupName)
            docRef.getDocument { (document, error) in
                if let document = document {
                    if document.exists{
                        print("cannot make group Document data: \(document.data())")
                    }
                    else {
                    
                        let data = ["groupName": groupName,
                                    "groupImageUrl": nil,
                                    "members" : [Auth.auth().currentUser?.uid],
                                    "messages": nil] as [String : Any]
                    
                        Firestore.firestore().collection("groups").document(groupName).setData(data) { (error) in
                            if let error = error {
                                print("DEBUG: Failed to make new group \(error.localizedDescription)")
                                return
                            }
                            let main = UIStoryboard(name: "Main", bundle: nil)
                            let LobbyViewController = main.instantiateViewController(withIdentifier: "LobbyViewController")
                            let scene = UIApplication.shared.connectedScenes.first
                            if let delegate : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                delegate.window?.rootViewController = LobbyViewController
                            }
                            print("DEBUG: User created new group successfuly...")
                        }
                    }
                }
            }
        }
    }
        
        
}
