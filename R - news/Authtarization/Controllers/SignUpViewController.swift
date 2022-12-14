//
//  SignUpViewController.swift
//  R - news
//
//  Created by anna on 07.08.2022.
//

import UIKit
import SnapKit
import Lottie

final class SignUpViewController: UIViewController {

//MARK: - Properties
    private let signUpLabel = UILabel()
    private let nameValidationLabel = UILabel()
    private let nameTF = UITextField()
    private let ageValidationLabel = UILabel()
    private let ageTF = UITextField()
    private let emailValidationLabel = UILabel()
    private let passwordTF = UITextField()
    private let emailTF = UITextField()
    private let passwordValidationLabel = UILabel()
    private let signUpButton = UIButton(type: .system)
    
    private let validNickname: String.ValidTypes = .nickname
    private let validAge: String.ValidTypes = .age
    private let validEmail: String.ValidTypes = .email
    private let validPassword: String.ValidTypes = .password
    
    private let viewAnimation = AnimationView(name: "confetti")
    
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9724035859, green: 0.9314741492, blue: 0.9023552537, alpha: 1)
        setupSignIn()
        setupDelegate()
        view.insertSubview(viewAnimation, at: 0)
        viewAnimation.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.right.left.equalToSuperview().inset(70)
        }
    }
    
