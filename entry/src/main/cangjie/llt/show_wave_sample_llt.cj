/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class ShowWaveSampleLLT {
    var model: WaveModel = WaveModel()
    var model2: WaveModel = WaveModel()
    var model3: WaveModel = WaveModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(600).setColors([Color.WHITE]).setItemCount(5)
        this.model2.setSize(10.0).setDuration(800).setColors([Color.WHITE, Color.GREEN]).setItemCount(4)
        this.model3.setSize(80.0).setDuration(200).setColors([Color.WHITE]).setItemCount(8)
    }

    func build() {
        Column() {
            Stack(Alignment.Center) {
                Wave(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                Wave(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLUE)
            Stack(Alignment.Center) {
                Wave(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLACK)
        }.align(Alignment.Center)
    }
}
