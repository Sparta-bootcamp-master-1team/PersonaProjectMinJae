import UIKit
import SnapKit

class BookHeaderStackView: UIStackView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Harry Potter and the Philosopher's Stone"
        return label
    }()
    
    var buttonStackView: UIStackView
    
    override init(frame: CGRect) {
        self.buttonStackView = BookHeaderButtonStackView()
        super.init(frame: frame)
        configureStackView()
        addArrangedSubviews()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        headerLabel.text = title
    }
    
    required init(coder: NSCoder) {
        self.buttonStackView = BookHeaderButtonStackView()
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.spacing = 16
        self.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    private func addArrangedSubviews() {
        self.addArrangedSubview(headerLabel)
        self.addArrangedSubview(buttonStackView)
    }
    
}
