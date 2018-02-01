//
//  Register.swift
//  1_30_AppDemo
//
//  Created by Tsai on 2018/1/30.
//  Copyright © 2018年 Tsai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Register: UIViewController {

    
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if self.account.text == "" || self.password.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().signIn(withEmail: self.account.text!,password: self.password.text!){ (user, error) in
                if error == nil {
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(true, forKey: "isLogined")
                    userDefaults.synchronize()
                    //self.dismiss(animated: true, completion: nil)
                    let gogoVC = self.storyboard?.instantiateViewController(withIdentifier: "home")
                    self.present(gogoVC!,animated: true,completion: nil)
                    
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
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
