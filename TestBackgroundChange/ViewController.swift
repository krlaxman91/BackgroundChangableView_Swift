//
//  ViewController.swift
//  TestBackgroundChange
//
//  Created by Laxman on 13/05/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate  {

    @IBOutlet var imageview: UIImageView!
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
   
    private var idx: Int = 0
    private let backGroundArray = [UIImage(named: "img1.jpg"),UIImage(named:"img2.jpg"), UIImage(named: "i3.jpg"), UIImage(named: "i4.jpg"), UIImage(named: "i5.jpg")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark)) as UIVisualEffectView
        visualEffectView.frame = self.view.frame
        visualEffectView.alpha = 0.5
        imageview.image = UIImage(named: "img1.jpg")
        imageview.addSubview(visualEffectView)
        
        
        NSTimer.scheduledTimerWithTimeInterval(6, target: self, selector: "changeImage", userInfo: nil, repeats: true)
    
        
        loginButton.layer.cornerRadius = 5.0
        
       userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.returnKeyType = UIReturnKeyType.Next

        passwordTextField.returnKeyType = UIReturnKeyType.Go
        
    }

    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == userNameTextField
        {
        textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else
        {
        passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches as Set<NSObject>, withEvent: event)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    func changeImage(){
        if idx == backGroundArray.count-1{
            idx = 0
        }
        else{
            idx++
        }
        var toImage = backGroundArray[idx];
        UIView.transitionWithView(self.imageview, duration: 3, options: .TransitionCrossDissolve, animations: {self.imageview.image = toImage}, completion: nil)
        
    }
    
    
    
    
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        
    }
    
    
}








//MARK:- Extension Color

extension UIColor{
    
    class func colorWithHex(hex: String, alpha: CGFloat = 1.0) -> UIColor
    {
        var rgb: CUnsignedInt = 0;
        let scanner = NSScanner(string: hex)
        
        if hex.hasPrefix("#") {
            // skip '#' character
            scanner.scanLocation = 1
        }
        scanner.scanHexInt(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0xFF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
}
}


