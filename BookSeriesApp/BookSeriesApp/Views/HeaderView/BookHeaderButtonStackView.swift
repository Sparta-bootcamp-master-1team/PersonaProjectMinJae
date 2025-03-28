import UIKit

class BookHeaderButtonStackView: UIStackView {
    
    private let seriesButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("1", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
        addArrangedSubviews()
    }
    
    convenience init(seriesCount: Int) {
        self.init(frame: .zero)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        self.axis = .horizontal
        self.spacing = 5
        self.distribution = .fillProportionally
        self.alignment = .top
    }
    
    private func addArrangedSubviews() {
        self.addArrangedSubview(seriesButton)
    }
}
