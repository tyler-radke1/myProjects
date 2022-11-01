import UIKit

protocol AthleteTableViewDelegate {
    func delegateMethod(athlete: Athlete)
}
class AthleteTableViewController:  UITableViewController, AthleteTableViewDelegate{
    
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
    }

    var athletes: [Athlete] = []
    var athleteToEdit: Athlete?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
  
    
    @IBSegueAction func addAthleteSegue(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
    
    //Make self the delegate of vc
        let vc = AthleteFormViewController(coder: coder, athlete: nil)
        vc?.delegate = self
        return vc
    }
    
    @IBSegueAction func editAthleteSegue(_ coder: NSCoder, sender: Any?) -> AthleteFormViewController? {
        
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            athleteToEdit = athletes[indexPath.row]
            
        }
        
        if let athlete = athleteToEdit {
            
            for (index,guy) in athletes.enumerated() {
                if guy == athleteToEdit {
                    athletes.remove(at: index)
                }
            }
            
            
            let vc = AthleteFormViewController(coder: coder, athlete: athlete)
            vc?.delegate = self
            return vc
        } else {
            let vc = AthleteFormViewController(coder: coder, athlete: nil)
            vc?.delegate = self
            //Make self the delegate of vc
            return vc
        }
        
        
        
    }
    
    
  

    func delegateMethod(athlete: Athlete) {
        athletes.append(athlete)
        tableView.reloadData()
      //  tableView.insertRows(at: [IndexPath(row: athletes.count, section: 0)], with: .left)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

   
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
}
