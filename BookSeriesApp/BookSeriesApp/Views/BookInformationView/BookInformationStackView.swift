import UIKit

class BookInformationStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .cyan
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
