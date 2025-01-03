/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class Sample1 {
    private var waveModel: WaveModel = WaveModel()

    protected override func aboutToAppear(): Unit {
        this.waveModel.setSize(120.0)
        this.waveModel.setColors([Color.RED, Color.GREEN, Color.BLACK])
        this.waveModel.setItemCount(8)
        this.waveModel.init_data()
//        this.waveModel.animateY(600, easing: "ease")
//        this.waveModel.animateY(600, easing: "ease-in")
        this.waveModel.animateY(700, easing: "ease-inout")
    }

    func build() {
        Stack(Alignment.TopStart) {
            Column {
                WaveComponent(waveModel: this.waveModel)
            }
        }
    }
}
