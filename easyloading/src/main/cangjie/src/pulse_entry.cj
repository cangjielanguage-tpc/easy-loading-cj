/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

public class PulseAnimator {
    /**
     * object that is updated upon animation update
     */
    private var pulseListener: ?PulseModel = None
    /**
     * The phase of drawn values on the y-axis.
     */
    protected var scaleValue: Float64 = 1.0
    /** The phase of drawn values on the x-axis. 0 - 1 */
    private var isShowXCallback: Bool = false
    private var isShowYCallback: Bool = false
    var _animator: ?AnimatorResult = None

    public init(listener: ?PulseModel) {
        this.pulseListener = listener
    }

    private func scaleAnimator(duration: Int32, easing: String): AnimatorResult {
        let options: AnimatorOptions = AnimatorOptions(
            duration: duration,
            easing: easing,
            delay: 0,
            fill: AnimatorFill.None,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        let animatorResult = AnimatorResult(options)
        animatorResult.onframe = {
            value =>
            this.scaleValue = value
            if (this.isShowYCallback && this.pulseListener.isSome()) {
                this.pulseListener?.onAnimationUpdateScale(animatorResult)
            }
        }

        return animatorResult
    }

    public func animateY(durationMillis: Int32, easing!: String = "linear") {
        if (let Some(v) <- this._animator) {
            v.finish()
        }
        let animatorY: AnimatorResult = this.scaleAnimator(durationMillis, easing)
        this._animator = animatorY
        this.isShowXCallback = false
        this.isShowYCallback = true
        _animator().play()
    }

    public func offAnimateY() {
        if (let Some(v) <- this._animator) {
            v.finish()
        }
    }

    public func getScaleValue(): Float64 {
        return this.scaleValue
    }
}
