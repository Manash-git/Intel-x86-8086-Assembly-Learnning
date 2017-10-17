                            speedOfBall = 2    ; THe Higher the Slower the Ball  this enum is used for ballDelay 

.model small
.stack 100H
.data
Lives db 51                    ;The Lives Which will be displayed
Score db 48                    ;The Score Which will be displayed 

s1 db 'Score : $'              ;The Score string will be used to display Score
v1 db 'Lives : $'              ;The Lives string will be used to display lives 
ballDelay db 0                 ;This is the delay when the ball Moves the loop uses it every (delayed iteration) for moving and resets it to 0 
ballLeft db 38                 ;This var will hold the Balls Y-axis
ballUp db 23                   ;This var will hold the Balls X-axis 
padLocTop db 24                ;This var will hold the Bar Y-axis
padLocLeft db 36               ;This var will hold the Bar X-axis   
moveBallDown db 2              ;Will determine the ball State Up/Down/Idle , 2 = Idle, 1 = Up, 0 = Down
moveBallLeft db 1              ;Will determine the Ball Left Right state   , 1 = Left, 0 = Right
pBallUp db 23                  ;Will be used for Ball Previous Top Location 
pBallLeft db 38                ;Will be used for Ball Previous Left Location
pBarUp db 24                   ;Will be used for Bar Previous Top Location [- Future Level planning -]
pBarLeft db 36                 ;Will be used for Bar Previous Left Location 

brick1LocTop  db  3                  
brick1LocLeft db 10
brick2LocTop  db  3                  
brick2LocLeft db 18
brick3LocTop  db  3                  
brick3LocLeft db 26
brick4LocTop  db  3                  
brick4LocLeft db 34
brick5LocTop  db  3                  
brick5LocLeft db 42
brick6LocTop  db  3                  
brick6LocLeft db 50
brick7LocTop  db  3                  
brick7LocLeft db 58
brick8LocTop  db  3                  
brick8LocLeft db 66

brick10LocTop  db  5                  
brick10LocLeft db 10
brick20LocTop  db  5                  
brick20LocLeft db 18
brick30LocTop  db  5                  
brick30LocLeft db 26
brick40LocTop  db  5                  
brick40LocLeft db 34
brick50LocTop  db  5                  
brick50LocLeft db 42
brick60LocTop  db  5                  
brick60LocLeft db 50
brick70LocTop  db  5                  
brick70LocLeft db 58
brick80LocTop  db  5                  
brick80LocLeft db 66

brick01LocTop  db  7                  
brick01LocLeft db 10
brick02LocTop  db  7                  
brick02LocLeft db 18
brick03LocTop  db  7                  
brick03LocLeft db 26
brick04LocTop  db  7                  
brick04LocLeft db 34
brick05LocTop  db  7                  
brick05LocLeft db 42
brick06LocTop  db  7                  
brick06LocLeft db 50
brick07LocTop  db  7                  
brick07LocLeft db 58
brick08LocTop  db  7                  
brick08LocLeft db 66


.code
;Resolution Setter
videoModeSetter proc
MOV ah, 0h
MOV al, 03h
INT 10h
RET
videoModeSetter endp

;Cursor Position Setter


;Draw At Specific Area with Color

ThingDraw MACRO Y, X, Color, Letter, Times    
MOV ah, 02h
MOV bh, 0h
MOV dh, Y
MOV dl, X
INT 10h
mov ah, 09h
mov al, Letter
mov bh, 0
mov bl, Color
mov cx, Times
int 10h
ENDM


exit:
MOV ah, 4ch
INT 21h
 
BrickAndColl Macro Y, X               
      LOCAL trueD,dafa,phase22,fifo,lifo,Lefter
    mov dl, Y                  
    ThingDraw dl, X, 0Eh, 178,4   
    mov dl, Y
    cmp dl, ballUp            
    jl dafa                
    dec dl
    cmp ballUp,dl
    jl dafa
    
    
    mov dl, X
    cmp ballLeft, dl
    jl dafa     
    add dl, 2
    cmp dl, ballLeft
    jl dafa
    
    mov dl, Y
    ThingDraw dl, X, 0Eh, 0,4 ;Removed tis 
    add Y, 30
    ;-----------------Up DOwn Switcher--------------;
    cmp moveBallDown, 0
    jne lifo
    mov moveBallDown, 1
    ret
    lifo:
    mov moveBallDown, 0  
   
    ;------------------Left Right Switcher-------------;
    Lefter:
    cmp moveBallLeft, 0
    jne fifo
    mov moveBallLeft, 1
    fifo:
    mov moveBallLeft, 0
    
    ;-----------------Score Addder -----------------;
    add Score,1
    dafa:
  ENDM 

