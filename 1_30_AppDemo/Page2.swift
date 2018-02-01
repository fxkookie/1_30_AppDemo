//
//  Page2.swift
//  1_30_AppDemo
//
//  Created by Tsai on 2018/1/31.
//  Copyright © 2018年 Tsai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Page2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                    var userDefaults = UserDefaults.standard
                    userDefaults.set(false,forKey: "isLogined")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginVC")
                    present(vc!,animated: true,completion: nil)
                    print(userDefaults.bool(forKey: "isLogined"))
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
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
