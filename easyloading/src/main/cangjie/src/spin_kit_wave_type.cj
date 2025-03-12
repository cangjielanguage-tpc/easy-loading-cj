/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading
import ohos.component.Circle

public enum SpinKitWaveType {
    | START
    | END
    | CENTER

    public operator func ==(b: SpinKitWaveType): Bool {
        match ((this, b)) {
            case (START, START) => true
            case (END, END) => true
            case (CENTER, CENTER) => true
            case _ => false
        }
    }

    public operator func !=(b: SpinKitWaveType): Bool {
        return !(this == b)
    }
}

public enum EasyLoadingIndicatorType {
    | FADINGCIRCLE
    | CIRCLE
    | THREEBOUNCE
    | CHASINGGDOTS
    | WAVE
    | WANDERINGCUBES
    | ROTATEEIGHTCIRCLES
    | ROTATEFOURCIRCLES
    | ROTATECIRCLES
    | MOVERING
    | STATICCIRCLE
    | ROTATINNGPLAIN
    | DOUBLEBOUNCE
    | FADINGFOUR
    | FADINGCUBE
    | PULSE
    | CUBEGRID
    | ROTATINGCIRCLE
    | FOLDINGCUBE
    | PUMPINGHEART
    | DUALRING
    | HOURGLASS
    | POURINGGHOURGLASS
    | FADINGGRID
    | RING
    | SPINNINGCIRCLE
    | SQUARECIRCLE
    | TOAST

    public operator func ==(b: EasyLoadingIndicatorType): Bool {
        match ((this, b)) {
            case (FADINGCIRCLE, FADINGCIRCLE) => true
            case (CIRCLE, CIRCLE) => true
            case (THREEBOUNCE, THREEBOUNCE) => true
            case (CHASINGGDOTS, CHASINGGDOTS) => true
            case (WAVE, WAVE) => true
            case (WANDERINGCUBES, WANDERINGCUBES) => true
            case (ROTATEEIGHTCIRCLES, ROTATEEIGHTCIRCLES) => true
            case (ROTATEFOURCIRCLES, ROTATEFOURCIRCLES) => true
            case (ROTATECIRCLES, ROTATECIRCLES) => true
            case (MOVERING, MOVERING) => true
            case (STATICCIRCLE, STATICCIRCLE) => true
            case (ROTATINNGPLAIN, ROTATINNGPLAIN) => true
            case (DOUBLEBOUNCE, DOUBLEBOUNCE) => true
            case (FADINGFOUR, FADINGFOUR) => true
            case (FADINGCUBE, FADINGCUBE) => true
            case (PULSE, PULSE) => true
            case (CUBEGRID, CUBEGRID) => true
            case (ROTATINGCIRCLE, ROTATINGCIRCLE) => true
            case (FOLDINGCUBE, FOLDINGCUBE) => true
            case (PUMPINGHEART, PUMPINGHEART) => true
            case (DUALRING, DUALRING) => true
            case (HOURGLASS, HOURGLASS) => true
            case (POURINGGHOURGLASS, POURINGGHOURGLASS) => true
            case (FADINGGRID, FADINGGRID) => true
            case (RING, RING) => true
            case (SPINNINGCIRCLE, SPINNINGCIRCLE) => true
            case (SQUARECIRCLE, SQUARECIRCLE) => true
            case (TOAST, TOAST) => true
            case _ => false
        }
    }

    public operator func !=(b: EasyLoadingIndicatorType): Bool {
        return !(this == b)
    }
}

public enum ShowShapeType {
    | Circle
    | Rect

    public operator func ==(b: ShowShapeType): Bool {
        match ((this, b)) {
            case (Circle, Circle) => true
            case (Rect, Rect) => true
            case _ => false
        }
    }
}

public enum EasyLoadingMaskType {
    | NONE
    | CLEAR
    | BLACK
    | CUSTOM

    public operator func ==(b: EasyLoadingMaskType): Bool {
        match ((this, b)) {
            case (NONE, NONE) => true
            case (CLEAR, CLEAR) => true
            case (BLACK, BLACK) => true
            case (CUSTOM, CUSTOM) => true
            case _ => false
        }
    }
}

public enum ShowType {
    | INDICATOR
    | SHOWPROGRESS
    | SHOWSUCCESS
    | SHOWERROR
    | SHOWINFO
    | SHOWTOAST
    | DISMISS
}

public enum EasyLoadingStyle {
    | LIGHT
    | DARK
    | CUSTOM

    public operator func ==(b: EasyLoadingStyle): Bool {
        match ((this, b)) {
            case (LIGHT, LIGHT) => true
            case (DARK, DARK) => true
            case (CUSTOM, CUSTOM) => true
            case _ => false
        }
    }
}

//public enum EasyLoadingToastPosition {
//    | TOP
//    | CENTER
//    | BOTTOM
//}

public enum EasyLoadingAnimationStyle {
    | OPACITY
    | OFFSET
    | SCALE
    | CUSTOM
}

public enum ShapeStyle{
    | CIRCLE
    | RECT
    public operator func ==(b: ShapeStyle): Bool {
        match ((this, b)) {
            case (CIRCLE, CIRCLE) => true
            case (RECT, RECT) => true
            case _ => false
        }
    }
    public operator func !=(b: ShapeStyle): Bool {
        return !(this == b)
    }
}
