//
//  ViewController.swift
//  GameOfThrones
//
//  Created by Alex Paul on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var seasons = [[GOTEpisode]]() {
        didSet  {
            tableView.reloadData()
        }
    }
    
    func loadData() {
        seasons = GOTEpisode.getSeasons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dump(GOTEpisode.getSeasons())
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if seasons[indexPath.section][indexPath.row].season  % 2 == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "gotCellLeft") as? GoTCell
                else{
                    fatalError("cellForRow")
            }
            
            let season = seasons[indexPath.section][indexPath.row]
            cell.configureCell(for: season)
            return cell
            
        }
        else    {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "gotCellRight") as? GoTCell
                else{
                    fatalError("cellForRow")
            }
            
            let season = seasons[indexPath.section][indexPath.row]
            cell.configureCell(for: season)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return seasons[section].first?.season.description
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasons.count
    }
}

extension ViewController: UITableViewDelegate   {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
