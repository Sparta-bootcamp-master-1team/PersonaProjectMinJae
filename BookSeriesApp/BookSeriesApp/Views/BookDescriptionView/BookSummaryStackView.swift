import UIKit
import SnapKit

class BookSummaryStackView: UIStackView {
    
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Summary"
        return label
    }()
    
    private let summaryTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var overViewContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let overViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 8
        distribution = .fill
        layoutMargins = .init(top: 24, left: 0, bottom: 0, right: 0)
        isLayoutMarginsRelativeArrangement = true
        addViews()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addViews() {
        overViewContentView.addSubview(overViewButton)
        addArrangedSubview(summaryLabel)
        addArrangedSubview(summaryTextLabel)
        addArrangedSubview(overViewContentView)
    }
    
    private func configureLayout() {
        overViewContentView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        overViewButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
    }
    
    func bind(model: BookAttribute) {
        summaryTextLabel.text = model.summary
    }
    
}
