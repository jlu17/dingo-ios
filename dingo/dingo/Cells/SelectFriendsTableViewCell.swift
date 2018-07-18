//
//  SelectFriendsTableViewCell.swift
//  dingo
//
//  Created by Jennifer Lu on 7/15/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit

class SelectFriendsTableViewCell: UITableViewCell {

    var friendName: UILabel!
    var friendPhoto: UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()
        friendName = UILabel(frame: CGRect(x:40, y:18, width: 240, height:30))
        friendName.textColor = UIColor.black
        contentView.addSubview(friendName)
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
