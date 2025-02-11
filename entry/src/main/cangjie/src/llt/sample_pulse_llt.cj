/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SamplePulseLLT {
    @State
    var model: PulseModel = PulseModel()
    var model2: PulseModel = PulseModel()
    var model3: PulseModel = PulseModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(1000).setShapeStyle(ShapeStyle.CIRCLE)
        this.model2.setSize(80.0).setDuration(2000).setShapeStyle(ShapeStyle.RECT).setColor(Color.BLUE)
        this.model3.setSize(30.0).setDuration(500).setShapeStyle(ShapeStyle.CIRCLE).setColor(Color.GREEN)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                Pulse(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
                        Stack(Alignment.Center) {
                Pulse(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.RED)
                        Stack(Alignment.Center) {
                Pulse(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLUE)
        }
    }
}
