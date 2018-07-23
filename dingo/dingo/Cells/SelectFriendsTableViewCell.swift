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
        let frame = contentView.frame.size
        friendName = UILabel(frame: CGRect(x:frame.height * 3, y: frame.height / 2, width: frame.width - (frame.height * 3), height:frame.height))
        friendName.textColor = UIColor.black
        friendName.font = UIFont(name: mainFont, size: 20)
        contentView.addSubview(friendName)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
