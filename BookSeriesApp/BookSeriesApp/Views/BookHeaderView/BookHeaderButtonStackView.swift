import UIKit

protocol BookHeaderButtonStackViewDelegate: AnyObject {
    func buttonTapped(at index: Int)
}

final class BookHeaderButtonStackView: UIStackView {
    
    private var buttons: [UIButton] = []
    // 가장 최근에 선택된 시리즈 인덱스
    private var lastButtonIndex: Int = 0
    // 현재 선택된 시리즈 인덱스
    private var currentButtonSelectedIndex: Int = 0
    // 데이터로 받아온 시리즈의 총 개수
    private var totalCount: Int = 0 {
        didSet {
            if totalCount == oldValue { return }
            addArrangedSubviews(count: totalCount)
        }
    }
    weak var delegate: BookHeaderButtonStackViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStackView()
    }
    
    convenience init(seriesCount: Int) {
        self.init(frame: .zero)
        totalCount = seriesCount
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStackView() {
        self.axis = .horizontal
        self.spacing = 5
        self.distribution = .fill
        self.alignment = .top
    }
    
    // 시리즈 개수만큼 버튼 생성
    private func addArrangedSubviews(count: Int) {
        for i in 1...count {
            let button: UIButton = {
                let button = UIButton(type: .system)
                button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
                button.setTitleColor(UIColor.systemBlue, for: .normal)
                button.setTitle("\(i)", for: .normal)
                button.backgroundColor = .systemGray5
                button.layer.cornerRadius = 15
                button.addTarget(self,
                                 action: #selector(buttonTapped),
                                 for: .touchUpInside)
                return button
            }()
            buttons.append(button)
        }
        
        buttons[0].backgroundColor = .systemBlue
        buttons[0].setTitleColor(UIColor.white, for: .normal)
        buttons.forEach{ [weak self] in
            guard let self else { return }
            self.addArrangedSubview($0)
        }
    }
    
    // 버튼 클릭 액션
    @objc func buttonTapped(_ sender: UIButton) {
        guard let buttonIndex = Int(sender.titleLabel?.text ?? "0") else { return }
        delegate?.buttonTapped(at: buttonIndex-1)
        setButtonState(at: buttonIndex-1)
    }
    
    // 버튼 클릭시 클릭된 버튼 하이라이트, 이전 버튼은 다시 원래 상태로 전환
    private func setButtonState(at current: Int) {
        if lastButtonIndex == current { return }
        
        buttons[lastButtonIndex].setTitleColor(UIColor.systemBlue, for: .normal)
        buttons[lastButtonIndex].backgroundColor = .systemGray5
        buttons[current].setTitleColor(UIColor.white, for: .normal)
        buttons[current].backgroundColor = .systemBlue
        lastButtonIndex = current
    }
    
    func bind(count: Int) {
        totalCount = count
    }
        
}
