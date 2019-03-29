//
//  DetailViewController.swift
//  DogsOBJC
//
//  Created by Carson Buckley on 3/27/19.
//  Copyright © 2019 Launch. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    
    @objc var dogImageURL: NSURL?{
        didSet{
            loadViewIfNeeded()
            CMBBreedNetworkClient.sharedController()?.fetchImageData(dogImageURL! as URL, completion: { (data, error) in
                guard let data = data else {return}
                DispatchQueue.main.async {
                    self.dogImageView.image = UIImage(data: data)
                }
            })
        }
    }
    
    //Breed Landing Pad
    @objc var breed: CMBBreed?{
        didSet{
            loadViewIfNeeded()
            dogNameLabel.text = breed?.name.capitalized
        }
    }
    //SubBreed Landing Pad
    @objc var subBreed: CMBSubBreed?{
        didSet{
            loadViewIfNeeded()
            guard let subBreedName = subBreed?.name,
                let breedName = breed?.name else {return}
            dogNameLabel.text = "\(subBreedName) \(breedName)".capitalized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
