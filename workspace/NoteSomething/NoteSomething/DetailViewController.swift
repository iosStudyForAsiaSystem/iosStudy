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

    var detailItem: GroupDbData?
    var detailWordItem: WordDbData?

//{
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }

    func configureView() {
        // Update the user interface for the detail item.
        
        var titleString = "詳細"
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                print(detail.description)
            }
            titleString = "グループ情報詳細"
            
        } else if let detail2 = self.detailWordItem {
            
            if let label = self.detailDescriptionLabel {
                label.text = detail2.description
                print(detail2.description)
            }
            titleString = "単語情報詳細"
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

    @IBAction func onclickExitBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true){
            
        }
    }



}

