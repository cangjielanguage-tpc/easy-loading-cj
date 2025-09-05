/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFoldingCubeLLT {
    @State
    var model: FoldingCubeModel = FoldingCubeModel()
    var model2: FoldingCubeModel = FoldingCubeModel()
    var model3: FoldingCubeModel = FoldingCubeModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(600)
        this.model2.setSize(50.0).setDuration(300).setColor(Color.WHITE)
        this.model3.setSize(100.0).setDuration(1000).setColor(Color.BLACK)
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                FoldingCube(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                FoldingCube(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GREEN)
            Stack(Alignment.Center) {
                FoldingCube(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
        }
    }
}
