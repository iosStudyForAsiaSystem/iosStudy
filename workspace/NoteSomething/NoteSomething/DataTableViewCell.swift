//
//  DataTableViewCell.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit


class GroupDataTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImgView: UIImageView!

    @IBOutlet weak var showWordListBtn: UIButton!
    
    @IBOutlet weak var groupNameL: UILabel!
    
    var groupId : String = ""
    
    weak var parentVc:MasterViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func dispCell (grpData:GroupDbData)  {
        if grpData.hasImage() {
            groupImgView.image = UIImage(named: grpData.imageNm)
        }
        self.groupId = grpData.id
        groupNameL.text = grpData.nmJp
        self.showWordListBtn.tag = Int(grpData.id)!
        
    }

  
}

class WordDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wordImgView:UIImageView!
    @IBOutlet weak var showImageListBtn: UIButton!
    @IBOutlet weak var wordNameL: UILabel!
    
    var wordId : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func dispCell (wordData:WordDbData)  {
        if wordData.hasImage() {
            wordImgView.image = UIImage(named: wordData.imageNm)
        }
        self.wordId = wordData.id
        wordNameL.text = wordData.nmJp
    }
    
}
