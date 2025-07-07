/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRotateCircle {
    @State
    var model: RotateCircleModel = RotateCircleModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(1200).setColor(Color.WHITE)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                RotateCircle(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.GRAY)
        }
    }
}
