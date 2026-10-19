/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleHourGlassLLT {
    @State
    var model: HourGlassModel = HourGlassModel()
    var model2: HourGlassModel = HourGlassModel()
    var model3: HourGlassModel = HourGlassModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(60.0).setDuration(1200).setColors([Color.RED, Color.GREEN]).setAngle(90.0)
        this.model.setSize(40.0).setDuration(800).setColors([Color.RED, Color.GREEN, Color.BLACK]).setAngle(30.0)
        this.model.setSize(100.0).setDuration(2000).setColors([Color.RED, Color.GREEN]).setAngle(180.0)
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                HourGlass(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                HourGlass(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                HourGlass(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLACK)
        }
    }
}
