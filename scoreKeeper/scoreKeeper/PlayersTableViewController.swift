//
//  PlayersTableViewController.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/2/22.
//

import UIKit
protocol playersTableViewControllerDelegate {
    func passPlayerToGame()
}


class PlayersTableViewController: UITableViewController, PlayerPassing, PlayerTableViewCellDelegate {
   
   

    @IBOutlet weak var currentGameLabel: UILabel!
    
    var currentGame: Game?
    var players : [Player] = []
    var delegate: playersTableViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        currentGame?.players.sort()
        tableView.reloadData()
        
        self.title = "\(currentGame?.gameTitle ?? "Game")"
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        players = currentGame!.players
        
        tableView.reloadData()
    }
    
    func passPlayer(player: Player) {
        currentGame?.players.append(player)
        currentGame?.setGameWinner()
        tableView.reloadData()
        delegate?.passPlayerToGame()
    }
    
    func updateTableView(stepper: Double, row: Int, playerToUpdate: Player) {
        currentGame?.players[row].score = Int(stepper)
        
        let withAnimation = (players == players.sorted()) ? false : true
        
        currentGame?.players.sort()
        tableView.reloadData()

    }
    
    
    @IBSegueAction func segueToAddPlayer(_ coder: NSCoder, sender: Any?) -> AddPlayerViewController? {
        let addPlayerViewController = AddPlayerViewController(coder: coder)

        if let addPlayerViewController = addPlayerViewController {
            addPlayerViewController.delegate = self
        }


        return addPlayerViewController

    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentGame?.players.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
         
        if let players = currentGame?.players {
                cell.delegate = self
                cell.row = indexPath.row
            
                cell.playerBeingEdited = players[indexPath.row]
                cell.playerImageView.tintColor = players[indexPath.row].profileColor
                cell.playerStepper.value = Double(players[indexPath.row].score)
               
                cell.playerNameLabel.text = players[indexPath.row].name
                cell.playerScoreCounter.text = "\(Int(cell.playerStepper.value))"
               
                return cell
        }
        
            return cell

     
        // Configure the cell...

        
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentGame?.players.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
           

        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("\(players[indexPath.row].name):  \(players[indexPath.row].score)")
    }
    
}



//removes the trailing zeros from a double. Because it bothers me.
extension Double {
    func removeZeros() -> String {
        let formatter = NumberFormatter()
        
        let number = NSNumber(value: self)
        
        formatter.maximumFractionDigits = 0
        
        return String(formatter.string(from: number) ?? "")
        
    }
    
    
    
}

extension PlayersTableViewController {
    
    
    
    
    
}
