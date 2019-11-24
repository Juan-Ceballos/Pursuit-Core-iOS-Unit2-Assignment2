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
    
    var episode: GOTEpisode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //dump(GOTEpisode.getSeasons())
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)    {
        
        //1. we need a reference to the country detail controller
        //2. which indexPath got selected so we can retrieve the country at the indexPath
        guard let detailedViewController = segue.destination as? DetailedViewController, let indexPath = tableView.indexPathForSelectedRow else  {
            //return
            fatalError("country detail controller, indexPath failed to be configure")
        }
        
        //3. we will use the indexPath to get the selected country
        //4. then we will set the countryDC.country property
        let episode = seasons[indexPath.section][indexPath.row]
        detailedViewController.episode = episode //this needs to be set or it will be nill in country detail controller
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: GoTCell!
        
        if seasons[indexPath.section][indexPath.row].season  % 2 == 1 {
            guard let gotCell = tableView.dequeueReusableCell(withIdentifier: "gotCellLeft") as? GoTCell
                else{
                    fatalError("cellForRow")
            }
            cell = gotCell
        }
        else    {
            guard let gotCell = tableView.dequeueReusableCell(withIdentifier: "gotCellRight") as? GoTCell
                else{
                    fatalError("cellForRow")
            }
            cell = gotCell
        }
        
        let season = seasons[indexPath.section][indexPath.row]
        cell.configureCell(for: season)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(seasons[section].first?.season.description ?? "default")"
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
