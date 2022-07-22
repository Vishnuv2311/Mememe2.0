//
//  SentMemesDetailViewController.swift
//  Mememe2.0
//
//  Created by Vishnu V on 22/07/22.
//

import UIKit

// MARK: - SentMemesDetailViewController: UIViewController

class SentMemesDetailViewController: UIViewController {
 
    // MARK: Properties
    
    var meme: Meme!
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.imageView!.image = meme.memedImage
    }
}
