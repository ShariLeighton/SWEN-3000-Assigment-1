//
//  SecondscreenTableViewController.swift
//  FileExplorer
//
//  Created by GIC_UWI on 2019/5/2.
//  Copyright © 2019 GIC. All rights reserved.
//

import UIKit
struct FolderInfo: Decodable{
    let folders: [String]
    let files : [String]
    let current: String
    let parent : String
    
    
}

var files = [""]
var folders = [""]
var current = ""
var parent = ""

//var newfiles = [""]
//var newfolders = [""]
//var newcurrent = ""

let delay = DispatchGroup()


 var Displaythings = [""]

class SecondscreenTableViewController: UITableViewController {
    //var folder = FolderInfo.self
//    var folder: FolderInfo?
    



    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = "http://127.0.0.1:8000/?folder=/"
//        let urlObj = URL(string: url)
//        
//        print("Table")
//        
////        delay.enter()
//        
//        URLSession.shared.dataTask(with: urlObj!) {(data,response,error) in
//            do{
//                let Folders = try JSONDecoder().decode(FolderInfo.self, from:data!)
//                
//                files = Folders.files
//                folders = Folders.folders
//                current = Folders.current
////                parent = Folders.parent
//                
//                delay.leave()
//                
//                
//                
//                
//                //let folder = Folders["folder"]
//              //for folder in Folders{
//                   //print(folder.folders)
////                }
//                //let folders = Folders["folders"]
//                
//                
//            }catch{
//                let alert = UIAlertController(title: "Oops", message: "There was an error while parsing the data", preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//                
//            }
//            
//        }.resume()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    //override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     //   return folder[FolderInfo]
   // }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        //to display the number of rows as is items in folders
//        guard let folder = self.folder else {
//            return 0
//        }
//        //max(folder.folders.count, folder.files)
//        //return   //folder.folders.count
//        return 4
//        
//        
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
            return folders.count + files.count
    }

    
//    private static let cellReuseIdentifier = "Identifier"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
       
        
        Displaythings = folders + files
        
        cell.textLabel?.text = Displaythings[indexPath.row]
        
        //cell.textLabel?.text = folders[indexPath.row]
        //cell.textLabel?.text = current[indexPath.row]
        
        
//        if cell == nil{
//            cell = UITableViewCell.init(style: .default, reuseIdentifier: SecondscreenTableViewController.cellReuseIdentifier)
//
//       }
        
       // let listitems = FolderInfo[indexPath.row]
        //cell.textLabel?.text = self.folder?.current
        
        //let folderitem1 = self.folder?.files
        //let folderitem2 = self.folder?.folders
        
        //cell.textLabel?.text = self.folder?.files
        
        //cell.textLabel?.text = indexPath.description
        //let folderitems = FolderInfo[indexPath.row]
        //cell.textLabel?.text =
//        cell.textLabel?.text = FolderInfo.(folders: <#T##[String]#>, files: <#T##[String]#>, current: <#T##String#>, parent: <#T##String#>)
        // Configure the cell...

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedrow = indexPath.row
        let currentSelection = Displaythings[selectedrow]
        

        let newURL = "http://127.0.0.1:8000/?folder=/"  + currentSelection + "/"
        let newURLObj = URL(string: newURL)
        
        
        URLSession.shared.dataTask(with: newURLObj!) {(data,response,error) in
            do{
                let newFolders = try JSONDecoder().decode(FolderInfo.self, from:data!)
                files = newFolders.files

                folders = newFolders.folders
                current = newFolders.current
                
                
                
//                tableView.reloadData()
                
            }catch
            {
                let alert = UIAlertController(title: "Oops", message: "There was an error while parsing the data", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }.resume()
        
        tableView.reloadData()
//        SecondscreenTableViewController.reloadInputViews(self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

