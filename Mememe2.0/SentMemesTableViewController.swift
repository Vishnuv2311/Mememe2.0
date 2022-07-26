//
//  SentMemesTableViewController.swift
//  Mememe2.0
//
//  Created by Vishnu V on 22/07/22.
//

import UIKit

// MARK: - SentMemesTableViewController: UIViewController

class SentMemesTableViewController: UITableViewController {
    
    // MARK: Properties
    
    // Get the array of sent memes
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewMeme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        tableView!.reloadData()
    }
    
    // MARK: Add button to generate new Meme image
    
    @objc func addNewMeme(_ sender: Any) {
        let editMemeController = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        editMemeController.hidesBottomBarWhenPushed = true
        navigationController?.isNavigationBarHidden = true
        self.navigationController!.pushViewController(editMemeController, animated: true)
    }
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the image and text
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = "\(meme.topText) ... \(meme.bottomText)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "SentMemesDetailViewController") as! SentMemesDetailViewController
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
