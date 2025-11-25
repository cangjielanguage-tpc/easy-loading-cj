/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFadingCube {
    @State
    var model: FadingCubeModel = FadingCubeModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(1200).setColors([Color.WHITE])
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                FadingCube(model: this.model)
            }.width(300.0).height(300.0).backgroundColor(Color.GRAY)
        }
    }
}
