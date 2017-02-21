//
//  FirstViewController.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/09.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController ,

                            UICollectionViewDelegate,
                            UICollectionViewDataSource {
    @IBOutlet weak var restartBtn: UIButton!

    @IBOutlet weak var numPadView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clearCustomData()
        numPadView.delegate = self
        numPadView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notifyAction),
                                               name: CustomData.InputCompleteNotifyKey,
                                               object: nil)

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self,
                                                  name: CustomData.InputCompleteNotifyKey,
                                                  object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDelegate
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCollectionViewCell

        configureCell(cell: cell, forItemAt: indexPath as NSIndexPath)

        return cell
    }

    func configureCell(cell: TestCollectionViewCell, forItemAt indexPath: NSIndexPath) {

        //let titleString = String( arc4random_uniform(100) + 1)

        //let titleString = String(indexPath.row + 1)

        let titleString = String(CustomData.sharedInstance.findNumberItemFromIndex(index: indexPath.row) )

        cell.numButton.setTitle(titleString, for: UIControlState.normal)
        cell.numButton.setTitle(titleString, for: UIControlState.selected)
        cell.numButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        cell.numButton.setTitleColor(UIColor.gray, for: UIControlState.selected)
        if cell.numButton.isSelected {
            cell.numButton.backgroundColor = UIColor.black
        } else {
            cell.numButton.backgroundColor = UIColor.blue
        }
        cell.numButton.layer.cornerRadius = 5

    }

//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let view =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TestCell", for: indexPath) as UIView
//        return view as! UICollectionReusableView
//    }
//    
    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

    }

    @IBAction func onClickRestart(_ sender: UIButton) {

        clearCustomData()
        self.numPadView.reloadData()
    }

    func clearCustomData() {

        CustomData.sharedInstance.currentNum = 0
        CustomData.sharedInstance.makeSamplingData(itemCount: 9, randomLimit: 100)
    }

    func presentAlertVc (msg: String) {

        let alertVc: UIAlertController = UIAlertController(title: "", message: msg,
                                                            preferredStyle: UIAlertControllerStyle.alert)

        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            // ボタンが押された時の処理を書く（クロージャ実装）
            (_: UIAlertAction!) -> Void in
            print("OK")
        })

        alertVc.addAction(defaultAction)

        self.present(alertVc, animated: true, completion: nil)

    }

    func notifyAction () {

        print ("notifyAction ")
        var message = ""
        if( CustomData.sharedInstance.isClickedAllButton() ) {
            message = "Success"
        } else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.presentAlertVc(msg: message)
        }
    }
}
