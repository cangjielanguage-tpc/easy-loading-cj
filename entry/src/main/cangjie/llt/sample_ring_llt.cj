/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRingLLT {
    @State
    var model: RingModel = RingModel()
    var model2: RingModel = RingModel()
    var model3: RingModel = RingModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColor(Color.RED).setStrokeWidth(2.0).setAngle(70.0)
        this.model2.setSize(100.0).setDuration(1000).setColor(Color.GREEN).setStrokeWidth(4.0).setAngle(170.0)
        this.model3.setSize(30.0).setDuration(400).setColor(Color.BLACK)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                Ring(model: this.model)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                Ring(model: this.model2)
            }.width(100.0).height(100.0).backgroundColor(Color.BLACK)
            Stack(Alignment.Center) {
                Ring(model: this.model3)
            }.width(100.0).height(100.0).backgroundColor(Color.WHITE)
        }
    }
}
