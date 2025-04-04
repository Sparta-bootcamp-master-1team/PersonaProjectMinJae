import UIKit

protocol BookHeaderButtonStackViewDelegate: AnyObject {
    func buttonTapped(at index: Int)
}

final class BookHeaderButtonStackView: UIStackView {
    
    private var buttons: [UIButton] = []
    private var lastButtonIndex: Int = 0
    private var currentButtonSelectedIndex: Int = 0
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
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let buttonIndex = Int(sender.titleLabel?.text ?? "0") else { return }
        delegate?.buttonTapped(at: buttonIndex-1)
        setButtonState(at: buttonIndex-1)
    }
    
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
