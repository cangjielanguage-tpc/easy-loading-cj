/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

public class SpinChasingDotsChartAnimator {
    /**
     * object that is updated upon animation update
     */
    private var spinChasingDotsListener: ?SpinChasingDotsModel = None
    /**
     * The phase of drawn values on the y-axis.
     */
    protected var rotateValue: Float64 = 0.0
    protected var scaleValue: Float64 = 1.0
    /** The phase of drawn values on the x-axis. 0 - 1 */
    private var isShowXCallback: Bool = false
    private var isShowYCallback: Bool = false
    var _animator: ?AnimatorResult = None
    var scale_animator: ?AnimatorResult = None

    public init(listener: ?SpinChasingDotsModel) {
        this.spinChasingDotsListener = listener
    }

    private func yAnimator(duration: Int32, easing: String): AnimatorResult {
        let options: AnimatorOptions = AnimatorOptions(
            duration: duration,
            easing: easing,
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Normal,
            iterations: -1,
            begin: 0.0,
            end: 360.0
        )
        let animatorResult = AnimatorResult(options)
        animatorResult.onframe = {
            value =>
            this.rotateValue = value
            if (this.isShowYCallback && this.spinChasingDotsListener.isSome()) {
                this.spinChasingDotsListener?.onAnimationUpdate(animatorResult)
            }
        }

        return animatorResult
    }

    private func scaleAnimator(duration: Int32, easing: String): AnimatorResult {
        let options: AnimatorOptions = AnimatorOptions(
            duration: duration / 2,
            easing: easing,
            delay: 0,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.0
        )
        let animatorResult = AnimatorResult(options)
        animatorResult.onframe = {
            value =>
            this.scaleValue = value
            if (this.isShowYCallback && this.spinChasingDotsListener.isSome()) {
                this.spinChasingDotsListener?.onAnimationUpdateScale(animatorResult)
            }
        }

        return animatorResult
    }

    public func animateY(durationMillis: Int32) {
        if (let Some(v) <- this._animator) {
            v.finish()
        }
        if (let Some(v) <- this.scale_animator) {
            v.finish()
        }
        let animatorY: AnimatorResult = this.yAnimator(durationMillis, "linear")
        let scaleAnimator: AnimatorResult = this.scaleAnimator(durationMillis, "ease-in-out")
        this._animator = animatorY
        this.scale_animator = scaleAnimator
        this.isShowXCallback = false
        this.isShowYCallback = true
        _animator().play()
        scale_animator().play()
    }

    public func offAnimateY() {
        if (let Some(v) <- this._animator) {
            v.finish()
        }
        if (let Some(v) <- this.scale_animator) {
            v.finish()
        }
    }

    public func getRotateValue(): Float64 {
        return this.rotateValue
    }

    public func getScaleValue(): Float64 {
        return this.scaleValue
    }
}
