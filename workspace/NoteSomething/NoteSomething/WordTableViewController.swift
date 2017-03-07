//
//  WordTableViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/04.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class WordTableViewController: UITableViewController {

    
    var wordIdList:[String] = []
    
    var parentId :String? {
        didSet {
            self.wordIdList = CustomRealmUtil.sharedInstance.findWordsCountWithSameGroup(parentId: parentId!)
        }
    }
    
    var paramData: GroupDbData? {

        didSet {
            self.parentId = self.paramData?.id
            // Update the view.
            //self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertWordObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // ビュー更新
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.hasParentId() {
            return self.wordIdList.count
        } else {
            return CustomRealmUtil.sharedInstance.findAllWordsCount()
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordDataTableViewCell", for: indexPath) as! WordDataTableViewCell

        // Configure the cell...

        if self.hasParentId() {
            let targetWordId = wordIdList[(wordIdList.count-1) - indexPath.row]
            cell.dispCell(wordData:CustomRealmUtil.sharedInstance.findWordDataFromWordId(id: targetWordId)!)
        } else {
            let maxCount = CustomRealmUtil.sharedInstance.findAllWordsCount()-1
            cell.dispCell(wordData: self.findWordData(row: maxCount - indexPath.row))
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Custom
    
    func insertWordObject(_ sender: Any) {
        
        if self.hasParentId() {
           let wordId =   CustomRealmUtil.sharedInstance.makeAndInsertDummyWordData(parentId: self.parentId!)
           self.wordIdList.append(wordId)
        } else {
            CustomRealmUtil.sharedInstance.makeAndInsertDummyWordData()
        }
        
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
        //self.tableView.reloadData()
    }
    
    // ビュー更新
    func configureView() {
        
        print ("configureView groupdata.id = \(self.paramData?.id)")
        print ("configureView wordList.count = \(String(CustomRealmUtil.sharedInstance.findAllWordsCount()))")
        
        let grpName:String = (self.paramData?.nmJp)!
        self.title = "単語リスト (\(grpName))"
        
        self.tableView.reloadData()
        
    }
    
    
    func findWordData(row: Int) -> WordDbData {
        let wordData = CustomRealmUtil.sharedInstance.findWordDataFromIndex(index: row)
        return wordData!
    }
    
    //親グループIDが存在するかどうかチェック
    func hasParentId() -> Bool {
        print("hasParentId \(self.parentId ?? "")")
        
        if self.parentId != nil {
            return true
        }
        return false
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "showWordDetail" {
            
            let cell = sender as! WordDataTableViewCell
            
            let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            controller.detailWordItem = CustomRealmUtil.sharedInstance.findWordDataFromWordId(id: cell.wordId)
            controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            controller.navigationItem.leftItemsSupplementBackButton = true
            
            
        }
    }

}
