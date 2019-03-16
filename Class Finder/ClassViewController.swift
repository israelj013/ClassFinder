//
//  ClassViewController.swift
//  Class Finder
//
//  Created by Kay Lab on 3/12/19.
//  Copyright © 2019 israelj. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            print(User.endpoint)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        
        let start = startTextField.text!
        let end = endTextField.text!
        
        //User.currentLocation =
        //User.endpoint =
        
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
