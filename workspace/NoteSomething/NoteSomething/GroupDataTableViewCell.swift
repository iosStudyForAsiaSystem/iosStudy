//
//  GroupDataTableViewCell.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit


class GroupDataTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImgView: UIImageView!
    @IBOutlet weak var groupInfoBtn: UIButton!
    
    @IBOutlet weak var groupNameL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dispCell ()  {
        
    }

    @IBAction func onClickGroupBtnAction(_ sender: UIButton) {
    }
}
