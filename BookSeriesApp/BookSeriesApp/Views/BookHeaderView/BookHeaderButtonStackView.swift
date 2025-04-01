import UIKit

class BookHeaderButtonStackView: UIStackView {
    
    var buttons: [UIButton] = []
    var lastButtonIndex: Int = 0
    var currentButtonSelectedIndex: Int = 0
    
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
        
        buttons[0].isSelected.toggle()
        buttons[0].backgroundColor = .systemBlue
        
        buttons.forEach{ [weak self] in
            guard let self else { return }
            self.addArrangedSubview($0)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let buttonIndex = Int(sender.titleLabel?.text ?? "0") else { return }
        print(buttonIndex)
        print("tapp")
        setButtonState(at: buttonIndex-1)
    }
    
    private func setButtonState(at current: Int) {
        if lastButtonIndex == current { return }
        
        buttons[lastButtonIndex].isSelected.toggle()
        buttons[lastButtonIndex].backgroundColor = .systemGray5
        buttons[current].isSelected.toggle()
        buttons[current].backgroundColor = .systemBlue
        lastButtonIndex = current
    }
    
    func bind(count: Int) {
        addArrangedSubviews(count: count)
    }
}
