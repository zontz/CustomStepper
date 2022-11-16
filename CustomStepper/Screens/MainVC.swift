import UIKit

final class MainVC: UIViewController {

    private lazy var stepperView = CustomStepper()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stepperView)
        stepperView.delegate = self
    }
    
    private func setupConstraints() {
        stepperView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

//MARK: - CustomStepperOutput
extension MainVC: CustomStepperOutput {
    func customStepper(_ didChangeValue: Int) {
        print(didChangeValue)
    }
}


