

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapButton(in cell: UITableViewCell, didSelectRowAt indexPath: IndexPath)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var iconContactInfo: UIButton!
    
    var delegate: CustomCellDelegate?
    var indexPath: IndexPath?
    
    @IBAction func contactInfoBtn(_ sender: UIButton) {
        delegate?.didTapButton(in: self, didSelectRowAt: indexPath!)
    }
}
