//
//  DetailViewController.swift
//  CSCI321_assign5
//
//  Created by Rutvik Patel (Z1865128).
//  Created by Aviraj Parmar (Z1861160).
//
//  Copyright © 2020 Aviraj. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!             //President name label
    
    @IBOutlet weak var numberLabel: UILabel!           //President number label
    @IBOutlet weak var politicalPartyLabel: UILabel!   //Political Party Label
    
    @IBOutlet weak var nickNameLabel: UILabel!         //Nick Name Label
    
    @IBOutlet weak var dateLabel: UILabel!             //Date Label
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageStore: ImageStore?
    /**
     Update the user interface for the detail item.
     */
    func configureView() {
        if let detail = detailItem {
            
            if let imageView = imageView, let imageStore = imageStore {
                imageStore.downloadImage(with: detail.imageUrlString, completion: {
                    (image: UIImage?) in
                    
                    imageView.image = image
                })
            }
            // name of the president
            if let label = nameLabel {
                label.text = detail.name
            }
            // political party of the president
            if let label = politicalPartyLabel {
                label.text = detail.politicalParty
            }
            // nick name of the president
            if let label = nickNameLabel {
                label.text = detail.nickName
            }
            // date of which the president served USA
            if let label = dateLabel {
                label.text = "(\(detail.startDate) to \(detail.endDate))"
            }
            // which number of president
            if let label = numberLabel {
                label.text = formatNumber(num: detail.number) + " President of the United States"
            }
        }
    }
    /**
    Converts a number of type int to a type string and formats it to look like a ordinal number (ex: 1 to 1st , 2 to 2nd).
    
    - Parameter num: Number being converted and formatted
    
    - Returns: A string of currency amount
    */
    func formatNumber (num: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        // returning Ordianl number formatted text
        return numberFormatter.string(from: NSNumber(value: num))!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: President? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
}

