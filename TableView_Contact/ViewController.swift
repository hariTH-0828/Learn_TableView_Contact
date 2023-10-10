import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var layoutName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        layoutName.text = "Contact"
        view.addSubview(layoutName)
    }
    
    func tableView(_ tb: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contacts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactListView", for: indexPath) as! CustomTableViewCell
        cell.contactName.text = contact.name
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
}

extension ViewController: CustomCellDelegate {
    func didTapButton(in cell: UITableViewCell, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        let detailedView = UIStoryboard(name: "ContactInfo", bundle: nil)
        if let anotherStoryboard = detailedView.instantiateViewController(withIdentifier: "ContactViewController") as? ContactInfo {
            anotherStoryboard.contactInfo = contact
            anotherStoryboard.indexPath = indexPath
            anotherStoryboard.modalPresentationStyle = .fullScreen
            self.present(anotherStoryboard, animated: true, completion: nil)
        }
    }
}

