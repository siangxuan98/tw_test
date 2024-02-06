//
//  BaseViewModel.swift
//  tw_test
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: ObservableObject {
//    let loading = ActivityIndicator()
//    let headerLoading = ActivityIndicator()
//    let footerLoading = ActivityIndicator()
    let showLoading : BehaviorRelay<Bool> = BehaviorRelay.init(value: false)
    let errorTracker = ErrorTracker()
    var page = BehaviorRelay<Int>.init(value: 1)
    let itemCount = BehaviorRelay<Int>.init(value: 0)
    var isLoading = false
    
    func count(from: Int, to: Int, quickStart: Bool) -> Observable<Int> {
        return Observable<Int>
            .timer(quickStart ? 0 : 1, period: 1, scheduler: MainScheduler.instance)
            .take(from - to + 1)
            .map { from - $0 }
    }
    
    deinit {
        print(String(describing: type(of: self)) + "-deinit")
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleError(error: ApiErrorMessage) {
        print(error.msg ?? "")
    }
    
    func hideKeyboard() {
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

