import UIKit

class BookHeaderStackView: UIStackView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let buttonStackView: BookHeaderButtonStackView
    
    override init(frame: CGRect) {
        self.buttonStackView = BookHeaderButtonStackView()
        super.init(frame: frame)
        configureStackView()
        addArrangedSubviews()
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
    
    func bind(model: BookAttribute, count: Int) {
        headerLabel.text = model.title
        buttonStackView.bind(count: count)
    }
}
