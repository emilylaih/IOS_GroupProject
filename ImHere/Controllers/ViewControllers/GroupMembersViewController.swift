//
//  GroupMembersViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class GroupMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var groups: Groups?
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var memberTableViewCell: UITableView!
    
    override func viewDidLoad() {
        print(groups)
        print("Member UIDs")
        print(groups?.members)
        
        setTitles()
        super.viewDidLoad()
        memberTableViewCell.delegate = self
        memberTableViewCell.dataSource = self
        self.memberTableViewCell.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func setTitles() {
        self.groupName.text = self.groups?.getGroupName()
        let gImage = (groups?.getGroupImageUrl())!
        guard let url = URL(string: gImage) else{ return }
        self.groupImage.sd_setImage(with: url)
        self.groupImage.layer.borderWidth = 1
        self.groupImage.layer.masksToBounds = true
        self.groupImage.layer.borderColor = UIColor.black.cgColor
        self.groupImage.layer.cornerRadius = self.groupImage.frame.size.height/2
        self.groupImage.clipsToBounds = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups!.members.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell") as! MemberCell
        
        let members = groups?.members
        cell.memberName.text = members![indexPath.row]
//        let url = URL(string: group.groupImageUrl)
//        self.groupImage.sd_setImage(with: url)
//        self.groupImage.layer.borderWidth = 1
//        self.groupImage.layer.masksToBounds = true
//        self.groupImage.layer.borderColor = UIColor.black.cgColor
//        self.groupImage.layer.cornerRadius = cell.groupImage.frame.size.height/2
//        self.groupImage.clipsToBounds = true
        
        return cell
    }

}
