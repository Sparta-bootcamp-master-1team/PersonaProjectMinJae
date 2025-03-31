import UIKit
import SnapKit

class BookSummaryStackView: UIStackView {
    
    private var summaryText: String = ""
    private var overViewed: Bool = UserDefaults.standard.bool(forKey: "overViewed") {
        didSet {
            if overViewed {
                overViewButton.setTitle("접기", for: .normal)
            } else {
                overViewButton.setTitle("더보기", for: .normal)
            }
        }
    }
    
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
    
    private lazy var overViewButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.addTarget(self, action: #selector(overViewButtonTapped), for: .touchUpInside)
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
    
    @objc func overViewButtonTapped() {
        overViewed.toggle()
        UserDefaults.standard.set(overViewed, forKey: "overViewed")
        self.summaryTextLabel.text = convertSummaryText(summaryText)
    }
    
    private func addViews() {
        addArrangedSubview(summaryLabel)
        addArrangedSubview(summaryTextLabel)
        addArrangedSubview(overViewContentView)
        overViewContentView.addSubview(overViewButton)
    }
    
    private func configureLayout() {
        overViewContentView.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        overViewButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
        }
        
    }
    
    func bind(model: BookAttribute) {
        guard let text = model.summary else { return }
        summaryText = text
        summaryTextLabel.text = convertSummaryText(summaryText)
        if text.count < 450 {
            overViewButton.isHidden = true
        } else {
            if overViewed {
                overViewButton.setTitle("접기", for: .normal)
            } else {
                overViewButton.setTitle("더보기", for: .normal)
            }
        }
    }
    
    private func convertSummaryText(_ text: String) -> String {
        var convertedText: String = ""
        
        if overViewed {
            convertedText = text
        } else {
            if text.count >= 450 {
                convertedText = text.prefix(450).appending("...")
            } else {
                convertedText = text
            }
        }
        return convertedText
    }
    
}
