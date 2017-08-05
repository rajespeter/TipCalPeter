//
//  ViewController.swift
//  TipCalPeter
//
//  Created by Peter Joseph Karunanidhi on 8/4/17.
//  Copyright © 2017 M A. All rights reserved.
//

import UIKit

class TipVC: UIViewController {
    
    @IBOutlet weak var percentOption: UISegmentedControl!
    @IBOutlet weak var billedAmount: UITextField!
    
    @IBOutlet weak var emotion: UIImageView!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billedAmount.becomeFirstResponder()
        
        let defaults = UserDefaults.standard

        
                let amount = defaults.float(forKey:"amount")
                let totalAmount = defaults.float(forKey:"totalAmount")
                let tipAmount = defaults.float(forKey:"tipAmount")
                tip.text = String(format: "$%.2f", tipAmount)
                total.text = String(format: "$%.2f", totalAmount)
                billedAmount.text = String(format: "%.2f", amount)
            
       
        if let _  = defaults.object(forKey:"choosenIndex"){
        percentOption.selectedSegmentIndex = defaults.integer(forKey:"choosenIndex")
        }
        
     
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        calculateTotal()
        
        print("view did appear")
        
    }
    
    @IBAction func amountEntered(_ sender: Any) {
  
        calculateTotal()
    }
    
    @IBAction func percentChanged(_ sender: Any) {
        calculateTotal()
    }
    
    func imageAnim(_ image:UIImage){
        UIView.transition(with: self.emotion,
                          duration:2,
                          options: .transitionFlipFromTop,
                          animations: { self.emotion.image = image  },
                          completion: nil)
    }
    func calculateTotal(){
        
        var percent:Float = 0.0
        switch percentOption.selectedSegmentIndex{
        case 0:
            percent = 0.10
            imageAnim("🙂".image()!)
            
        case 1:
            percent = 0.15
            imageAnim("😊".image()!)
            
        case 2:
            percent = 0.25
            imageAnim( "🤗".image()!)
            
        default:
            print("tbd")
        }
        
       
       let fbilledAmount = Float(billedAmount.text!)  ?? 0.0
         let tipAmount = percent * fbilledAmount
        let totalAmount = tipAmount + fbilledAmount
        tip.text = String(format: "$%.2f", tipAmount)
        total.text = String(format: "$%.2f", totalAmount)
 
            
            let defaults = UserDefaults.standard
            defaults.set(fbilledAmount, forKey: "amount")
            defaults.set(totalAmount, forKey: "totalAmount")
            defaults.set(tipAmount, forKey: "tipAmount")
            defaults.synchronize()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingVC else { return }
        settingVC.tipDefault = { (defaultIndex) in
            self.percentOption.selectedSegmentIndex = defaultIndex
        }
        
    }
}

extension String {
    
    func image() -> UIImage? {
        let size = CGSize(width: 50, height: 50)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.clear.set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(CGRect(origin: CGPoint(), size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
