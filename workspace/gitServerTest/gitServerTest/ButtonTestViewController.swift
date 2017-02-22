//
//  ButtonTestViewController.swift
//  gitServerTest
//
//  Created by snowman on 2017/02/21.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ButtonTestViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBAction func actionButton(_ sender: UIButton) {
        
        //let button : UIButton = sender as! UIButton
        sender.isEnabled = false
        sender.backgroundColor = .black
        
    }
    
    @IBAction func actionRestartBtn(_ sender: UIButton) {
        self.refreshButtons()
    }
    
    func refreshButtons() {
    
        for  button in self.makeButtonArray() {
            
            button.isEnabled = true
            
            self.adjustBgColor( button)
        
            button.layer.cornerRadius = 5.0
            
            button.setTitleColor(.white, for: UIControlState.normal)
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshButtons()
        
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
    
    func makeButtonArray () -> Array<UIButton> {
        return [button1, button2,button3, button4, button5, button6, button7, button8, button9 ]
    }

    
    func adjustBgColor (_ button: UIButton ) {
        
        var  bgColor:UIColor = .white
        switch button.tag {
        case  (1...3) : bgColor = .blue
        case  (4...6) : bgColor = .red
        case  (7...9) : bgColor = .green
        default: break
        }
        button.backgroundColor = bgColor
    }
}
