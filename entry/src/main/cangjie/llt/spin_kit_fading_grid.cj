/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt
import ohos.state_macro_manage.*
@Entry
@Component
class SpinKitFadingGridTest {
    @State
    var model: FadingGridModel = FadingGridModel()
    protected override func aboutToAppear(): Unit {
        this.model
        .setSize(80.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)
        .setColorArray([Color.RED])
        .setDuration(600)
        //.setShapeStyle(ShapeStyle.CIRCLE)
    }
    func build() {
        Column() {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                FadingGrid(model: this.model)
            }
            .width(300.0)
            .height(300.0)
            .padding(top: 70.0)
            .backgroundColor(Color.WHITE)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)

    }
}