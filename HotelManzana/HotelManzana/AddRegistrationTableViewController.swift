//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by Tyler Radke on 10/26/22.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var adultsCounter: UILabel!
    
    @IBOutlet weak var adultsStepper: UIStepper!
    
    @IBOutlet weak var childrenCounter: UILabel!
    
    @IBOutlet weak var childrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeDetailLabel: UITableViewCell!
    
    var roomType: RoomType?
    
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    let checkOutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        let midnight = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnight
        checkInDatePicker.date = midnight
        
        
        updateNumberOfGuests()
        updateRoomType()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        
        print("First Name \(firstName) Last Name: \(lastName) Email: \(email)")
        
        print("Checkin \(checkOutDatePicker.date), checkout \(checkOutDatePicker.date)")
    }
    
    
    //Custom Functions
    func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
    }
    
    func updateNumberOfGuests() {
        adultsCounter.text = "\(Int(adultsStepper.value))"
        
        childrenCounter.text = "\(Int(childrenStepper.value))"
        
    }
    
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func wifiSwitched(_ sender: UISwitch) {
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeDetailLabel.detailTextLabel?.text = "\(roomType.name)"
        } else {
            roomTypeDetailLabel.detailTextLabel?.text = "Select a room"
        }
    }
    
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerIndexPath where isCheckInDatePickerVisible == false: return 0
        case checkOutDatePickerIndexPath where isCheckOutDatePickerVisible == false: return 0
        default : return UITableView.automaticDimension
        }
        
        
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate? = self
        
        selectRoomTypeController?.selectedRoomType = roomType
        
        return selectRoomTypeController
        
      
    }
    //table view functions
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
            
        case checkInDatePickerIndexPath:
            return 216
        case checkOutDatePickerIndexPath:
            return 216
        default:
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateLabelIndexPath && isCheckOutDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelIndexPath && isCheckInDatePickerVisible == false {
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelIndexPath || indexPath == checkOutDateLabelIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        
        
        
        
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
