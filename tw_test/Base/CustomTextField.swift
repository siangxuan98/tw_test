//
//  CustomTextField.swift
//  tw_test
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    
    var textFieldLabel: String
    var placeholder: String
    var keyboardType: UIKeyboardType
    var showCountryPrefix: Bool?
    var callBack: (() -> Void)?
    var countryFlag: String?
    var countryDialCode: String?
    
    init(text: Binding<String>, placeholder: String, textFieldLabel: String, keyboardType: UIKeyboardType = .default, showCountryPrefix: Bool? = false, callBack: (() -> Void)? = nil, countryFlag: String? = "", countryDialCode: String? = "") {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.textFieldLabel = textFieldLabel
        self.showCountryPrefix = showCountryPrefix
        self.callBack = callBack
        self.countryFlag = countryFlag
        self.countryDialCode = countryDialCode
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textFieldLabel)
                .font(Font.custom(Constant().poppinsRegular, size: 14)).foregroundColor(Color(R.color.darkSilver() ?? UIColor.black))
                .multilineTextAlignment(.leading)
            HStack {
                if ((showCountryPrefix ?? false) && !Utilities().isStringNullOrEmpty(countryFlag) && !Utilities().isStringNullOrEmpty(countryDialCode)) {
                    HStack {
                        Text(countryFlag ?? "").font(Font.custom(Constant().poppinsRegular, size: 20))
                        Text(countryDialCode ?? "").font(Font.custom(Constant().poppinsRegular, size: 14))
                        Image("arrow_down_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("|")
                            .font(Font.custom(Constant().poppinsRegular, size: 18)).foregroundColor(Color(R.color.darkSilver() ?? UIColor.black))
                    }.onTapGesture {
                        if (callBack != nil) {
                            callBack!()
                        }
                    }
                }
                TextField(placeholder, text: $text)
                    .font(Font.custom(Constant().poppinsRegular, size: 14)).foregroundColor(Color.black)
//                    .padding(.horizontal, 8)
//                    .textFieldStyle(CustomTextFieldStyle(textValue: $text))
                    .keyboardType(keyboardType)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, ((showCountryPrefix ?? false) ? 12: 14))
            .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke((text != "") ? Color(R.color.spaceCadet()!) : Color(R.color.chineseWhite()!), lineWidth: 2))
        }.padding(.horizontal, 20)
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    @Binding var textValue: String
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke((textValue != "") ? Color(R.color.spaceCadet()!) : Color(R.color.chineseWhite()!), lineWidth: 2)
            ).padding(0)
    }
}
