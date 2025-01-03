/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

 import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class ShowDoubleBounceSample {
    private var threeBounceModel: ThreeBounceModel = ThreeBounceModel()

    protected override func aboutToAppear(): Unit {
//        this.threeBounceModel.setStatus("loading!!!")
////        this.loadModel.showSuccess()
//        this.threeBounceModel.show()
//        this.threeBounceModel.setTextColor(Color.RED)
    }

    func build() {
        Stack(Alignment.TopStart) {
            Column {
//                EasyLoadingComponent(loadingModel: this.loadModel)
            }
        }
    }
}
