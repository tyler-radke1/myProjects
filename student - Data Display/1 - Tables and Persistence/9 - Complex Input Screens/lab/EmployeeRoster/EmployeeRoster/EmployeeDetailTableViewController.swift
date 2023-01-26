
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    var employeeType: EmployeeType?
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    var isEditingBirthday = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            dobDatePicker.date = employee.dateOfBirth
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
            
            employeeType = employee.employeeType
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        
        employeeTypeLabel.text = employeeType.description
        employeeTypeLabel.textColor = .black
    }
    
    @IBSegueAction func employeeDetailSegue(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let employeeTypeTableViewController = EmployeeTypeTableViewController(coder: coder)
        
        employeeTypeTableViewController?.delegate = self
        if let type = employeeType {
            employeeTypeTableViewController?.delegate?.didSelect(employeeType: type)
        }
        
        
        return employeeTypeTableViewController
        
    }
    private func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let employeeType = employeeType else {
            return
        }
     
        
        
        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }
    
    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
  
    @IBAction func changedBirthday(_ sender: UIDatePicker) {
        dobLabel.textColor = .black
        dobLabel.text = "\(dobDatePicker.date.formatted(date: .abbreviated, time: .omitted))"
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath == [0,2] && !isEditingBirthday {
            return 0
        } else {
            //self.tableView.estimatedRowHeight = 95
            return UITableView.automaticDimension
        }
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if indexPath == [0,1] {
            isEditingBirthday.toggle()
        }
    }
}
