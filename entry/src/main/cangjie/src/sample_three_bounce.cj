/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleThreeBounce {
    private var model: ThreeBounceModel = ThreeBounceModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(120.0)
        this.model.setColors([Color.RED, Color.GREEN, Color.BLACK])
        this.model.init_data()
//        this.waveModel.animateY(600, easing: "ease")
//        this.waveModel.animateY(600, easing: "ease-in")
        this.model.animateY(700, easing: "ease-inout")
    }

    func build() {
        Stack(Alignment.TopStart) {
            Column {
                ThreeBounceComponent(threeBounceModel: this.model)
            }
        }
    }
}
