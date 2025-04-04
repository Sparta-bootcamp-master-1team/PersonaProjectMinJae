import UIKit

final class BookDedicationStackView: UIStackView {
    
    private let dedicationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Dedication"
        return label
    }()
    
    private let dedicationTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 8
        distribution = .fill
        layoutMargins = .init(top: 24, left: 0, bottom: 0, right: 0)
        isLayoutMarginsRelativeArrangement = true
        addArrangedSubview(dedicationLabel)
        addArrangedSubview(dedicationTextLabel)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func bind(model: BookAttribute) {
        dedicationTextLabel.text = model.dedication
    }
}
