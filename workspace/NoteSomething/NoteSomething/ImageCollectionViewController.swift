//
//  ImageCollectionViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/15.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "PhotoListCell"

class ImageCollectionViewController: UICollectionViewController,PinterestLayoutDelegate{

    var photos:[Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PhotoListCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        photos = CustomUtil.sharedInstance.loadedPhotos
        
//        if let layout = self.collectionView?.collectionViewLayout as? PinterestLayout {
//            layout.delegate = self
//        }
        
        //background color
        CustomUtil.paletteImageToView(self.collectionView!, imageNm: "bg_img_h_2")
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        
        let cell:PhotoListCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoListCell
        
        print(NSStringFromCGRect(cell.frame))
        
        // Configure the cell
        
//        cell.photo = photos[indexPath.row]
        cell.backgroundColor = UIColor.green
//        let label:UILabel = UILabel(frame: cell.frame)
//        let msg = String(format: "%@ \n %@",  (cell.photo?.caption)!, (cell.photo?.comment)! )
//        label.text  =  msg
//        label.numberOfLines = 0
//        label.sizeToFit()
//        
//        cell.addSubview(label)
        
        //cell.displayInfo()
        
    
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

}
