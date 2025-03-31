import UIKit

class BookHeaderButtonStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
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
    
    private func addArrangedSubviews(model: [BookAttribute]) {
        let booksCount = model.count
        for i in 1...booksCount {
            let button: UIButton = {
                let button = UIButton(type: .system)
                button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
                button.setTitleColor(UIColor.white, for: .normal)
                button.setTitle("\(i)", for: .normal)
                button.backgroundColor = .systemBlue
                button.layer.cornerRadius = 15
                return button
            }()
            self.addArrangedSubview(button)
        }
    }
    
    func bind(model: [BookAttribute]) {
        addArrangedSubviews(model: model)
    }
}
