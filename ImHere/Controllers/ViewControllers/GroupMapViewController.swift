//
//  GroupMapViewController.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class GroupMapViewController: UIViewController {
    var groups: Groups?

    @IBOutlet weak var groupPic: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    
    override func viewDidLoad() {
        print("efwefwfwe1")
        print(groups?.groupName)
        setTitles()
        super.viewDidLoad()

        //setTitles()
        // Do any additional setup after loading the view.
    }
    
    func setTitles() {
        self.groupName.text = self.groups?.groupName
        let gImage = (groups?.getGroupImageUrl())!
        guard let url = URL(string: gImage) else{ return }
        self.groupPic.sd_setImage(with: url)
        self.groupPic.layer.borderWidth = 1
        self.groupPic.layer.masksToBounds = true
        self.groupPic.layer.borderColor = UIColor.black.cgColor
        self.groupPic.layer.cornerRadius = self.groupPic.frame.size.height/2
        self.groupPic.clipsToBounds = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
