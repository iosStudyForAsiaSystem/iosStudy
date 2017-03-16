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
                                                   ("簡易(全て)データ", DataType.AllType)]
    @IBOutlet weak var collectionView:UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    

        //background color
        CustomUtil.paletteImageToView(self.collectionView!, imageNm: "bg_img_h_2")
        
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
 
    // MARK : - action
    
    @IBAction func onClickCloseBtn(_ sender: UIButton) {
        self.dismiss(animated: true) { 
            //
        }
    }
    
    // MARK : custom
    func onClickMenuSelect (_ sender:UIButton) {
        
        let type:DataType = DataType(rawValue: sender.tag)!

        switch type {
        case .AllType:
            //簡易で全て（グループ、単語、イメージ）のデータ生成画面に遷移
            self.presentEasyDataInputVC()
            break
        default:
            break
        }
        //基本データ生成画面に遷移
        self.presentKihonDataInputVC( dataType: type)
        
    }
    //基本データ生成画面に遷移
    func presentKihonDataInputVC (_ parentId: String? = "", dataType: DataType) {
        
        print ("presentKihonDataInputVC param:\(parentId)")
        
        let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)
        
        
        let dataInputVC: DataInputViewController = inputDataStoryboard.instantiateViewController(withIdentifier: "kihonDataInputVC") as! DataInputViewController
        
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
    
    //簡易で全て（グループ、単語、イメージ）のデータ生成画面に遷移
    func presentEasyDataInputVC () {
        
        print ("presentKihonDataInputVC param:\(parentId)")
        
        let inputDataStoryboard: UIStoryboard = UIStoryboard(name: "InputData", bundle: nil)
        
        
        let dataInputVC: EasyDataInputViewController = inputDataStoryboard.instantiateViewController(withIdentifier: "EasyDataInputVC") as! EasyDataInputViewController
        
        let navigationController:UINavigationController = UINavigationController.init(rootViewController: dataInputVC)
        
        //現在の表示VCを設定
        CustomUtil.sharedInstance.firstModalVc = self
        
        self.present(navigationController, animated: true) {
  
        }
    }

}
