import UIKit
import SnapKit

final class BookSummaryStackView: UIStackView {
    
    private var summaryText: String = ""
    // 현재 선택된 시리즈의 인덱스
    private var currentIndex: Int = 0
    // 더보기 버튼 클릭상태를 UserDefaults에 저장하고 불러오기
    private var overViewedArray: [Bool] = (UserDefaults.standard.array(forKey: "overViewedArray") as? [Bool]) ?? Array(repeating: false, count: 7) {
        didSet {
            UserDefaults.standard.set(overViewedArray, forKey: "overViewedArray")
        }
    }
    
    // overViewed의 상태에 따라 버튼 타이틀 설정
    private var overViewed: Bool = false {
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
            $0.top.trailing.equalToSuperview()
        }
        
    }
    
    func bind(model: BookAttribute, index: Int) {
        guard let text = model.summary else { return }
        summaryText = text
        currentIndex = index
        overViewed = overViewedArray[currentIndex]
        summaryTextLabel.text = convertSummaryText(summaryText)
        
        // text 수에 따라 button과 타이틀 설정
        if text.count < 450 {
            overViewButton.isHidden = true
        } else {
            overViewButton.isHidden = false
            if overViewed {
                overViewButton.setTitle("접기", for: .normal)
            } else {
                overViewButton.setTitle("더보기", for: .normal)
            }
        }
    }
    
    @objc func overViewButtonTapped() {
        overViewed.toggle()
        overViewedArray[currentIndex] = overViewed
        UserDefaults.standard.set(overViewedArray, forKey: "overViewedArray")
        self.summaryTextLabel.text = convertSummaryText(summaryText)
    }
    
    // summaryText 변수에 저장하고, 450자 기준으로 변환
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
