/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*

@Entry
@Component
class CubeGridTestLLT {
    @State
    var model: CubeGridModel = CubeGridModel()
    var model2: CubeGridModel = CubeGridModel()
    var model3: CubeGridModel = CubeGridModel()

    protected override func aboutToAppear(): Unit {
        this.model
        .setSize(80.0)
        .setDuration(600)
                this.model2
        .setSize(50.0)
        .setDuration(300).setColorArray([Color.BLACK,Color.BLUE])
                this.model3
        .setSize(100.0)
        .setDuration(1000).setColorArray([Color.BLACK,Color.BLUE,Color.RED])
        //.setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column() {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                CubeGrid(model: this.model)
            }
            .width(100.0)
            .height(100.0)
            .padding(top: 70.0)
            .backgroundColor(Color.WHITE)
                        Stack(Alignment.Center) {
                CubeGrid(model: this.model2)
            }
            .width(100.0)
            .height(100.0)
            .padding(top: 70.0)
            .backgroundColor(Color.GRAY)
                        Stack(Alignment.Center) {
                CubeGrid(model: this.model3)
            }
            .width(100.0)
            .height(100.0)
            .padding(top: 70.0)
            .backgroundColor(Color.GREEN)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)

    }
}