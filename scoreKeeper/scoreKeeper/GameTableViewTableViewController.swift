//
//  GameTableViewTableViewController.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/11/22.
//

import UIKit

class GameTableViewTableViewController: UITableViewController, playersTableViewControllerDelegate, AddNewGame {
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
    
    //delegate function for PlayersTableViewController
    func passPlayerToGame() {
        tableView.reloadData()
        
    }
    
    //delegate function for addGameViewController
    func addNewGame(game: Game) {
        Game.games.append(game)
        tableView.reloadData()
        
        // performSegue(withIdentifier: "segueToPlayerList", sender: self.tableView.cellForRow(at: [0,Game.games.count]))
    }
    
    @IBSegueAction func segueToAddGame(_ coder: NSCoder) -> AddGameViewController? {
        let addGameViewController = AddGameViewController(coder: coder)
        
        addGameViewController?.addGameDelegate = self
        
        return addGameViewController
    }
    
    @IBSegueAction func segueToPlayerList(_ coder: NSCoder, sender: Any?) -> PlayersTableViewController? {
        
        let playersTableViewController = PlayersTableViewController(coder: coder)
        
        if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            playersTableViewController?.currentGame = Game.games[indexPath.row]
        }
        
        
        
        playersTableViewController?.delegate = self
        
        return playersTableViewController
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Game.games.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameTableViewCell
        
        let currentGame = Game.games[indexPath.row]
        
        cell.gameTitleLabel.text = currentGame.gameTitle
        
        if let winner = currentGame.currentWinner?.name {
            cell.currentWinnerLabel.text = winner + " \(currentGame.currentWinner?.score ?? 0)"
        } else {
            cell.currentWinnerLabel.text = "No players yet"
        }
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Game.games.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
