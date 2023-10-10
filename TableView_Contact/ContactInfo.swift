import UIKit
import Foundation

class ContactInfo: UIViewController, UITableViewDataSource {
    @IBOutlet var contactSaveButton: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var contactEditButton: UIButton!
    @IBOutlet var layoutBackButton: UIButton!
    @IBOutlet var userProfileView: UIImageView!
    
    var contactInfo: Contact?
    var indexPath: IndexPath?
    var isEditingMode: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        
        layoutBackButton.setTitle("Back", for: .normal)
        layoutBackButton.translatesAutoresizingMaskIntoConstraints = false
        layoutBackButton.setImage(UIImage(systemName: "chevron.backward.circle"), for: .normal)
        
        userProfileView.image = UIImage(systemName: "person.circle.fill")
        contactSaveButton.setTitle("Save", for: .normal)
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
        if let prev_view = viewController.instantiateViewController(withIdentifier: "Main") as? ViewController {
            prev_view.modalPresentationStyle = .fullScreen
            prev_view.modalTransitionStyle = .crossDissolve
            self.present(prev_view, animated: true, completion: nil)
        }
    }
    
    @IBAction func onClickEdit(_ sender: UIButton) {
        isEditingMode = !isEditingMode
        tableView.reloadData()
    }
    
    @IBAction func onClickSave(_ sender: UIButton) {
        for row in 0..<tableView.numberOfRows(inSection: 0) {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ContactTableViewCell {
                switch cell.labelName.text {
                case "Name":
                    contactInfo?.name = cell.textFieldName.text
                case "Email":
                    contactInfo?.email = cell.textFieldName.text
                case "Phone No":
                    contactInfo?.phone = cell.textFieldName.text
                default:
                    break
                }
            }
        }
        
        if let iPath = indexPath {
            contacts[iPath.row] = contactInfo!
        }
        isEditingMode = false
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contactInfo?.name == nil, contactInfo?.email != nil, contactInfo?.phone != nil{
            return 2
        }else if contactInfo?.name != nil, contactInfo?.email == nil, contactInfo?.phone != nil {
            return 2
        }else if contactInfo?.name != nil, contactInfo?.email != nil, contactInfo?.phone == nil {
            return 2
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactTableViewCell
        cell.state = isEditingMode ? .ENABLE : .DISABLE
        if indexPath.row == 0 && contactInfo?.name != nil {
            cell.labelName.text = "Name"
            cell.textFieldName.text = contactInfo?.name
        }
        else if indexPath.row == 1 && contactInfo?.email != nil {
            cell.labelName.text = "Email"
            cell.textFieldName.text = contactInfo?.email
        }
        else {
            cell.labelName.text = "Phone No"
            cell.textFieldName.text = contactInfo?.phone
        }
        return cell
    }
}
