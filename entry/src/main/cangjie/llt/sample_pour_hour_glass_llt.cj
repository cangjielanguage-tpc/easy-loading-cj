/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SamplePourHourGlassLLT {
    @State
    var model: PouringHourGlassModel = PouringHourGlassModel()
    var model2: PouringHourGlassModel = PouringHourGlassModel()
    var model3: PouringHourGlassModel = PouringHourGlassModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(60.0).setDuration(1200).setColor(Color.RED)
        this.model.setSize(40.0).setDuration(800).setColor(Color.BLUE)
        this.model.setSize(100.0).setDuration(2000).setColor(Color.GREEN)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                PouringHourGlass(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                PouringHourGlass(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                PouringHourGlass(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GREEN)
        }
    }
}
