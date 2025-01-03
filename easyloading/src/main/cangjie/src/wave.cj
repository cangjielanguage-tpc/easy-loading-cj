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
public class WaveModel {
    var colors: Array<Color> = []

    var itemCount: Int64 = 5

    var size: Float64 = 50.0

    var spinKitWaveType: SpinKitWaveType = SpinKitWaveType.START

    var duration: Int64 = 1200

    @Publish
    var entrys: ArrayList<WaveEntry> = ArrayList<WaveEntry>()

    var phaseY: Float64 = 0.0

    public func init_data() {
        for (index in 0..itemCount) {
            var entry = WaveEntry()
            entry.init_data(this.colors[index % this.colors.size])
            entrys.append(entry)
        }
    }

    public func animateY(time: Int32, easing!: String = "linear") {
        for (index in 0..entrys.size) {
            entrys[index].animateY(time, index, easing: easing)
        }
    }

    public func offAnimateY() {
        for (index in 0..entrys.size) {
            entrys[index].offAnimateY()
        }
    }

    public func getColors(): Array<Color> {
        return this.colors
    }

    public func setColors(colors: Array<Color>): WaveModel {
        this.colors = colors
        return this
    }

    public func getItemCount(): Int64 {
        return this.itemCount
    }

    public func setItemCount(itemCount: Int64): WaveModel {
        this.itemCount = itemCount
        return this
    }

    public func getSize(): Float64 {
        return this.size
    }

    public func setSize(size: Float64): WaveModel {
        this.size = size
        return this
    }

    public func getSpinKitWaveType(): SpinKitWaveType {
        return this.spinKitWaveType
    }

    public func setSpinKitWaveType(spinKitWaveType: SpinKitWaveType): WaveModel {
        this.spinKitWaveType = spinKitWaveType
        return this
    }

    public func getDuration(): Int64 {
        return this.duration
    }

    public func setDuration(duration: Int64): WaveModel {
        this.duration = duration
        return this
    }
}

@Component
public class WaveComponent {
    @State
    var waveModel: WaveModel = WaveModel()
    @State
    var itemCount: Int64 = 0

    @State
    var size: Float64 = 0.0
    var color: Color = Color.WHITE

    var width: Float64 = 300.0

    var height: Float64 = 300.0
    //    @State
    //    var bars: Array<Float64> = []

    //    @State var bars: ObservedArray<Float64> = ObservedArray<Float64>([])

    protected override func aboutToAppear() {
        this.itemCount = waveModel.itemCount
        this.size = waveModel.size
        //        bars = getAnimationDelay(itemCount)
        //        bars = [1.5, 1.4, 1.3, 1.2, 1.1]

    }
    protected override func aboutToDisappear() {
        this.waveModel.offAnimateY()
    }

    func getAnimationDelay(itemCount: Int64): Array<Float64> {
        match (waveModel.spinKitWaveType) {
            case SpinKitWaveType.START => return startAnimationDelay(itemCount)
            case SpinKitWaveType.END => return endAnimationDelay(itemCount)
            case SpinKitWaveType.CENTER => return centerAnimationDelay(itemCount)
        }
    }

    func startAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 - (Float64(index) * 0.1) - 0.1
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            var endNum: Float64 = 0.0
            if (isOdd) {
                endNum = 0.1
            }
            endArray[index] = -1.0 + (Float64(index) * 0.1) + endNum
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func endAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 + (Float64(index) * 0.1) + 0.1
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            var endNum: Float64 = 0.0
            if (isOdd) {
                endNum = 0.1
            }
            endArray[index] = -1.0 - (Float64(index) * 0.1) - endNum
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func centerAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 + (Float64(index) * 0.2) + 0.2
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            endArray[index] = -1.0 + (Float64(index) * 0.2) + 0.2
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func build() {
        RelativeContainer() {
            Row() {
                ForEach(
                    this.waveModel.entrys,
                    itemGeneratorFunc: {
                        item: WaveEntry, index: Int64 => ScaleYComponent(itemCount: this.waveModel.getItemCount(),
                            size: this.waveModel.getSize(), entry: item)
                    }
                )
            }.width(this.size * 1.25).height(this.size).align(Alignment.Center).justifyContent(FlexAlign.SpaceBetween).
                alignRules(
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
public class ScaleYComponent {
    @State
    var entry: WaveEntry = WaveEntry()

    @State
    var itemCount: Int64 = 0

    @State
    var size: Float64 = 0.0

    @State
    var alignment: Alignment = Alignment.Center

    protected override func aboutToAppear() {
    }

    func build() {
        Column {
            Rect(width: this.size / Float64(this.itemCount), height: this.size).fill(entry.getColor()).scaleY(
                Float32(entry.getScaleY()))
        }
    }
}
