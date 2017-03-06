//
//  DetailViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/03.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var detailItem: CommonInfo? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                print(detail.description)
            }
        }
        var titleString = "詳細"
        let dataType:DataType = (self.detailItem?.type)!
        
        switch dataType {
        case .GroupType:
            titleString = "グループ情報詳細"//(self.detailItem?.nmJp)!
            break
        case .WordType:
 
            titleString = "単語情報詳細"
            break
        case .ImageType:
            break
        default: break
            
        }
        
        self.title =  titleString
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

