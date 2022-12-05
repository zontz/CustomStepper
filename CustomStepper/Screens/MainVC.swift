import UIKit
import SnapKit
final class MainVC: UIViewController {

    private lazy var stepperView = CustomStepper()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupStepper()
    }
    
    //MARK: - Private
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stepperView)
    }
    
    private func setupConstraints() {
        stepperView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func setupStepper() {
        stepperView.addTarget(self, action: #selector(stepperChangedValueAction), for: .valueChanged)
    }
    
    @objc private func stepperChangedValueAction(sender: CustomStepper) {
        print(sender)
        print(sender.currentValue)
    }
}
