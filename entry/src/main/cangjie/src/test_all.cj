/**
 * Created on 2025/1/6
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
import ohos.hilog.*

@Entry
@Component
public class AllTest {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()
    @State
    var fadeGridmodel: ?SpinKitFadingGridModel = Option<SpinKitFadingGridModel>.None

    protected override func aboutToAppear(): Unit {
        this.fadeGridmodel = SpinKitFadingGridModel()
        .setColorArray([Color.BLACK])
        .setWidth(50.0)
        .setHeight(50.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)

        this.loadingModel
        .setIndicatorType(EasyLoadingIndicatorType.FADINGGRID)
        .setIndicatorModel(this.fadeGridmodel())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        //.setRotateAnimator(360.0)

    }
    func build() {
         Column {
            Column() {
                    Column() {
                    Row{
                        Text("style")
                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 5)
                    Row() {
                        Button("dark")
                        .shape(ShapeType.Normal)
                        .stateEffect(true)
                        .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                        .backgroundColor(0xffffff)
                        .width(80)
                        .height(30)
                        .fontColor(0x317AF7)
                        Button("light")
                        .shape(ShapeType.Normal)
                        .stateEffect(true)
                        .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                        .backgroundColor(0xffffff)
                        .width(80)
                        .height(30)
                        .fontColor(0x317AF7)
                        Button("custom")
                        .shape(ShapeType.Normal)
                        .stateEffect(true)
                        .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                        .backgroundColor(0xffffff)
                        .width(80)
                        .height(30)
                        .fontColor(0x317AF7)
                    }.width(100.percent)
                    .justifyContent(FlexAlign.Center)
                    .margin(bottom: 15)
                }
                    Column() {
                        Row{
                            Text("MaskType")
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 5)
                        Row() {
                            Button("none")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("clear")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("black")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("custom")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 15)
                    }
                    Column() {
                        Row{
                            Text("Toast Position")
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 5)
                        Row() {
                            Button("top")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("center")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("bottom")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 15)
                    }
                    Column() {
                        Row{
                            Text("Animation Style")
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 5)
                        Row() {
                            Button("opacity")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("offset")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("scale")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                            Button("custom")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 15)
                    }
                    Column() {
                        Row{
                            Text("IndicatorType total:23")
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 5)
                        Row() {
                            Button("wave")
                            .shape(ShapeType.Normal)
                            .stateEffect(true)
                            .borderStyle(BorderStyle.Solid).borderWidth(1).borderColor(Color.GRAY).borderRadius(4)
                            .backgroundColor(0xffffff)
                            .width(80)
                            .height(30)
                            .fontColor(0x317AF7)
                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 20)
                    }
                    Column() {
                        Row{
                            Text("show").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event =>
                                this.loadingModel = this.loadingModel.show()
                            })

                            Text("dismiss").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event => this.loadingModel = this.loadingModel.hide()})

                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 30)
                    }
                }
            Column() {
                EasyLoading(model: this.loadingModel)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}