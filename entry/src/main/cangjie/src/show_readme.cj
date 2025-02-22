/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class ShowReadme {
    @State
    var model: RotatePlainModel = RotatePlainModel()
    var model2: DoubleBounceModel = DoubleBounceModel()
    var model3: WaveModel = WaveModel()
    var model4: WanderingCubesModel = WanderingCubesModel()
    var model5: FadingFourModel = FadingFourModel()
    var model6: FadingCubeModel = FadingCubeModel()
    var model7: PulseModel = PulseModel()
    var model8: SpinChasingDotsModel = SpinChasingDotsModel()
    var model9: ThreeBounceModel = ThreeBounceModel()
    var model10: CircleModel = CircleModel()
    var model11: CubeGridModel = CubeGridModel()
    var model12: FadingCircleModel = FadingCircleModel()
    var model13: RotateCircleModel = RotateCircleModel()
    var model14: FoldingCubeModel = FoldingCubeModel()
    var model15: PumpingHeartModel = PumpingHeartModel()
    var model16: HourGlassModel = HourGlassModel()
    var model17: PouringHourGlassModel = PouringHourGlassModel()
    var model18: FadingGridModel = FadingGridModel()
    var model19: SpinningCircleModel = SpinningCircleModel()
    var model20: SquareCircleModel = SquareCircleModel()
    var model21: StaticCircleModel = StaticCircleModel()
    var model22: DualRingModel = DualRingModel()
    var bColor: Array<UInt32> = [0xffa3e4d7, 0xff7dcea0, 0xff7fb3d5, 0xfff8c471, 0xfff0b27a, 0xffd2b4de, 0xfff5b7b1,
        0xfff39c12]

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColor(Color.RED)
        this.model2.setSize(100.0).setDuration(1000).setColors([Color.RED, Color.GREEN])
        this.model3.setSize(30.0).setDuration(400).setColors([Color.RED, Color.GREEN, Color.BLACK])
    }

    func build() {
        Column {
            Row {
                Stack(Alignment.Center) {
                    RotatePlain(model: this.model)
                }.width(100.0).height(100.0).backgroundColor(bColor[0])
                Stack(Alignment.Center) {
                    DoubleBounce(model: this.model2)
                }.width(100.0).height(100.0).backgroundColor(bColor[1])
                Stack(Alignment.Center) {
                    Wave(model: this.model3)
                }.width(100.0).height(100.0).backgroundColor(bColor[2])
            }
            Row {
                Stack(Alignment.Center) {
                    WanderingCubes(model: this.model4)
                }.width(100.0).height(100.0).backgroundColor(bColor[3])
                Stack(Alignment.Center) {
                    FadingFour(model: this.model5)
                }.width(100.0).height(100.0).backgroundColor(bColor[4])
                Stack(Alignment.Center) {
                    FadingCube(model: this.model6)
                }.width(100.0).height(100.0).backgroundColor(bColor[5])
            }
            Row {
                Stack(Alignment.Center) {
                    Pulse(model: this.model7)
                }.width(100.0).height(100.0).backgroundColor(bColor[6])
                Stack(Alignment.Center) {
                    SpinChasingDots(model: this.model8)
                }.width(100.0).height(100.0).backgroundColor(bColor[7])
                Stack(Alignment.Center) {
                    ThreeBounce(model: this.model9)
                }.width(100.0).height(100.0).backgroundColor(bColor[0])
            }
            Row {
                Stack(Alignment.Center) {
                    CircleComponent(model: this.model10)
                }.width(100.0).height(100.0).backgroundColor(bColor[1])
                Stack(Alignment.Center) {
                    CubeGrid(model: this.model11)
                }.width(100.0).height(100.0).backgroundColor(bColor[2])
                Stack(Alignment.Center) {
                    FadingCircle(model: this.model12)
                }.width(100.0).height(100.0).backgroundColor(bColor[3])
            }
            Row {
                Stack(Alignment.Center) {
                    RotateCircle(model: this.model13)
                }.width(100.0).height(100.0).backgroundColor(bColor[4])
                Stack(Alignment.Center) {
                    FoldingCube(model: this.model14)
                }.width(100.0).height(100.0).backgroundColor(bColor[5])
                Stack(Alignment.Center) {
                    PumpingHeart(model: this.model15)
                }.width(100.0).height(100.0).backgroundColor(bColor[6])
            }
            Row {
                Stack(Alignment.Center) {
                    HourGlass(model: this.model16)
                }.width(100.0).height(100.0).backgroundColor(bColor[7])
                Stack(Alignment.Center) {
                    PouringHourGlass(model: this.model17)
                }.width(100.0).height(100.0).backgroundColor(bColor[0])
                Stack(Alignment.Center) {
                    FadingGrid(model: this.model18)
                }.width(100.0).height(100.0).backgroundColor(bColor[1])
            }
            Row {
                Stack(Alignment.Center) {
                    SpinningCircle(model: this.model19)
                }.width(100.0).height(100.0).backgroundColor(bColor[2])
                Stack(Alignment.Center) {
                    SquareCircle(model: this.model20)
                }.width(100.0).height(100.0).backgroundColor(bColor[3])
                Stack(Alignment.Center) {
                    StaticCircleComponent(model: this.model21)
                }.width(100.0).height(100.0).backgroundColor(bColor[4])
            }
            Row {
                Stack(Alignment.Center) {
                    DualRing(model: this.model22)
                }.width(100.0).height(100.0).backgroundColor(bColor[5])
            }
        }
    }
}
