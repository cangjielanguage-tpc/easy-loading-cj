/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class PulseModel {
    var color: Color = Color.BLACK

    var size: Float64 = 50.0

    var duration: Int64 = 1000

    var mAnimator: ?PulseAnimator = None

    @Publish
    var scaleValue: Float64 = 1.0

    public func init_data() {
        this.mAnimator = PulseAnimator(this)
    }

    public func onAnimationUpdateScale(result: AnimatorResult): Unit {
        this.scaleValue = this.mAnimator().getScaleValue()
    }

    public func animateY(time: Int32) {
        this.mAnimator().animateY(time, easing: "ease-in-out")
    }
    public func offAnimateY() {
        this.mAnimator().offAnimateY()
    }
    public func getColor(): Color {
        return this.color
    }

    public func setColor(color: Color): PulseModel {
        this.color = color
        return this
    }

    public func getSize(): Float64 {
        return this.size
    }

    public func setSize(size: Float64): PulseModel {
        this.size = size
        return this
    }

    public func getScaleValue(): Float64 {
        return this.scaleValue
    }
}

@Component
public class PulseComponent {
    @State
    var pulseModel: ?PulseModel = Option<PulseModel>.None

    @State
    var size: Float64 = 0.0
    var color: Color = Color.WHITE

    var width: Float64 = 300.0

    var height: Float64 = 300.0

    protected override func aboutToAppear() {
        if (pulseModel.isNone()) {
            throw Exception("PulseModel cannot be Null")
        }
        this.size = this.pulseModel().getSize()
    }
    protected override func aboutToDisappear() {
        if (pulseModel.isNone()) {
            throw Exception("PulseModel cannot be Null")
        }
        this.pulseModel().offAnimateY()
    }

    func build() {
        RelativeContainer() {
            Row() {
                ScalePulseComponent(size: this.size, pulseModel: this.pulseModel())
            }.width(this.size).height(this.size).alignRules(
                AlignRuleOption(
                    top: VerticalAnchor("__container__", VerticalAlign.Top),
                    bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                    left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                    right: HorizontalAnchor("__container__", HorizontalAlign.End),
                )
            )
        }.width(this.width).height(this.height).backgroundColor(this.color).border(width: 2.vp, color: Color(0x6699ff))
    }
}

@Component
public class ScalePulseComponent {
    @State
    var pulseModel: PulseModel = PulseModel()

    @State
    var size: Float64 = 0.0

    @State
    var color: Color = Color.BLACK

    @State
    var alignment: Alignment = Alignment.Center

    protected override func aboutToAppear() {
        color = this.pulseModel.getColor()
    }

    func build() {
        Stack(Alignment.Center) {
            Rect(width: this.size, height: this.size).fill(this.color).scale(
                Float32(abs(1.0 - pulseModel.getScaleValue()))).opacity(pulseModel.getScaleValue())
        }
    }
}
