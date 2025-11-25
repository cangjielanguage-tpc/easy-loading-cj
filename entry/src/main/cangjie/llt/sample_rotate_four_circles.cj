/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRotateFourCircles {
    @State
    var model: RotateFourCirclesModel = RotateFourCirclesModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(100.0).setDuration(2400).setColors([Color.RED])
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                RotateFourCirclesComponent(model: this.model)
            }.width(300.0).height(300.0).backgroundColor(Color.GRAY)
        }
    }
}
