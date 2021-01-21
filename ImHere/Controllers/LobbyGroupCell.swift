//
//  LobbyGroupCell.swift
//  ImHere
//
//  Created by Mina Lee on 11/8/20.
//

import UIKit

class LobbyGroupCell: UITableViewCell {
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupNameText: UILabel!
    @IBOutlet weak var numberText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
