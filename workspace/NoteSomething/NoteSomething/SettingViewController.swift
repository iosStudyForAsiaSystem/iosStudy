//
//  SettingViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/16.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

private let reuseIdentifier = "settingCell"

class SettingViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableview:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.tableview.register(SettingTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! SettingTableViewCell
        configureCell(cell, forRowAt: indexPath)
        return cell
    }
    
    func configureCell(_ cell: SettingTableViewCell, forRowAt indexPath: IndexPath) {
        var titleString = ""
        switch indexPath.row
        {
        case 0:
            titleString = "グループ表示名変更"
            break
            
        case 1:
            titleString = "単語リストのソート順変更"
            break
            
        default:
            break
        }
        cell.titleL.text = titleString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
