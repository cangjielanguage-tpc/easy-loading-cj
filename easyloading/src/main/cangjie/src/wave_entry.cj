/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.concurrency.*

@Observed
public class WaveEntry {
    @Publish
    var scaleY: Float64 = 1.0
    var color: Color = Color.RED
    var mAnimator: ?ChartAnimator = None

    public func init_data(color: Color) {
        this.color = color
        this.mAnimator = ChartAnimator(this)
    }
    public func onAnimationUpdate(result: AnimatorResult): Unit {
        this.scaleY = this.mAnimator().getPhaseY()
    }

    public func animateY(durationMillis: Int32, index: Int64, easing!: String = "linear"): Unit {
        this.mAnimator().animateY(durationMillis, index, easing: easing)
    }

    public func offAnimateY() {
        this.mAnimator().offAnimateY()
    }

    /**
     * This is the same as getY(). Returns the value of the PiEntry.
     *
     * @return
     */
    public func getScaleY(): Float64 {
        return this.scaleY
    }

    public func getColor(): Color {
        return this.color
    }

    public func setColor(color: Color): Unit {
        this.color = color
    }
}

public interface AnimatorUpdateListener {
    func onAnimationUpdate(result: AnimatorResult): Unit
}

public class ChartAnimator {
    /**
     * object that is updated upon animation update
     */
    private var mListener: ?WaveEntry
    /**
     * The phase of drawn values on the y-axis.
     */
    protected var mPhaseY: Float64 = 1.0
    /** The phase of drawn values on the x-axis. 0 - 1 */
    private var isShowXCallback: Bool = false
    private var isShowYCallback: Bool = false
    var _animator: ?AnimatorResult = None

    public init(listener: ?WaveEntry) {
        this.mListener = listener
    }

    private func yAnimator(duration: Int32, index: Int64, easing: String): AnimatorResult {
        let options: AnimatorOptions = AnimatorOptions(
            duration: duration,
            easing: easing,
            delay: Int32(index) * 100,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.4
        )
        let animatorResult = AnimatorResult(options)
        animatorResult.onframe = {
            value =>
            this.mPhaseY = value
            if (this.isShowYCallback && this.mListener.isSome()) {
                this.mListener?.onAnimationUpdate(animatorResult)
            }
        }

        return animatorResult
    }

    public func animateY(durationMillis: Int32, index: Int64, easing!: String = "linear") {
        if (let Some(v) <- this._animator) {
            v.finish()
        }
        let animatorY: AnimatorResult = this.yAnimator(durationMillis, index, easing)
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

    public func getPhaseY(): Float64 {
        return this.mPhaseY
    }
}