//MARK: - Setups
    private func setTextFields(textField: UITextField,
                       label: UILabel,
                       validType: String.ValidTypes,
                       validText: String,
                       wrongText: String,
                       string: String,
                       range: NSRange) {
        
        let text = (textField.text ?? "") + string
        let results: String
        
        if range.length == 1 {
            let lastOne = text.index(text.startIndex, offsetBy: text.count - 1)
            results = String(text[text.startIndex ..< lastOne])
        } else {
            results = text
        }
        textField.text = results

        if results.validOrNotValid(validType: validType) {
            label.text = validText
            label.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        } else {
            label.text = wrongText
            label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        }
    }
    
    private func setupDelegate() {
        nameTF.delegate = self
        ageTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    private func setupSignIn() {
        signUpLabel.text = "Sign Up"
        signUpLabel.font = UIFont(name: "Helvetica", size: 22)
        signUpLabel.textAlignment = .left
        view.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.right.left.equalToSuperview().inset(70)
        }
        
//MARK: - Nickname
        nameValidationLabel.text = " Requered"
        nameValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        nameValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        nameValidationLabel.numberOfLines = 1
        nameValidationLabel.alpha = 0.8
        nameValidationLabel.textAlignment = .left
        view.addSubview(nameValidationLabel)
        nameValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpLabel).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        nameTF.borderStyle = .roundedRect
        nameTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        nameTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        nameTF.layer.shadowOpacity = 1.0
        nameTF.layer.shadowRadius = 3
        nameTF.layer.masksToBounds = false
        nameTF.alpha = 0.8
        nameTF.placeholder = " Nickname"
        view.addSubview(nameTF)
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(nameValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Age
        ageValidationLabel.text = " Requered"
        ageValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        ageValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        ageValidationLabel.numberOfLines = 1
        ageValidationLabel.alpha = 0.8
        ageValidationLabel.textAlignment = .left
        view.addSubview(ageValidationLabel)
        ageValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        ageTF.borderStyle = .roundedRect
        ageTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        ageTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        ageTF.layer.shadowOpacity = 1.0
        ageTF.layer.shadowRadius = 3
        ageTF.layer.masksToBounds = false
        ageTF.placeholder = " Current age"
        ageTF.alpha = 0.8
        ageTF.keyboardType = .decimalPad
        view.addSubview(ageTF)
        ageTF.snp.makeConstraints { make in
            make.top.equalTo(ageValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Email
        emailValidationLabel.text = " Requered"
        emailValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        emailValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        emailValidationLabel.numberOfLines = 1
        emailValidationLabel.alpha = 0.8
        emailValidationLabel.textAlignment = .left
        view.addSubview(emailValidationLabel)
        emailValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(ageTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        emailTF.borderStyle = .roundedRect
        emailTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        emailTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        emailTF.layer.shadowOpacity = 1.0
        emailTF.layer.shadowRadius = 3
        emailTF.layer.masksToBounds = false
        emailTF.placeholder = " Email"
        emailTF.keyboardType = .emailAddress
        emailTF.alpha = 0.8
        view.addSubview(emailTF)
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(emailValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Password
        passwordValidationLabel.text = " Requered"
        passwordValidationLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        passwordValidationLabel.font = UIFont(name: "Helvetica", size: 14)
        passwordValidationLabel.numberOfLines = 1
        passwordValidationLabel.alpha = 0.8
        passwordValidationLabel.textAlignment = .left
        view.addSubview(passwordValidationLabel)
        passwordValidationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTF).inset(50)
            make.right.left.equalToSuperview().inset(70)
        }
        
        passwordTF.borderStyle = .roundedRect
        passwordTF.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        passwordTF.layer.shadowOffset = CGSize(width: 0, height: 2)
        passwordTF.layer.shadowOpacity = 1.0
        passwordTF.layer.shadowRadius = 3
        passwordTF.layer.masksToBounds = false
        passwordTF.alpha = 0.8
        passwordTF.isSecureTextEntry = true
        passwordTF.placeholder = " Password"
        view.addSubview(passwordTF)
        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(passwordValidationLabel).inset(20)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
        }
        
//MARK: - Signup Button
        signUpButton.setTitle("Create account", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Helvetica", size: 19)
        signUpButton.backgroundColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
        signUpButton.layer.cornerRadius = 7
        signUpButton.layer.shadowColor = CGColor(red: 0, green: 3/255, blue: 30/255, alpha: 0.4)
        signUpButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        signUpButton.layer.shadowOpacity = 1.0
        signUpButton.layer.shadowRadius = 3
        signUpButton.layer.masksToBounds = false
        signUpButton.addTarget(self, action: #selector(enterInAccount), for: .touchUpInside)
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTF).inset(70)
            make.right.left.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
    }
    
    @objc private func enterInAccount() {
        let nicknameText = nameTF.text ?? ""
        let ageText = ageTF.text ?? ""
        let emailText = emailTF.text ?? ""
        let passwordText = passwordTF.text ?? ""
        
        if nicknameText.validOrNotValid(validType: validNickname) &&
            ageText.validOrNotValid(validType: validAge) &&
            emailText.validOrNotValid(validType: validEmail) &&
            passwordText.validOrNotValid(validType: validPassword) {
            
            DataBase.shared.saveUser(nickname: nicknameText,
                                     age: ageText,
                                     email: emailText,
                                     password: passwordText)
            self.view.endEditing(true)
            signUpLabel.text = "Sign up complited!"
            signUpLabel.textColor = #colorLiteral(red: 0.5206840634, green: 0.696328342, blue: 0.5796924829, alpha: 1)
            viewAnimation.loopMode = .loop
            viewAnimation.alpha = 1
            viewAnimation.animationSpeed = 0.8
            viewAnimation.play()
        } else {
            signUpLabel.text = "Sign Up"
            setAlert(title: "Not enough information", message: "Please make all requered fields light up green with your personal information!")
        }
    }
}

//MARK: - Extensions
extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case nameTF:
            setTextFields(textField: nameTF,
                          label: nameValidationLabel,
                          validType: validNickname,
                          validText: "This nickname is available",
                          wrongText: "Only a-z / A-Z, min 6 chars",
                          string: string,
                          range: range)
            
        case ageTF:
            setTextFields(textField: ageTF,
                          label: ageValidationLabel,
                          validType: validAge,
                          validText: "Allowed to continue",
                          wrongText: "You shall not pass!",
                          string: string,
                          range: range)
            
        case emailTF:
            setTextFields(textField: emailTF,
                          label: emailValidationLabel,
                          validType: validEmail,
                          validText: "Valid email",
                          wrongText: "Requered form is xxxxxxx@xxxx.xx",
                          string: string,
                          range: range)
            
        case passwordTF:
            setTextFields(textField: passwordTF,
                          label: passwordValidationLabel,
                          validType: validPassword,
                          validText: "Allowed to continue",
                          wrongText: "Only a-z / A-Z, one digit and min 6 chars",
                          string: string,
                          range: range)
        default:
            break
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        ageTF.resignFirstResponder()
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        return true
    }
}
