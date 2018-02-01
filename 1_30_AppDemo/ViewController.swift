//
//  ViewController.swift
//  1_30_AppDemo
//
//  Created by Tsai on 2018/1/30.
//  Copyright © 2018年 Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = UserDefaults.standard
        var isLogined = userDefaults.value(forKey: "isLogined") as? Bool
        
        if isLogined != nil && isLogined! {
            print("***")
        }
        else{
            print("******")
            var loginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
            present(loginVC!,animated: true,completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

