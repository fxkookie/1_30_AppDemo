//
//  first.swift
//  1_30_AppDemo
//
//  Created by Tsai on 2018/2/1.
//  Copyright © 2018年 Tsai. All rights reserved.
//

import UIKit

class first: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        var isLogined = userDefaults.value(forKey: "isLogined") as? Bool
        
        if isLogined != nil && isLogined! {
            print("123")
            var goVC = self.storyboard?.instantiateViewController(withIdentifier: "home")
            self.present(goVC!,animated: true,completion: nil)
        }
        else{
            print("456")
            var login2VC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            //show window
            appDelegate.window?.rootViewController = login2VC
        }
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

}