;Program Starting Point
input proc
    MOV ah, 01h
    INT 16h                 ;Get Keystroke [ah = 01h]
    jz processInputEnd      ;Jump to End if No [KeyStroke was Get]
    processinputGet:
    MOV ah, 0               ;Check KeyStroke
    INT 16h
    CMP ax, 4D00h           ;Right ArrowKey
    jne nextKey2
    cmp padLocLeft, 72
    je nextKey2
    mov bl, padLocLeft
    mov pBarLeft, bl
    add padLocLeft, 2
    cmp moveBallDown, 2
    jne nextKey2
    mov bh, ballLeft
    mov pBallLeft, bh
    add ballLeft, 2
    nextKey2:

    CMP ax, 4B00h           ;Left ArrowKey
    jne nextKey3
    cmp padLocLeft, 4
    je nextKey3
    mov bl, padLocLeft
    mov pBarLeft, bl
    sub padLocLeft,2
    cmp moveBallDown, 2
    jne nextKey3     
    mov bh, ballLeft
    mov pBallLeft, bh
    sub ballLeft, 2
    nextKey3:

    CMP al, 32               ;Space Key
    jne nextKey4
    cmp moveBallDown, 2
    jne nextKey4
    mov moveBallDown, 1

    nextKey4:
    CMP al, 27D             ;Escape Key
    je exit                 ;Go to Exit if Escape was Pressed
    processInputEnd:
    ret 
input endp

main proc
    MOV ax,@data
    MOV ds, ax
    call videoModeSetter
    
    mov ah, 01h  ;Define Cursor Appearence
    mov ch, 20h  ;Invisible Cursor Code
    int 10h      ; Graphics Interrupt!  
    
    ThingDraw 1, 4, 06h, 205,74 ;Draw straight Wall
    ThingDraw 1, 3, 06h, 213,1  ;Draw TopLeft Wall Edge
    mov cl, 2 ; Loop times for recurse draw
    mov ch, 3 ; start draw Position -Y- for recursedraw
    call RecurseDraw ; Draw Vertical Walls for Left Side
    ThingDraw 1, 77, 06h, 184,1 ;Top Right Edge 
    mov cl, 2  ; recursion count
    mov ch, 77 ; Y axis for recurse draw
    call RecurseDraw ; Draw Vertical Walls for Right Side
    call gameLoop
main endp

scoreWrite:
 mov al, score
 mov ah, 0
 mov dl, 0
 mov dh, 0
 mov bl, 10
 mov cl, 0
 getOthers:
 cmp al, 0
 je goOut
 div bl
 push ax 
 mov ah, 2
 goOut:
 POP dx
 int 21h
 loop goOut
ret

scoreLiveDraw:
    MOV ah, 02h
    MOV bh, 0h
    MOV dh, 0
    MOV dl, 4
    INT 10h
    mov ah, 9
    mov dx, offset s1
    int 21h
    ThingDraw 0 ,12  ,02h ,Score ,1
    
    
    MOV ah, 02h
    MOV bh, 0h
    MOV dh, 0
    MOV dl, 69
    INT 10h
    mov ah, 9
    mov dx, offset v1
    int 21h
    ThingDraw 0 ,77  ,02h ,Lives ,1
   ret
 
RecurseDraw:
    cmp cl, 25 
    je baharKaRasta
    PUSH CX
    ThingDraw cl, ch, 06h, 179,1
    POP CX
    inc cl
    call RecurseDraw
    baharKaRasta:
   ret




drawBricks: 
    BrickAndColl brick1LocTop,brick1LocLeft
    BrickAndColl brick2LocTop,brick2LocLeft
    BrickAndColl brick3LocTop,brick3LocLeft
    BrickAndColl brick4LocTop,brick4LocLeft
    BrickAndColl brick5LocTop,brick5LocLeft
    BrickAndColl brick6LocTop,brick6LocLeft
    BrickAndColl brick7LocTop,brick7LocLeft
    BrickAndColl brick8LocTop,brick8LocLeft 
     
    BrickAndColl brick10LocTop,brick1LocLeft
    BrickAndColl brick20LocTop,brick2LocLeft
    BrickAndColl brick30LocTop,brick3LocLeft
    BrickAndColl brick40LocTop,brick4LocLeft
    BrickAndColl brick50LocTop,brick5LocLeft
    BrickAndColl brick60LocTop,brick6LocLeft
    BrickAndColl brick70LocTop,brick7LocLeft
    BrickAndColl brick80LocTop,brick8LocLeft  
    
    BrickAndColl brick01LocTop,brick1LocLeft
    BrickAndColl brick02LocTop,brick2LocLeft
    BrickAndColl brick03LocTop,brick3LocLeft
    BrickAndColl brick04LocTop,brick4LocLeft
    BrickAndColl brick05LocTop,brick5LocLeft
    BrickAndColl brick06LocTop,brick6LocLeft
    BrickAndColl brick07LocTop,brick7LocLeft
    BrickAndColl brick08LocTop,brick8LocLeft  
  ret

