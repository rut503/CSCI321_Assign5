//
//  MasterViewController.swift
//  321_assign4
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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        //Read president.plist and throws an error if is unsuccessfull
        guard let path = Bundle.main.path(forResource: "presidents", ofType: "plist"), let xml = FileManager.default.contents(atPath: path) else {
            fatalError("Unable to access property list president.plist")
        }
        
        //property to sort President list through number provided or throw an error if unsuccessfull.
        do {
            objects = try PropertyListDecoder().decode([President].self, from: xml)
            objects.sort {
                return $0.number < $1.number
            }
        } catch {
            fatalError("Unable to access decode property list")
            
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

