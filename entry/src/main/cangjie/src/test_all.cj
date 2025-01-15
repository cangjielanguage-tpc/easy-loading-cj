/**
 * Created on 2025/1/6
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
import ohos.resource_manager.*

@Entry
@Component
public class AllTest {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel1: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel2: EasyLoadingModel = EasyLoadingModel()
    @State
    var loadingModel3: EasyLoadingModel = EasyLoadingModel()
    @State
    var fadeGridmodel: ?FadingGridModel = Option<FadingGridModel>.None
    @State
    var toastModel: ?ToastModel = Option<ToastModel>.None

    protected override func aboutToAppear(): Unit {
        //-----测试指示器-------------
        this.fadeGridmodel = FadingGridModel()
        .setColorArray([Color.BLACK])
        .setWidth(50.0)
        .setHeight(50.0)
        .setRowsGap(2.0)
        .setColumnsGap(2.0)

        this.loadingModel
        .setIndicatorType(EasyLoadingIndicatorType.FADINGGRID)
        .setFadingGridModel(this.fadeGridmodel())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

        //--------------测试Toast---无图标--------

        this.loadingModel1
        .setText("Toast")
        .setWidth(80.0)
        .setHeight(50.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

         //--------------测试Toast---有图标--------
        this.toastModel = ToastModel()
        .setWidth(50.0)
        .setHeight(50.0)
        .setIcon(@r(app.media.dui))

        this.loadingModel2
        .setText("Great Success!")
        .setWidth(140.0)
        .setHeight(110.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setToastModel(this.toastModel())
        .setMaskDisplayAnimator(0.5)
        .setScaleAnimator(1.0)
        .setRotateAnimator(360.0)

        //--------------测试Toast---offset--------
        this.loadingModel3
        .setText("Toast")
        .setWidth(80.0)
        .setHeight(50.0)
        .setBackground(Color.BLACK)
        .setFontColor(Color.WHITE)
        .setIndicatorType(EasyLoadingIndicatorType.TOAST)
        .setMaskDisplayAnimator(0.5)
        .setIsOffset(true)
        .setOffsetDirection(Alignment.Top)
        .setOffsetY(70.0)
        //.setScaleAnimator(1.0)
        //.setRotateAnimator(360.0)


    }
    func build() {
         Column {
            Column() {
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
                Column() {
                        Row{
                            Text("showToastOffset").fontColor(Color.BLUE).margin(right:10)
                            .onClick ({ event =>
                                this.loadingModel3 = this.loadingModel3.show()
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