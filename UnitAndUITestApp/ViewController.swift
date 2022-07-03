//
//  ViewController.swift
//  UnitAndUITestApp
//
//  Created by Canberk Bibican on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTap(_ sender: Any) {
        if isValidEmail(email.text ?? "") && pass.text ?? "" != "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homePage = (storyboard.instantiateViewController(withIdentifier: "HomepageViewController") as? HomepageViewController)!
            self.navigationController?.pushViewController(homePage, animated: true)
        } else {
            self.alertDialog(title: "Error", message: "Test Error", accessID: "errorAlertDialog") {
                self.dismiss(animated: true)
            }
        }
    }

    func testExample(asda: Int, bdas: Int) -> Int {
        return (asda + bdas)
    }

    func isValidEmail(_ email: String) -> Bool {

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)

        return emailPred.evaluate(with: email)
    }

}

extension UIViewController {

    func alertDialog(title: String, message: String, accessID: String, actionOk: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default: do {
                actionOk()
                action.accessibilityIdentifier = action.title
            }
            case .cancel: break
            case .destructive: break
            @unknown default: fatalError()
            }
        }))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = accessID
            self.present(alert, animated: true, completion: nil)
        }
    }

}
