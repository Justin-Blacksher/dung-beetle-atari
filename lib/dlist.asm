
; Load Display List
.proc setup_screen
lms = $40                   ; Load memory scan
jvb = $41                   ; Jump while vertical blank
; Antic Modes
antic2 = 2                  ; Antic mode 2
antic3 = 3                  ; Antic mode 3
antic4 = 4                  ; Antic mode 4
antic5 = 5                  ; Antic mode 5
antic6 = 6                  ; Antic mode 6
antic7 = 7                  ; Antic mode 7
    mwa #dlist SDLSTL
    rts
; Display list
dlist
    .byte blank8, blank8, blank8
    .byte antic5 + lms, <screen, >screen
    .byte antic5, antic5, antic5, antic5, antic5, antic5
    .byte antic5, antic5, antic5, antic5, antic5
    .byte jvb, <dlist, >dlist
    .endp