;our game Timer which will render and control the game!
gameLoop proc
    call input
    ThingDraw pBallUp ,pBallLeft ,0Ah ,0 ,1       ; Removing Old Position 
    ThingDraw BallUp ,BallLeft ,0Ah ,254 ,1       ; Drawing Pad with New Position
    ThingDraw pBarUp, pBarLeft, 0Ch, 0, 5         ; Removing old Ball Position
    ThingDraw padLocTop, padLocLeft, 0Ch, 219, 5  ; Drawing Ball with new Position
    call drawBricks
    call scoreLiveDraw
    cmp moveBallDown, 2   ;checking if BallReleased
    je na                 ;if not released dont do collision ball move etc directly jmp to sleep 
    call collRight
    call collUp
    call baller      
    call checkBallOut
    na:
    call .sleep
    JMP gameLoop
gameLoop endp


exit2:
MOV ah, 4ch
INT 21h

;---------------------On Collision Left Right ball Move----------------------------;

checkBallOut:
cmp ballUp, 35
jne here
mov bl, Lives
dec bl
cmp bl, 47
je exit2
mov Lives, bl
mov ballUp, 23
mov bl, padLocLeft
add bl, 2 
mov pBallLeft, bl
mov pBallUp, 23
mov ballLeft, bl
mov moveBallDown, 2
here:
ret
collRight proc
CMP moveBallLeft ,1
jne cond1
jmp cond2

cond1:
cmp ballLeft, 76
je true1
jmp exts
true1:
mov moveBallLeft, 1
jmp exts

cond2:
cmp ballLeft, 4
je true2
jmp exts
true2:
mov moveBallLeft, 0
jmp exts

exts:
ret
collRight endp


;---------------------On Collision Up Down ball Move----------------------------;

collUp proc
CMP moveBallDown ,1
jne cond12
jmp cond22
cond12:
cmp ballUp, 23            ;Ball At Paddle now :p
je true12                 ;jump to check if paddle collides
jmp exts2
true12:   

mov cl, ballLeft          ;PaddleColission Left Side axis are not outside
cmp cl, padLocLeft
jl exts2
sub cl, 3                 ;PaddleColission Right Side
cmp padLocLeft, cl        ; if it's in middle doesn't go to return directly
jl phase2
mov moveBallLeft, 1
mov moveBallDown, 1
jmp exts2
phase2:
sub cl,3
cmp padLocLeft, cl        ; if it's in middle doesn't go to return directly
jl exts2
mov moveBallLeft, 0
mov moveBallDown, 1
jmp exts2

cond22:
cmp ballUp, 2
je true22
jmp exts2
true22:
mov moveBallDown, 0
jmp exts2

exts2:
ret
collUp endp


;--------------- Adding Seconds Delay to Program so it doesn't go Pagal -------;
.sleep:
mov cx, 1
sleepTime:
push cx
mov cx, 0F4FFH
sleepDecrease:
dec cx
;jnz sleepDecrease
pop cx
dec cx
jnz sleepTime
ret

baller proc
cmp ballDelay, speedOfBall
jne doIt
call ballMove
mov ballDelay, 0
doIt:
inc ballDelay
ret
baller endp

; -------------------------- Ball Up/Down , Left/Right Movement-------------------------
ballMove proc
mov bl, ballUp
mov bh, ballLeft
mov pBallUp, bl
mov pBallLeft, bh
cmp moveBallDown, 0
je goDown
goUp:
dec ballUp
jmp nextStep
goDown:
inc ballUp
nextStep:

cmp moveBallLeft, 0
je goRight
goLeft:
sub ballLeft, 1
jmp nextStep2
goRight:
add ballLeft, 1
nextStep2:
ret
ballMove endp


END main

