//
//  GroupChatViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class GroupChatViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate {
    
    var groups: Groups?

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameText: UILabel!
    
    @IBAction func MemberButton(_ sender: Any) {
        performSegue(withIdentifier: "MemberSegue", sender: self)
        
    }
    
    
    
    override func viewDidLoad() {
        print("efwefwfwe2")
        print(groups)
        setTitles()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemberSegue"
        {
            let vc = segue.destination as! GroupMembersViewController
            vc.groups = groups
        }
    }

    //API
    func setTitles() {
        self.groupNameText.text = self.groups?.getGroupName()
        let gImage = (groups?.getGroupImageUrl())!
        guard let url = URL(string: gImage) else{ return }
        self.groupImage.sd_setImage(with: url)
        self.groupImage.layer.borderWidth = 1
        self.groupImage.layer.masksToBounds = true
        self.groupImage.layer.borderColor = UIColor.black.cgColor
        self.groupImage.layer.cornerRadius = self.groupImage.frame.size.height/2
        self.groupImage.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row: \(indexPath.row)")
    }
//
//    override func loadView() {
//        tableView.dataSource = self
//        tableView.delegate = self
//        view = tableView
//    }
    
//    func getGroups() {
//        Service.fetchGroups { groups in
//            self.groups = groups
//            for group in self.groups {
//                self.namesOfGroups.append(group.groupName)
//            }
//            print(groups)
//            print(self.namesOfGroups)
//            print("Start")
//            }
//    }
    

//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        return "Tasks"
//
//    }
    
//    func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
//
//        let indexPath = tableView.indexPathForSelectedRow;
//
////        let currentCell = tableView.cellForRow(at: indexPath!) as UITableViewCell?
////        currentCell.groupNameText.text = group.groupName
//        let cell = storyboard?.instantiateViewController(identifier: "LobbyViewController") as! LobbyViewController
//        groupNameText.text = self.namesOfGroups[0]
//        //print(currentCell?.textLabel!.text)
//    }

}
