//
//  ViewController.swift
//  DesignableUITest
//
//  Created by snowman on 2017/02/20.
//  Copyright © 2017年 snowman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let rectPhoto = CGRect(x: 0, y: 0, width: 300, height: 100)

        let view1 = UIView()
        view1.backgroundColor = .lightGray
        let view2 = UIView()
        view2.backgroundColor = .gray

        let photo1 = UIImageView(image: UIImage(named: "image1"))
        let photo2 = UIImageView(image: UIImage(named: "image2"))
        let photo3 = UIImageView(image: UIImage(named: "image3"))

        let rect = CGRect(x: 0, y: 50, width: 300, height: 300)

        let stackView = UIStackView(frame: rect)
        stackView.backgroundColor = .blue

        stackView.axis = .horizontal

        let viewArray = [view1, view2, photo1, photo2, photo3]

        viewArray.forEach {

            $0.frame  =   rectPhoto

            if $0 is  UIImageView {
             $0.contentMode = .scaleToFill
             $0.clipsToBounds = false
            }

             stackView.addArrangedSubview($0)
        }

        stackView.distribution = .fill
        stackView.alignment = .top
        stackView.clipsToBounds = true
//        photo1.contentMode = .scaleToFill
//        photo1.clipsToBounds = false
//        photo1.frame = rectPhoto
//        
//        photo2.contentMode = .scaleToFill
//        photo2.clipsToBounds = false
//        photo2.frame = rectPhoto
//        
//        photo3.contentMode = .scaleToFill
//        photo3.clipsToBounds = false
//        photo3.frame = rectPhoto
//        stackView.addArrangedSubview(view1)
//        stackView.addArrangedSubview(view2)
//        stackView.addArrangedSubview(photo1)
//        stackView.addArrangedSubview(photo2)
//        stackView.addArrangedSubview(photo3)

        //stackView.center = self.view.center
        self.view.addSubview(stackView)
        self.view.backgroundColor = .green

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

@IBDesignable class BorderedButton: UIButton {
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor:layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor ?? nil
        }

    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornderRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornderRadius
            layer.masksToBounds = cornderRadius > 0.0
        }
    }
}

@IBDesignable class BorderedLabel: UILabel {
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor:layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor ?? nil
        }

    }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornderRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornderRadius
            layer.masksToBounds = cornderRadius > 0.0
        }
    }
}
