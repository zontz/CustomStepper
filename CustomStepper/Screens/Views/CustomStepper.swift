import UIKit
import SnapKit

protocol CustomStepperOutput: AnyObject {
    func customStepper(_ didChangeValue: Int)
}

protocol CustomStepperInput: AnyObject {
    func update(_ value:Int)
}

final class CustomStepper: UIView {
    
    private enum ButtonState: Int, CaseIterable {
        case decrease = 0
        case increase
    }
    
    weak var delegate: CustomStepperOutput?

    private lazy var currentValue = 1
    
    private lazy var decreaseButton: UIButton = {
       let button = UIButton()
        button.tag = ButtonState.decrease.rawValue
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var currentStepValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.tag = ButtonState.increase.rawValue
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        return stackView
    }()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    private func setupViews() {
        addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(decreaseButton)
        horizontalStackView.addArrangedSubview(currentStepValueLabel)
        horizontalStackView.addArrangedSubview(increaseButton)
    }
    
    private func setupContraints() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    //MARK: - Actions
    @objc private func buttonAction(_ sender: UIButton) {
        let buttonState = ButtonState(rawValue: sender.tag)
        
        switch buttonState {
        case .decrease:
            currentValue = currentValue > 1 ? currentValue - 1 : currentValue
        case .increase:
            currentValue += 1
        default:
            return
        }
        currentStepValueLabel.text = "\(currentValue)"
        delegate?.customStepper(currentValue)
    }
}

//MARK: - CustomStepperInput
extension CustomStepper: CustomStepperInput {
    func update(_ value: Int) {
        currentValue = value
    }
}
