//
//  GoTCell.swift
//  GameOfThrones
//
//  Created by Juan Ceballos on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GoTCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func configureCell(for gotEpisode: GOTEpisode)    {
        episodeImage.image = UIImage(named: gotEpisode.mediumImageID)
        nameLabel.text = gotEpisode.name
        seasonLabel.text = "S:\(gotEpisode.season.description)"
        numberLabel.text = "E:\(gotEpisode.number.description)"
    }
}
