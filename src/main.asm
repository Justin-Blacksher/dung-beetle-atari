; Evil Dung Beetle
; Assemble in MADS: mads -l -t main.asm
; ATASCII Table: https://www.atariwiki.org/wiki/attach/Atari%20ATASCII%20Table/ascii_atascii_table.pdf
; ATASCII 0-31 Screen code 64-95
; ATASCII 32-95 Screen code 0-63
; ATASCII 96-127 Screen code 96-127

; NTSC Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-47505700-1443889945.png
; PAL Color Palette: https://atariage.com/forums/uploads/monthly_10_2015/post-6369-0-90255700-1443889950.png


    org $2000

    icl '../lib/hardware.asm'

charset = $3c00             ; Character set
screen = $4000              ; Screen buffer
blank8 = $70                ; 8 blank lines





    setup_screen()          ; Sets up the Screen
    setup_colors()          ; Sets up the colors
; Set up the character set
    mva #>charset CHBAS
    
    ldx #0
loop

    mva chars,x charset+8,x
    inx
    cpx #16
    bne loop



    ldy #0

loop2
    mva scene,y screen,y
    iny
    cpy #12
    bne loop2

    jmp *

    icl '../lib/dlist.asm'

; Change colors
;-------------------------------------------------------
; Proc: setup_colors
; Sets up the colors for the game
;-------------------------------------------------------
.proc setup_colors
; Color Pallett
bg_black = $00                          ; 00 Black
poop_brown = $f2                        ; f2 Brown
poop_peanut = $f4                       ; f4 yellow-brown
green_grass = $b2                       ; b2 Green
blue_water = $84                        ; 84 Blue 
    mva #poop_brown COLOR0              ; 01
    mva #poop_peanut COLOR1             ; 10
    mva #green_grass COLOR2             ; 11
    mva #blue_water COLOR3              ; 11 (reverse)
    mva #bg_black COLOR4                ; 00 
    rts
    .endp


scene
    .byte 1,2,1,2,1,2,1,2,1,2


chars

    .byte %10101010
	.byte %10100101
	.byte %01010101
	.byte %00000000
	.byte %01010010
	.byte %01010010
	.byte %01010010
	.byte %00000000
	
	.byte %01001010
	.byte %01001010
	.byte %00001001
	.byte %00000000
	.byte %10101001
	.byte %10010101
	.byte %01010101
	.byte %00000000