//
//  PlayersTableViewController.swift
//  scoreKeeper
//
//  Created by Tyler Radke on 11/2/22.
//

import UIKit

class PlayersTableViewController: UITableViewController, PlayerPassing, PlayerTableViewCellDelegate {
   
    
   
    

    var players = Player.players
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        players.sort()
        tableView.reloadData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    func passPlayer(player: Player) {
        players.append(player)
        players.sort()
        tableView.reloadData()
        
    }
    
    func updateTableView(stepper: Double, row: Int) {
        players[row].score = Int(stepper)
        
        let withAnimation = (players == players.sorted()) ? false : true
        players.sort()
        
        tableView.reloadSections([0], with: (withAnimation) ? .automatic : .none )
        
    }
    
    

    @IBSegueAction func segueToAddPlayer(_ coder: NSCoder) -> AddPlayerViewController? {
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
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerTableViewCell
        
            cell.delegate = self
            cell.row = indexPath.row
        
            cell.playerBeingEdited = players[indexPath.row]
            cell.playerImageView.tintColor = players[indexPath.row].profileColor
            cell.playerStepper.value = Double(players[indexPath.row].score)
           
            cell.playerNameLabel.text = players[indexPath.row].name
            cell.playerScoreCounter.text = "\(Int(cell.playerStepper.value))"
           
            return cell
            

     
        // Configure the cell...

        
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("\(players[indexPath.row].name):  \(players[indexPath.row].score)")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
