/**
 * Created on 2025/1/6
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
import ohos.hilog.*

@Entry
@Component
public class AllIndicatorTest {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel1: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel2: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel3: EasyLoadingModel = EasyLoadingModel()
    //---指示器model--
    @State
    var fadeGridmodel: ?FadingGridModel = Option<FadingGridModel>.None
    @State
    var toastModel: ?ToastModel = Option<ToastModel>.None

    @State
    var styleDark: Bool = true
    @State
    var styleLight: Bool = false
    @State
    var styleCustom: Bool = false

    @State
    var maskNone: Bool = false
    @State
    var maskBlack: Bool = true
    @State
    var maskCustom: Bool = false

    @State
    var positionTop: Bool = false
    @State
    var positionCenter: Bool = true
    @State
    var positionBottom: Bool = false

    @State
    var animatorScale: Bool = false
    @State
    var animatorRotate: Bool = false
    @State
    var animatorOffset: Bool = false
    @State
    var animatorOpacity: Bool = true
    @State
    var animatorCustom: Bool = false

    @State
    var isCubeGrid: Bool = true

    protected override func aboutToAppear(): Unit {
        this.fadeGridmodel = FadingGridModel()
        .setSize(50.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)

        this.loadingModel1
        .setText("Toast")
        .setWidth(80.0)
        .setHeight(50.0)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)

          //--------------测试Toast---有图标--------
        this.toastModel = ToastModel()
        .setWidth(50.0)
        .setHeight(50.0)
        .setIcon(@r(app.media.dui))

        this.loadingModel2
        .setText("Great Success!")
        .setWidth(140.0)
        .setHeight(110.0)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setToastModel(this.toastModel())

        if(this.styleDark) {
            this.fadeGridmodel().setColorArray([Color.GRAY])
            this.loadingModel.setBackground(Color.BLACK)
            this.loadingModel.setFontColor(Color.WHITE)

            //---toast---
            this.loadingModel1.setBackground(Color.BLACK)
            this.loadingModel1.setFontColor(Color.WHITE)
            //----
            this.loadingModel2.setBackground(Color.BLACK)
            this.loadingModel2.setFontColor(Color.WHITE)
        }
        if(this.maskBlack) {
            this.loadingModel.setMaskBgColor(Color.BLACK)
            //----
            this.loadingModel1.setMaskBgColor(Color.BLACK)
            //---
            this.loadingModel2.setMaskBgColor(Color.BLACK)
        }
        if(this.animatorOpacity) {
            this.loadingModel.setAnimatorOpacity(1.0)
            //----
             this.loadingModel1.setAnimatorOpacity(1.0)
            //----
             this.loadingModel2.setAnimatorOpacity(1.0)
        }

        if(isCubeGrid) {
            this.loadingModel
            .setIndicatorType(EasyLoadingIndicatorType.FADINGGRID)
            .setFadingGridModel(this.fadeGridmodel())
        }


        //--------------测试Toast---无图标--------

        if(positionCenter) {
            this.loadingModel1.setOffsetDirection(Alignment.Center)
            this.loadingModel2.setOffsetDirection(Alignment.Center)
            this.loadingModel1.setOffsetX(0.0)
            this.loadingModel1.setOffsetY(0.0)
            this.loadingModel2.setOffsetX(0.0)
            this.loadingModel2.setOffsetY(0.0)
        }
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
                        Toggle(ToggleType.ButtonType, this.styleDark) {
                            Text("dark").fontColor(0x317AF7)
                        }
                        .width(80)
                        .height(30)
                        .selectedColor(0xe0d6ee)
//                        .backgroundColor(Color.WHITE)
                        .border(width: 2.vp, color: Color(0x988fae))
                        .onChange({isOn: Bool =>
                            if(isOn) {
                                this.styleCustom = false
                                this.styleLight = false
                                this.fadeGridmodel().setColorArray([Color.GRAY])
                                this.loadingModel.setBackground(Color.BLACK)
                                this.loadingModel.setFontColor(Color.WHITE)
                                //---
                                this.loadingModel1.setBackground(Color.BLACK)
                                this.loadingModel1.setFontColor(Color.WHITE)

                                //---
                                this.loadingModel2.setBackground(Color.BLACK)
                                this.loadingModel2.setFontColor(Color.WHITE)

                            }
                        })
                        Toggle(ToggleType.ButtonType, this.styleLight) {
                            Text("light").fontColor(0x317AF7)
                        }
                        .width(80)
                        .height(30)
                        .selectedColor(0xe0d6ee)
//                        .backgroundColor(Color.WHITE)
                        .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                        .onChange({isOn: Bool =>
                            if(isOn) {
                                this.styleCustom = false
                                this.styleDark = false
                                this.fadeGridmodel().setColorArray([Color.BLACK])
                                this.loadingModel.setBackground(Color.WHITE)
                                this.loadingModel.setFontColor(Color.BLACK)

                                //--
                                this.loadingModel1.setBackground(Color.WHITE)
                                this.loadingModel1.setFontColor(Color.BLACK)
                                //--
                                this.loadingModel2.setBackground(Color.WHITE)
                                this.loadingModel2.setFontColor(Color.BLACK)
                            }
                        })
                        Toggle(ToggleType.ButtonType, this.styleCustom) {
                            Text("custom").fontColor(0x317AF7)
                        }
                        .width(80)
                        .height(30)
                        .selectedColor(0xe0d6ee)
//                        .backgroundColor(Color.WHITE)
                        .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                        .onChange({isOn: Bool =>
                            if(isOn) {
                                this.styleLight = false
                                this.styleDark = false
                                this.fadeGridmodel().setColorArray([Color.RED])
                                this.loadingModel.setBackground(Color.BLUE)
                                this.loadingModel1.setBackground(Color.BLUE)
                                this.loadingModel2.setBackground(Color.BLUE)
                            }
                        })
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
                            Toggle(ToggleType.ButtonType, this.maskNone) {
                                Text("none").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>

                                if(isOn) {
                                    this.maskBlack = false
                                    this.maskCustom = false
                                    this.loadingModel.setMask(false)
                                    this.loadingModel1.setMask(false)
                                    this.loadingModel2.setMask(false)

                                }
                            })

                            Toggle(ToggleType.ButtonType, this.maskBlack) {
                                Text("black").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.maskNone = false
                                    this.maskCustom = false
                                    this.loadingModel.setMask(true)
                                    this.loadingModel.setMaskBgColor(Color.BLACK)
                                    this.loadingModel.setMaskDisplayAnimator(0.5)
                                    this.loadingModel1.setMask(true)
                                    this.loadingModel1.setMaskBgColor(Color.BLACK)
                                    this.loadingModel1.setMaskDisplayAnimator(0.5)
                                    this.loadingModel2.setMask(true)
                                    this.loadingModel2.setMaskBgColor(Color.BLACK)
                                    this.loadingModel2.setMaskDisplayAnimator(0.5)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.maskCustom) {
                                Text("custom").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.maskNone = false
                                    this.maskBlack = false
                                    this.loadingModel.setMask(true)
                                    this.loadingModel.setMaskBgColor(Color(0xffa500))
                                    this.loadingModel.setMaskDisplayAnimator(0.5)
                                    this.loadingModel1.setMask(true)
                                    this.loadingModel1.setMaskBgColor(Color(0xffa500))
                                    this.loadingModel1.setMaskDisplayAnimator(0.5)
                                    this.loadingModel2.setMask(true)
                                    this.loadingModel2.setMaskBgColor(Color(0xffa500))
                                    this.loadingModel2.setMaskDisplayAnimator(0.5)
                                }
                            })

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
                            Toggle(ToggleType.ButtonType, this.positionTop) {
                                Text("top").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                 if(isOn) {
                                    this.positionCenter = false
                                    this.positionBottom = false
                                    this.loadingModel1.setOffsetDirection(Alignment.Top)
                                    this.loadingModel1.setOffsetY(50.0)
                                    this.loadingModel2.setOffsetDirection(Alignment.Top)
                                    this.loadingModel2.setOffsetY(50.0)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.positionCenter) {
                                Text("center").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.positionTop = false
                                    this.positionBottom = false
                                    this.loadingModel1.setOffsetDirection(Alignment.Center)
                                    this.loadingModel1.setOffsetY(0.0)
                                    this.loadingModel2.setOffsetDirection(Alignment.Center)
                                    this.loadingModel2.setOffsetY(0.0)
                                }
                            })

                            Toggle(ToggleType.ButtonType, this.positionBottom) {
                                Text("bottom").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.positionTop = false
                                    this.positionCenter = false
                                    this.loadingModel1.setOffsetDirection(Alignment.Bottom)
                                    this.loadingModel1.setOffsetY(-50.0)
                                    this.loadingModel2.setOffsetDirection(Alignment.Bottom)
                                    this.loadingModel2.setOffsetY(-50.0)
                                }
                            })

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
                            Toggle(ToggleType.ButtonType, this.animatorOpacity) {
                                Text("opacity").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.animatorRotate = false
                                    this.animatorScale = false
                                    this.animatorOffset = false
                                    this.loadingModel.setIsRotate(false)
                                    this.loadingModel.setIsOffset(false)
                                    this.loadingModel.setIsScale(false)
                                    this.loadingModel.setAnimatorOpacity(1.0)
                                    this.loadingModel1.setIsRotate(false)
                                    this.loadingModel1.setIsOffset(false)
                                    this.loadingModel1.setIsScale(false)
                                    this.loadingModel1.setAnimatorOpacity(1.0)
                                    this.loadingModel2.setIsRotate(false)
                                    this.loadingModel2.setIsOffset(false)
                                    this.loadingModel2.setIsScale(false)
                                    this.loadingModel2.setAnimatorOpacity(1.0)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.animatorOffset) {
                                Text("offset").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.animatorRotate = false
                                    this.animatorScale = false
                                    this.animatorOpacity = false
                                    this.animatorCustom = false

                                    this.loadingModel1.setIsRotate(false)
                                    this.loadingModel1.setIsOpacity(false)
                                    this.loadingModel1.setIsScale(false)
                                    this.loadingModel1.setIsOffset(true)

                                    this.loadingModel2.setIsRotate(false)
                                    this.loadingModel2.setIsOpacity(false)
                                    this.loadingModel2.setIsScale(false)
                                    this.loadingModel2.setIsOffset(true)

                                    this.loadingModel1.setAnimatorOpacity(1.0)
                                    this.loadingModel2.setAnimatorOpacity(1.0)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.animatorScale) {
                                Text("scale").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.animatorOpacity = false
                                    this.animatorOffset = false
                                    this.animatorRotate = false
                                    this.loadingModel.setIsRotate(false)
                                    this.loadingModel.setIsOffset(false)
                                    this.loadingModel.setIsOpacity(false)
                                    this.loadingModel.setScaleAnimator(1.0)
                                    this.loadingModel1.setIsRotate(false)
                                    this.loadingModel1.setIsOffset(false)
                                    this.loadingModel1.setIsOpacity(false)
                                    this.loadingModel1.setScaleAnimator(1.0)
                                    this.loadingModel2.setIsRotate(false)
                                    this.loadingModel2.setIsOffset(false)
                                    this.loadingModel2.setIsOpacity(false)
                                    this.loadingModel2.setScaleAnimator(1.0)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.animatorRotate) {
                                Text("rotate").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>
                                if(isOn) {
                                    this.animatorOpacity = false
                                    this.animatorOffset = false
                                    this.animatorScale = false
                                    this.loadingModel.setIsScale(false)
                                    this.loadingModel.setIsOffset(false)
                                    this.loadingModel.setIsOpacity(false)
                                    this.loadingModel.setRotateAnimator(360.0)
                                    this.loadingModel1.setIsScale(false)
                                    this.loadingModel1.setIsOffset(false)
                                    this.loadingModel1.setIsOpacity(false)
                                    this.loadingModel1.setRotateAnimator(360.0)
                                    this.loadingModel2.setIsScale(false)
                                    this.loadingModel2.setIsOffset(false)
                                    this.loadingModel2.setIsOpacity(false)
                                    this.loadingModel2.setRotateAnimator(360.0)
                                }
                            })
                            Toggle(ToggleType.ButtonType, this.animatorRotate) {
                                    Text("custom").fontColor(0x317AF7)
                                }
                                .width(80)
                                .height(30)
                                .selectedColor(0xe0d6ee)
//                                .backgroundColor(Color.WHITE)
                                .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                                .onChange({isOn: Bool =>
                                    if(isOn) {
                                        this.animatorOpacity = false
                                        this.animatorOffset = false
                                        this.animatorScale = false
                                        this.animatorRotate = false
                                        this.loadingModel.setRotateAnimator(360.0)
                                        this.loadingModel.setScaleAnimator(1.0)
                                        this.loadingModel.setAnimatorOpacity(1.0)
                                        this.loadingModel1.setRotateAnimator(360.0)
                                        this.loadingModel1.setScaleAnimator(1.0)
                                        this.loadingModel1.setAnimatorOpacity(1.0)
                                        this.loadingModel2.setRotateAnimator(360.0)
                                        this.loadingModel2.setScaleAnimator(1.0)
                                        this.loadingModel2 .setAnimatorOpacity(1.0)

                                    }
                                })
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
                            Toggle(ToggleType.ButtonType, this.isCubeGrid) {
                                Text("cubeGrid").fontColor(0x317AF7)
                            }
                            .width(80)
                            .height(30)
                            .selectedColor(0xe0d6ee)
//                            .backgroundColor(Color.WHITE)
                            .border(width: 2.vp, color: Color(0x988fae),radius: 2.vp)
                            .onChange({isOn: Bool =>

                            })
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

                            Text("showToast").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event =>
                                this.loadingModel1 = this.loadingModel1.show()
                            })

                            Text("showToastSuccess").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event =>
                                this.loadingModel2 = this.loadingModel2.show()
                            })

                        }.width(100.percent)
                        .justifyContent(FlexAlign.Center)
                        .margin(bottom: 30)
                    }
                }
            Column() {
                EasyLoading(model: this.loadingModel)
                EasyLoading(model: this.loadingModel1)
                EasyLoading(model: this.loadingModel2)
                EasyLoading(model: this.loadingModel3)
            }.position(x: 0.vp,y: 0.vp).zIndex(100)
        }.width(100.percent).height(100.percent)
    }
}