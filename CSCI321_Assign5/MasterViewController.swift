//
//  MasterViewController.swift
//  CSCI321_assign5
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//
//  Copyright © 2020 Aviraj. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [President]()
    
    let imageStore = ImageStore()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        downloadJSONData()
        
    }
    
    func downloadJSONData() {
        //Read president.plist and throws an error if is unsuccessfull
        guard let url = URL(string: "https://www.prismnet.com/~mcmahon/CS321/presidents.json") else {
            showAlert(message: "Invalid URL for JSON data")
            return
        }
        
        weak var weakSelf = self
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

        let httpResponse = response as? HTTPURLResponse

        if httpResponse!.statusCode != 200 {
            // Perform some error handling
            // UI updates, like alerts, should be directed to the main thread
            DispatchQueue.main.async {
                weakSelf!.showAlert( message:"HTTP Error: status code \(httpResponse!.statusCode)")
            }
        } else if (data == nil && error != nil) {
            // Perform some error handling
            DispatchQueue.main.async {
                weakSelf!.showAlert( message:"No data downloaded")
            }
        } else {
            // Download succeeded
            do {
                weakSelf!.objects = try JSONDecoder().decode([President].self, from: data!)
                weakSelf!.objects.sort {
                    return $0.number < $1.number
                }
                
                DispatchQueue.main.async {
                    weakSelf!.tableView!.reloadData()
                }
                
            } catch {
                weakSelf!.showAlert(message: "Unable to decode JSON data")
                
                }
            }
        }
        task.resume()
    }

    func showAlert( message: String) {
        
        let alertController = UIAlertController(title: "Error", message: message,preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.imageStore = imageStore
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    /**
     Function to exit table view container when clicked "Cancel"
     */
    @IBAction func unwindToCancel( segue: UIStoryboardSegue) {
        print("Cancel")
    }
    
    /**
     Function to exit table view container when clicked "Save"
     */
    @IBAction func unwindToSave( segue: UIStoryboardSegue) {
        print("Save")
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let object = objects[indexPath.row]
        cell.textLabel!.text = object.name
        cell.detailTextLabel!.text = object.politicalParty
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        //false:- set it to false initially cuz we are not editing it right now, will take care of it later
        return false
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

