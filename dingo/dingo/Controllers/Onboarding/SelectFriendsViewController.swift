//
//  SelectFriendsViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/8/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import SwiftyJSON

class SelectFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var helloLabel = UILabel()
    var helloContainer: UIView!
    var currentUser: User!
    var head: UILabel!
    var tableView: UITableView!
    var nextButton = UIButton()
    var firebaseClient = FirebaseAPIClient()
    var facebookClient = FacebookAPIClient()
    var swiftyClient = SwiftyAPIClient()
    var friendsDict: NSDictionary = [:]
    // var friendsArray: Array<(key: String, value: String)> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("name: ", currentUser.name)
        
        //displaying stuff on the screen
        view.backgroundColor = mainColor
        drawContainers()
        drawHelloLabel()
        self.view.addSubview(helloContainer)
        
        //tableView stuff
        handleTable()
    }
    
    func drawHelloLabel() {
        helloLabel.text = "Welcome " + currentUser.name + "!"
        helloLabel.textColor = FlatWhite()
        helloLabel.textAlignment = .center
        helloLabel.frame = helloContainer.frame
        helloLabel.font = UIFont(name: mainFont, size: 20)
        helloContainer.addSubview(helloLabel)
    }
    
    func drawContainers() {
        helloContainer = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.midY))
        helloContainer.center =  CGPoint(x: helloContainer.frame.midX, y: helloContainer.frame.midY)
    }
    
    func drawNextButton() {
        nextButton.isHidden = false
        nextButton.backgroundColor = FlatWhite()
        nextButton.titleLabel?.font = UIFont(name: mainFont, size: 18)
        nextButton.tag = 1
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.7
        nextButton.setTitle("Next", for: [])
        nextButton.setTitleColor(mainColor, for: .normal)
        nextButton.addTarget(self, action: #selector(pressNext(_:)), for: .touchUpInside)
        // print("did all the nextButton's properties")
        self.view.addSubview(nextButton)
        // print("added button to subview")
    }
    
    func handleTable() {
        facebookClient.getFacebookFriends() { (result: NSDictionary) -> Void in
            self.friendsDict = self.swiftyClient.getFriendsJSON(result: result)
            self.drawTable()
        }
    }
    
    func drawTable () {
        head = UILabel(frame: CGRect(x: 40, y: 70, width: view.frame.width - 20, height: 40))
        head.text = "Select your dingo"
        head.font = UIFont(name: mainFont, size: 18)
        head.textColor = FlatWhite()
        view.addSubview(head)
        
        tableView = UITableView(frame: CGRect(x: 0, y:135, width: view.frame.width, height: view.frame.height-135),
                                style: UITableView.Style.plain)
        tableView.register(SelectFriendsTableViewCell.self, forCellReuseIdentifier: "selectFriendCell")
        tableView.clipsToBounds = true
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = true
        view.addSubview(tableView)
        drawNextButton()
        
        if tableView.indexPathsForSelectedRows == nil {
            nextButton.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectFriendCell") as! SelectFriendsTableViewCell
        // cell.threadNameLabel.text = threadNames[indexPath.row]
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        
//        firebaseClient.getFriendPhotoURL(friendID: friendsArray[indexPath.row].key) {
//            (photoURL: String) in
//            print("photoURL: ", photoURL)
//
////            if let imageURL = URL(string: photoURL) {
////                let imageData:Data = try! Data(contentsOf: imageURL)
////                let size = cell.frame.size.height / 1.5
////                let imageView = UIImageView(frame: CGRect(x: size / 3, y: size / 6, width: size, height: size))
////                imageView.layer.masksToBounds = false
////                imageView.layer.cornerRadius = imageView.frame.height/2
////                imageView.clipsToBounds = true
////
////                imageView.image = UIImage(data: imageData)
////
////                cell.addSubview(imageView)
////            }
//        }
        
        cell.friendName.text = Array(friendsDict)[indexPath.row].value as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        nextButton.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
        if tableView.indexPathsForSelectedRows == nil {
            nextButton.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func pressNext(_ button: UIButton) {
        print("Button clicked!")
        performSegue(withIdentifier: "friendsToMap", sender: nil)
    }
    
    func saveSelectedFriends() {
        let selectedIndexes = tableView.indexPathsForSelectedRows
        print(selectedIndexes!)
        
        var selectedIDs: [String] = []
        for index in selectedIndexes! {
            selectedIDs.append(Array(friendsDict)[index.row].key as! String)
        }
        
        firebaseClient.handleFirebaseSelectedIDs(id: currentUser.facebookID, friendIDList: selectedIDs)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveSelectedFriends()
        
        if let destinationViewController = segue.destination as? SelectMapViewController {
            destinationViewController.currentUser = currentUser
        }
    }
    

}
