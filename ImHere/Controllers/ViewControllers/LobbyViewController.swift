//
//  LobbyViewController.swift
//  ImHere
//
//  Created by Emily Laih on 11/6/20.
//

import UIKit
import Firebase
import SDWebImage

class LobbyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lobbyTableView: UITableView!
    private var groups = [Groups]()
    private var namesOfGroups = [String]()
    var group: Groups?
    
    //properties
    private var users = [User]()
    private var members = [AnyObject]()


    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    
    //lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
        getGroups()
        
        lobbyTableView.delegate = self
        lobbyTableView.dataSource = self
        self.lobbyTableView.reloadData()
        print("finish")
    }
    
    
    @IBAction func NewGroupButton(_ sender: Any) {
    }
    

    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            picker.sourceType = .camera
            
        }
        else
        {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    
    
    //API
    func authenticateUser() {
        
        if Auth.auth().currentUser?.uid == nil {
            
            print("DEBUG: User is not logged in. Present login screen here..")
        }
        else {
            
            Service.fetchOwn { users in
                self.users = users
                print("DEBUG: Self User in Lobby  \(users)")

                self.usernameLabel.text = users[0].username

                //setting own profile image to UIImageView profilePic
                guard let url = URL(string: users[0].profileImageUrl) else{ return }
                self.profilePic.sd_setImage(with: url)
                self.profilePic.layer.borderWidth = 1
                self.profilePic.layer.masksToBounds = true
                self.profilePic.layer.borderColor = UIColor.black.cgColor
                self.profilePic.layer.cornerRadius = self.profilePic.frame.size.height/2
                self.profilePic.clipsToBounds = true
                print(self.users)
            }
        }
    }

    
    func getGroups() {
        Service.fetchGroups { groups in
            self.groups = groups
            for group in self.groups {
                self.namesOfGroups.append(group.groupName)
            }
            self.lobbyTableView.reloadData()
            print(groups)
            print(self.namesOfGroups)
        }
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LobbyGroupCell") as! LobbyGroupCell
        
        let group = groups[indexPath.row]
        cell.groupNameText.text = group.groupName
        cell.numberText.text = String(group.members.count) + "/50"
        let url = URL(string: group.groupImageUrl)
        cell.groupImage.sd_setImage(with: url)
        cell.groupImage.layer.borderWidth = 1
        cell.groupImage.layer.masksToBounds = true
        cell.groupImage.layer.borderColor = UIColor.black.cgColor
        cell.groupImage.layer.cornerRadius = cell.groupImage.frame.size.height/2
        cell.groupImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        group = groups[indexPath.row]
        performSegue(withIdentifier: "GroupSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupSegue"
        {
            print("start groups")
            let vc = segue.destination as? UITabBarController
            var viewControllers = vc!.viewControllers
            let vc1 = viewControllers![0] as? UINavigationController
            let vc2 = viewControllers![1] as? UINavigationController
            viewControllers = vc1?.viewControllers
            let groupChat = viewControllers?.first as! GroupChatViewController
            print(groupChat)
            viewControllers = vc2?.viewControllers
            let groupMap = viewControllers!.first as! GroupMapViewController
            
            
            print("passing groups")
                
            groupChat.groups = group
            groupMap.groups = group
        }
    }

}
