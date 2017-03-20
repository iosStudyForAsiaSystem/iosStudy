//
//  ImageCollectionViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/15.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "ImgCollectionViewCell"

class ImageCollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    var photos:[Photo] = []
    var parentId:String = ""
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(ImgCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertImageObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        

//        if let layout = self.collectionView?.collectionViewLayout as? PinterestLayout {
//            layout.delegate = self
//        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //photos = CustomUtil.sharedInstance.loadedPhotos
        photos =  RealmManager.sharedInstance.findPhotoDataListWithWordId(parentId)
        
        self.collectionView!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showImageDetailSegue" {
            
        }
    }
    

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let cell:ImgCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImgCollectionViewCell
        
        print(NSStringFromCGRect(cell.frame))
        
        // Configure the cell
        
        cell.photo = photos[indexPath.row]
        cell.backgroundColor = UIColor.green

        //cell.displayInfo(photo)

        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    func collectionView(_ collectionView:UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath ,
                        withWidth width:CGFloat) -> CGFloat {
        
        let photo = photos[indexPath.row]
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: photo.image!.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForCaptionAndCommentAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        
        let photo = photos[(indexPath as NSIndexPath).item]
        
        let padding = CGFloat(16)
        let captionrHeight = photo.heightForCaption(UIFont.systemFont(ofSize: 13), width: width)
        let commentHeight = photo.heightForComment(UIFont.systemFont(ofSize: 11), width: width)
        
        let height = padding + captionrHeight + commentHeight + padding
        return height
    }

    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    // MARK: - Custom
    
    func insertImageObject(_ sender: Any) {
        
        CustomUtil.presentMenuVC(self)
    }
}
