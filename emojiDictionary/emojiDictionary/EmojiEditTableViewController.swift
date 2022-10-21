//
//  EmojiEditTableViewController.swift
//  emojiDictionary
//
//  Created by Tyler Radke on 10/19/22.
//

import UIKit

class EmojiEditTableViewController: UITableViewController {
    var emoji: Emoji?
    
    init?(coder: NSCoder, emoji: Emoji?) {
        super.init(coder: coder)
        self.emoji = emoji
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
        symbolTextField.text = emoji.symbol
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
        
            let symbol = symbolTextField.text!
            let name = nameTextField.text ?? ""
            let description = descriptionTextField.text ?? ""
            let usage = usageTextField.text ?? ""
            emoji = Emoji(symbol: symbol, name: name,
               description: description, usage: usage)
        
    }
    
    
    func updateSaveButtonState() {
            
                let nameText = nameTextField.text ?? ""
                let descriptionText = descriptionTextField.text ?? ""
                let usageText = usageTextField.text ?? ""
                saveButton.isEnabled = containsSingleEmoji(symbolTextField) &&
                !nameText.isEmpty && !descriptionText.isEmpty &&
                !usageText.isEmpty
            }
    
    
    
    func containsSingleEmoji(_ textField: UITextField) -> Bool {
        guard let text = textField.text, text.count == 1 else {
            return false
        }
        
        let isCombinedIntoEmoji = text.unicodeScalars.count > 1 &&
           text.unicodeScalars.first?.properties.isEmoji ?? false
        let isEmojiPresentation = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        
        return isEmojiPresentation || isCombinedIntoEmoji
    }
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
        
}
