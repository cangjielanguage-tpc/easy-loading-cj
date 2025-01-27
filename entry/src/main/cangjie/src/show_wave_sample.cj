/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class ShowWaveSample {
    @State
    var model: WaveModel = WaveModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(600).setColors([Color.RED, Color.GREEN, Color.BLACK])
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                Wave(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.GRAY)
        }
    }
}
