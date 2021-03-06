# MultiSelector

[![Build Status](https://app.bitrise.io/app/bf5b87cf153c7d5b/status.svg?token=5Ep2QdyXyNIR55wnEHTYXw&branch=master)](https://app.bitrise.io/app/bf5b87cf153c7d5b)
[![Version](https://img.shields.io/cocoapods/v/MultiSelector.svg?style=flat)](https://cocoapods.org/pods/MultiSelector)
[![License](https://img.shields.io/cocoapods/l/MultiSelector.svg?style=flat)](https://cocoapods.org/pods/MultiSelector)
[![Platform](https://img.shields.io/cocoapods/p/MultiSelector.svg?style=flat)](https://cocoapods.org/pods/MultiSelector)

MultiSelector is a customizable multiple selector for iOS with RxSwift supported.

![Demo](https://raw.githubusercontent.com/xflagstudio/MultiSelector/master/screenshots/demo.png)

## Documentation

MultiSelector is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MultiSelector'
```

#### Customzied model

A customized model for a customized button must contains the title of the button.
If you want to control the `isEnabled` property of the button, just add it into your customized model.

```Swift
struct Model: MultiSelectorModel {
    let title: String
    let isEnabled: Bool
}
```

#### Customzied button

```Swift
public class Button: MultiSelectorButton {
   public override func configure(model: MultiSelectorModel?) {
       // customized code.
   }
}
```

#### Setup button

```Swift
multiSelector.buttonType = Button.self
multiSelector.delegate = self
multiSelector.models = [model1, model2, ...]
multiSelector.numberOfSelectableItems = 4
multiSelector.numberOfColumns = 4
multiSelector.verticalSpaceing = 10
multiSelector.horizontalSpacing = 10
```

#### Observe selected indexes

```Swift
extension ViewController: MultiSelectorDelegate {
    func didSelectedIndexUpdated(indexes: [Int]) {
    }
}
```

#### RxSwift supported

```Swift
multiSelector.rx.indexesSelected.subscribe(onNext: { [unowned self] in
    print($0.map { self.allModels[$0] })
}).disposed(by: disposeBag)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

MultiSelector is available under the MIT license. See the LICENSE file for more info.
