//
//  ImageInputViewController.swift
//  NoteSomething
//
//  Created by snowman on 2017/03/21.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ImageInputViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    //グループID
    var parentId:String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = image
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        //UIImageWriteToSavedPhotosAlbum(image: UIImage,
        //                              completionTarget: Any?,
        //                              completionSelector: Selector?,
        //                              contextInfo: UnsafeMutableRawPointer?)
        self.dismiss(animated: true, completion: nil)
    }
    
    //カメラー起動
    @IBAction func onClickLaunchCameraBtn (_ sender:UIButton) {
        
        let cameraType = UIImagePickerControllerSourceType.camera
        if UIImagePickerController.isSourceTypeAvailable(cameraType) {
            let picker = UIImagePickerController()
            picker.sourceType = cameraType
            picker.delegate = self
            self.present(picker, animated: true, completion: {
                //
            })
        }
        
    }
    
    //Photo Libary 起動
    @IBAction func onClickLaunchAlbumBtn (_ sender:UIButton) {
        
        let photoLibType = UIImagePickerControllerSourceType.photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(photoLibType) {
            let picker = UIImagePickerController()
            picker.sourceType = photoLibType
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: {
                //
            })
        }
        
    }
    
    //イメージ情報登録ボタン
    @IBAction func onClickSaveImageInfoBtn (_ sender:UIButton) {
        //TODO
    }
    
    //閉じるボタン
    @IBAction func onClickCloseBtn (_ sender:UIButton) {
        
        self.navigationController?.dismiss(animated: true) {
            //自分の画面を閉じる際に行うべき機能追加
        }
        
    }


}
