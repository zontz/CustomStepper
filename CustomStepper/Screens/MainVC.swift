import UIKit

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
        stepperView.addTarget(self, action: #selector(stepperAction), for: .touchUpInside)
    }
    
    @objc private func stepperAction(sender: CustomStepper) {
        print(1)
    }
}
