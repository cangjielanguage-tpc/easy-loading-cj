/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.concurrency.*

public class EasyLoadingModel {
    var loadingStyle: EasyLoadingStyle = EasyLoadingStyle.LIGHT
    var indicatorType: EasyLoadingIndicatorType = EasyLoadingIndicatorType.WAVE
    var maskType: EasyLoadingMaskType = EasyLoadingMaskType.NONE
    var toastPosition = Alignment.Center
    var animationStyle = EasyLoadingAnimationStyle.OPACITY
    var textAlign = TextAlign.Center
    var indicatorSize = 40.0
    var radius = 5.0
    var fontSize = 15.0
    var progressWidth = 2.0
    var lineWidth = 4.0
    var displayDuration: Int64 = 2000
    var animationDuration: Int64 = 200
    //    var textPadding = 10.0

    var status: String = "loading..."
    var showType: ShowType = ShowType.INDICATOR
    var dismissOnTap: Bool = false
    var textColor: ?Color = None
    var backgroundColor: ?Color = None
    //    var duration: Int64 = 2000

    var indicatorColor: ?Color = None
    var progressColor: ?Color = None
    var maskColor: ?Color = None

    public func show() {
        if (loadingStyle == EasyLoadingStyle.CUSTOM && backgroundColor.isNone()) {
            throw Exception("while loading style is custom, backgroundColor should not be null")
        }
    }
    public func showSuccess() {
        showType = ShowType.SHOWSUCCESS

        show()
    }

    public func showProgress() {
        showType = ShowType.SHOWPROGRESS
        show()
    }

    public func showError() {
        showType = ShowType.SHOWERROR
        show()
    }

    public func showInfo() {
        showType = ShowType.SHOWINFO
        show()
    }

    public func showToast() {
        showType = ShowType.SHOWTOAST
        show()
    }
    public func dismiss() {
        showType = ShowType.DISMISS
    }

    public func getStatus(): String {
        return this.status
    }

    public func setStatus(status: String): EasyLoadingModel {
        this.status = status
        return this
    }

    public func getTextColor(): ?Color {
        return this.textColor
    }

    public func setTextColor(textColor: ?Color): EasyLoadingModel {
        this.textColor = textColor
        return this
    }
}

@Component
public class EasyLoadingComponent {
    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()

    @State
    var status: String = "loading..."

    @State
    var maskColor: Color = Color.BLACK

    @State
    var alignment: Alignment = Alignment.Center

    @State
    var dismissOnTap: Bool = false

    @State
    var maskType: EasyLoadingMaskType = EasyLoadingMaskType.NONE

    @State
    var indicatorType: EasyLoadingIndicatorType = EasyLoadingIndicatorType.WAVE

    //    @State
    //    var indicatorsComponent: IndicatorsComponent = IndicatorsComponent()

    protected override func aboutToAppear() {
        this.status = this.loadingModel.getStatus()
        this.alignment = this.loadingModel.toastPosition
        this.dismissOnTap = this.loadingModel.dismissOnTap
        this.indicatorType = this.loadingModel.indicatorType
    }

    func build() {
        IndicatorComponent(status: this.status, indicatorType: this.indicatorType, loadingModel: this.loadingModel)
    }
}

@Component
public class IndicatorComponent {
    @State
    var status: String = "loading..."

    @State
    var loadingModel: EasyLoadingModel = EasyLoadingModel()

    @State
    var easyLoadingTheme: ?EasyLoadingTheme = Option<EasyLoadingTheme>.None

    @State
    var indicatorType: EasyLoadingIndicatorType = EasyLoadingIndicatorType.WAVE

    @State
    var waveModel: WaveModel = WaveModel()

    protected override func aboutToAppear() {
        this.waveModel.setSize(120.0)
        this.waveModel.setColors([Color.RED, Color.GREEN, Color.BLACK])
        this.waveModel.setItemCount(8)
        this.waveModel.init_data()
        this.waveModel.animateY(600, easing: "ease-inout")
        this.easyLoadingTheme = EasyLoadingTheme(this.loadingModel)
    }

    func build() {
        Column {
            if (this.indicatorType == EasyLoadingIndicatorType.WAVE) {
                WaveComponent(waveModel: this.waveModel)
            } else {
                Text("undefined").fontSize(30)
            }
            if (status != "") {
                Text(status).textAlign(TextAlign.Start).fontColor(this.easyLoadingTheme().getTextColor())
            }
        }
    }
}
