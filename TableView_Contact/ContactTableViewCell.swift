import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    
    var state: CustomState = .DISABLE {
        didSet {
            updateUIForState()
        }
    }
        
    private func updateUIForState() {
        switch state {
        case .DISABLE:
            textFieldName.isEnabled = false
        case .ENABLE:
            textFieldName.isEnabled = true
        }
    }
}

enum CustomState {
    case ENABLE
    case DISABLE
}
