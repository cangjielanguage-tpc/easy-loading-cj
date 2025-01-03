/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SamplePulse {
    private var model: PulseModel = PulseModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(120.0)
        this.model.setColor(Color.RED)
        this.model.init_data()
        //        this.waveModel.animateY(600, easing: "ease")
        //        this.waveModel.animateY(600, easing: "ease-in")
        this.model.animateY(1000)
    }

    func build() {
        Stack(Alignment.TopStart) {
            Column {
                PulseComponent(pulseModel: this.model)
            }
        }
    }
}
