//
//  Create.swift
//  1_30_AppDemo
//
//  Created by Tsai on 2018/1/30.
//  Copyright © 2018年 Tsai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Create: UIViewController {

    
    @IBOutlet weak var password2: UITextField!
    @IBOutlet weak var account2: UITextField!
    @IBOutlet weak var repassword: UITextField!

    
    
    @IBAction func createAction(_ sender: Any) {
        if account2.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password",preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: account2.text!, password: password2.text!){(user, error) in
            if error == nil{
                    let alertController = UIAlertController(title: "Success", message: "You have successfully signed up",
                        preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                        self.navigationController?.popViewController(animated: true)
//                        self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "register")
//                    self.present(vc!, animated: true, completion: nil)
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

}
