//
//  MenuCollectionViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/13.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

private let reuseIdentifier = "menuCollectionCell"

class MenuCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {

    
    var parentId:String?
    
    let menuList:[(name:String,type:DataType)] = [("グループデータ", DataType.GroupType),
                                                  ("単語データ",DataType.WordType ),
                                                  ("イメージデータ", DataType.ImageType),
                                                   ("全体データ", DataType.AllType)]
    @IBOutlet weak var collectionView:UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
    
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return menuList.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
    
    
        cell.dipsplayCell(menuList[indexPath.row])
        cell.button.addTarget(self, action: #selector(onClickMenuSelect(_:)), for: UIControlEvents.touchUpInside)

        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
     func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment this method to specify if the specified item should be selected
     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

     func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

     func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
 
    // MARK : action
    
    @IBAction func onClickCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            //
        }
    }
    
    // MARK : custom
    func onClickMenuSelect (_ sender:UIButton) {
        
        let type:DataType = DataType(rawValue: sender.tag)!

        self.presentDataInputVC( dataType: type)
        
    }
    
    func presentDataInputVC (_ parentId: String? = "", dataType: DataType) {
        
        print ("presentDataInputVC param:\(parentId)")
        
        let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)
        
        
        let dataInputVC: DataInputViewController = inputDataStoryboard.instantiateViewController(withIdentifier: "DataInputVC") as! DataInputViewController
        
        let navigationController:UINavigationController = UINavigationController.init(rootViewController: dataInputVC)
        

        
        self.present(navigationController, animated: true) {

            //生成するデータタイプの設定
            dataInputVC.selectedType =  dataType
            //親情報の設定
            if parentId != nil || parentId != "" {
                
                dataInputVC.parentId = (grp:parentId!,word: "")
                
            } else {
                dataInputVC.parentId = ("","")
            }
        }
    }

}
