//
//  ViewController.swift
//  FileExplorer
//
//  Created by kj on 2019/4/21.
//  Copyright © 2019 GIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBOutlet weak var openTableView: UIButton?
    @IBAction func openTableView(_sender:UIButton){
        //this button will open the the table view
        performSegue(withIdentifier: "tothetable", sender: self)
    }

}

