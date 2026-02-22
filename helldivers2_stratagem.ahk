#Requires AutoHotkey v2.0
#SingleInstance Force

; Slow down globally to help games capture key states
SetKeyDelay(100, 100)

#HotIf WinActive("ahk_exe helldivers2.exe")

; --- STRATAGEM BINDINGS (UDLR) ---
Numpad1::   CallStratagem("RDLUU")   ; Orbital Gatling Barrage
Numpad2::   CallStratagem("URUL")    ; Eagle 110mm Rocket Pods
Numpad3::   CallStratagem("DDLUR")   ; EAT-17 Expendable Anti-Tank

Numpad4::   CallStratagem("DURRU")   ; A/MG-43 Machine Gun Sentry
Numpad5::   CallStratagem("DURL")    ; A/G-16 Gatling Sentry
Numpad6::   CallStratagem("DURULU")  ; A/AC-8 Autocannon Sentry

Numpad7::   CallStratagem("RRDLRD")  ; Orbital 120mm HE Barrage
Numpad8::   CallStratagem("RRDLRU")  ; Orbital Napalm Barrage
Numpad9::   CallStratagem("URDDD")   ; Eagle 500kg Bomb

Numpad0::   CallStratagem("UDRLU")   ; Reinforce
NumpadDot:: CallStratagem("DDUR")    ; Resupply

; Arrow scancodes: Up=SC148 Down=SC150 Left=SC14B Right=SC14D
CallStratagem(code) {
    code := StrReplace(code, " ", "")

    SendInput("{LCtrl Down}")
    Sleep(150)

    Loop Parse code {
        ch := A_LoopField
        sc := ""

        if (ch = "U")
            sc := "SC148"
        else if (ch = "D")
            sc := "SC150"
        else if (ch = "L")
            sc := "SC14B"
        else if (ch = "R")
            sc := "SC14D"

        if (sc != "") {
            SendInput("{" sc " Down}")
            Sleep(60)
            SendInput("{" sc " Up}")
            Sleep(60)
        }
    }

    Sleep(80)
    SendInput("{LCtrl Up}")
}

F12::Suspend
#HotIf
