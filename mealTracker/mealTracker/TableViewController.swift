//
//  TableViewController.swift
//  mealTracker
//
//  Created by Tyler Radke on 10/21/22.
//

import UIKit

class TableViewController: UITableViewController {

    var meals: [Meal] {
        let breakfast: Meal = Meal(name: "Breakfast", food: [Food(name: "Bacon", Description: "Fried Deliciousness"), Food(name: "Eggs", Description: "Scrambled"), Food(name: "Orange Juice", Description: "Not a food")])
        
        
        let lunch: Meal = Meal(name: "Lunch", food: [Food(name: "A hot and spicy", Description: "I work at mcdonalds"), Food(name: "Chicken Nuggets", Description: "Is it really chicken??"), Food(name: "Dr. Pepper", Description: "I have an addiction")])
        
        
        let dinner: Meal = Meal(name: "Dinner", food: [Food(name: "Chicken Tendies", Description: "Very easy to cook"), Food(name: "Mashed Potatos", Description: "My wife made them"), Food(name: "Mac and Cheese", Description: "We can not cook")])
    
        return [breakfast,lunch,dinner]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        var currentMeal = meals[indexPath.section].food[indexPath.row]
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = currentMeal.name
        content.secondaryText = currentMeal.Description
        
        cell.contentConfiguration = content
        

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
