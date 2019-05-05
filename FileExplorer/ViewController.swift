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
        delay.enter()
        
        let url = "http://127.0.0.1:8000/?folder=/"
        let urlObj = URL(string: url)
        
        print("Table")
        
        //        delay.enter()
        
        URLSession.shared.dataTask(with: urlObj!) {(data,response,error) in
            do{
                let Folders = try JSONDecoder().decode(FolderInfo.self, from:data!)
                
                files = Folders.files
                folders = Folders.folders
                current = Folders.current
                //                parent = Folders.parent
                
                delay.leave()
                
                
                
                
                //let folder = Folders["folder"]
                //for folder in Folders{
                //print(folder.folders)
                //                }
                //let folders = Folders["folders"]
                
                
            }catch{
                let alert = UIAlertController(title: "Oops", message: "There was an error while parsing the data", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            
            }.resume()
    }
    @IBOutlet weak var openTableView: UIButton?
    @IBAction func openTableView(_sender:UIButton){
        //this button will open the the table view
        delay.wait()
        performSegue(withIdentifier: "tothetable", sender: self)
    }

}

