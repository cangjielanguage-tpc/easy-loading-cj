/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import ohos.component.Scroller
import ohos.component.Scroll
import ohos.router.Router

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello Cangjie"
    let scroller = Scroller()
    func build() {
        Row {
            Scroll(this.scroller) {
                Column {
                    Button("SampleRotatePlain").fontSize(14).id("SampleRotatePlain").onClick {
                        => Router.push(url: "SampleRotatePlain")
                    }
                    Button("SampleDoubleBounce").fontSize(14).id("SampleDoubleBounce").onClick {
                        => Router.push(url: "SampleDoubleBounce")
                    }
                    Button("SampleWave").fontSize(14).id("SampleWave").onClick {
                        => Router.push(url: "ShowWaveSample")
                    }
                    Button("SampleWanderingCubes").fontSize(14).id("SampleWanderingCubes").onClick {
                        => Router.push(url: "WanderingCubesTest")
                    }
                    Button("SampleFadingFour").fontSize(14).id("SampleFadingFour").onClick {
                        => Router.push(url: "SampleFadingFour")
                    }
                    Button("SampleFadingCube").fontSize(14).id("SampleFadingCube").onClick {
                        => Router.push(url: "SampleFadingCube")
                    }
                    Button("SamplePulse").fontSize(14).id("SamplePulse").onClick {
                        => Router.push(url: "SamplePulse")
                    }
                    Button("SampleSpinChasingDots").fontSize(14).id("SampleSpinChasingDots").onClick {
                        => Router.push(url: "SampleSpinChasingDots")
                    }
                    Button("SampleThreeBounce").fontSize(14).id("SampleThreeBounce").onClick {
                        => Router.push(url: "SampleThreeBounce")
                    }
                    Button("SampleCircle").fontSize(14).id("SampleCircle").onClick {
                        => Router.push(url: "SampleCircle")
                    }
                    Button("SampleStaticCircle").fontSize(14).id("SampleStaticCircle").onClick {
                        => Router.push(url: "SampleStaticCircle")
                    }
                    Button("SampleRotateCircles").fontSize(14).id("SampleRotateCircles").onClick {
                        => Router.push(url: "SampleRotateCircles")
                    }
                    Button("SampleRotateFourCircles").fontSize(14).id("SampleRotateFourCircles").onClick {
                        => Router.push(url: "SampleRotateFourCircles")
                    }
                    Button("SampleRotateEightCircles").fontSize(14).id("SampleRotateEightCircles").onClick {
                        => Router.push(url: "SampleRotateEightCircles")
                    }
                    Button("SampleCubeGrid").fontSize(14).id("SampleCubeGrid").onClick {
                        => Router.push(url: "CubeGridTest")
                    }
                    Button("SampleFadingCircle").fontSize(14).id("SampleFadingCircle").onClick {
                        => Router.push(url: "SampleFadingCircle")
                    }
                    Button("SampleRotateCircle").fontSize(14).id("SampleRotateCircle").onClick {
                        => Router.push(url: "SampleRotateCircle")
                    }
                    Button("SampleFoldingCube").fontSize(14).id("SampleFoldingCube").onClick {
                        => Router.push(url: "SampleFoldingCube")
                    }
                    Button("SamplePumpHeart").fontSize(14).id("SamplePumpHeart").onClick {
                        => Router.push(url: "PumpHeartTest")
                    }
                    Button("SampleHourGlass").fontSize(14).onClick {
                        => Router.push(url: "SampleHourGlass")
                    }
                    Button("SamplePouringHourGlass").fontSize(14).onClick {
                        => Router.push(url: "SamplePouringHourGlass")
                    }
                    Button("FadingGrid").fontSize(14).onClick {
                        => Router.push(url: "SpinKitFadingGridTest")
                    }
                    Button("SampleRing").fontSize(14).onClick {
                        => Router.push(url: "SampleRing")
                    }
                    Button("SampleMoveRing").fontSize(14).onClick {
                        => Router.push(url: "SampleMoveRing")
                    }
                    Button("SampleSpinningCircle").fontSize(14).onClick {
                        => Router.push(url: "SampleSpinningCircle")
                    }
                    Button("SampleSquareCircle").fontSize(14).onClick {
                        => Router.push(url: "SquareCircleSample")
                    }
                    Button("DualRingTest").fontSize(14).onClick {
                        => Router.push(url: "DualRingTest")
                    }

                    Text("All----------------------")

                    Button("all").fontSize(14).onClick {
                        => Router.push(url: "AllTest")
                    }
                    Button("allIndicator").fontSize(14).onClick {
                        => Router.push(url: "AllIndicatorTest")
                    }
                    Button("SampleReadmeT").fontSize(14).onClick {
                        => Router.push(url: "ShowReadme")
                    }
                    Button("SampleTT").fontSize(14).onClick {
                        => Router.push(url: "SampleTT")
                    }
                    Text("add LLT----------------------")
                    Button("SampleWaveLLT").fontSize(14).onClick {
                        => Router.push(url: "ShowWaveSampleLLT")
                    }
                    Button("SampleRotatePlainLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleRotatePlainLLT")
                    }
                    Button("SampleDoubleBounceLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleDoubleBounceLLT")
                    }
                    Button("WanderingCubesTestLLT").fontSize(14).onClick {
                        => Router.push(url: "WanderingCubesTestLLT")
                    }
                    Button("SampleFadingFourLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleFadingFourLLT")
                    }
                    Button("SampleFadingCubeLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleFadingCubeLLT")
                    }
                    Button("SamplePulseLLT").fontSize(14).onClick {
                        => Router.push(url: "SamplePulseLLT")
                    }
                    Button("SampleSpinChasingDotsLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleSpinChasingDotsLLT")
                    }
                    Button("SampleThreeBounceLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleThreeBounceLLT")
                    }
                    Button("SampleCircleLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleCircleLLT")
                    }
                    Button("CubeGridTestLLT").fontSize(14).onClick {
                        => Router.push(url: "CubeGridTestLLT")
                    }
                    Button("SampleRotateCircleLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleRotateCircleLLT")
                    }
                    Button("SampleRotateCirclesLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleRotateCirclesLLT")
                    }
                    Button("SampleFoldingCubeLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleFoldingCubeLLT")
                    }
                    Button("SpinKitFadingGridTestLLT").fontSize(14).onClick {
                        => Router.push(url: "SpinKitFadingGridTestLLT")
                    }
                    Button("SampleSpinningCircleLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleSpinningCircleLLT")
                    }
                    Button("SquareCircleSampleLLT").fontSize(14).onClick {
                        => Router.push(url: "SquareCircleSampleLLT")
                    }
                    Button("SampleRingLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleRingLLT")
                    }
                    Button("SampleMoveRingLLT").fontSize(14).onClick {
                        => Router.push(url: "SampleMoveRingLLT")
                    }
                    Button("SamplePourHourGlassLLT").fontSize(14).onClick {
                        => Router.push(url: "SamplePourHourGlassLLT")
                    }
                }.width(100.percent)
            }
        }.height(100.percent)
    }
}
