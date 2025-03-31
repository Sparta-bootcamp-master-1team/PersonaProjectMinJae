import UIKit

class BookChaptersStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        distribution = .fill
        spacing = 8
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
