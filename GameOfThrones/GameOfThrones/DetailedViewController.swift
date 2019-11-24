//
//  detailedViewController.swift
//  GameOfThrones
//
//  Created by Juan Ceballos on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var airdateLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var episode: GOTEpisode?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let theEpisode = episode else {fatalError("UpdateUI")}
        
        nameLabel.text = theEpisode.name
        episodeImage.image = UIImage(named: theEpisode.originalImageID)
        
        seasonLabel.text = "Season:  \(theEpisode.season.description)"
        numberLabel.text = "Episode: \(theEpisode.number.description)"
        runtimeLabel.text = "Runtime: \(theEpisode.airdate)"
        airdateLabel.text = "Aitdate: \(theEpisode.airdate)"
        
        summaryTextView.text = theEpisode.summary
    }
}
