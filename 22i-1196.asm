INCLUDE Irvine32.inc
includelib Winmm.lib

.data


endlife db "YOU LOST ALL YOUR LIVES.",0
rules1 db "  Rules:",0
rules2 db "The player controls Pac-Man, who must eat all the dots inside an enclosed maze while",0
rules3 db "avoiding four colored ghosts. Eating large flashing dots called Power Pellets causes",0
rules4 db "the ghosts to temporarily   turn blue, allowing Pac-Man to eat them for bonus points",0
rules5 db "Your aimto get the most points without being knocked out by ghosts.Fruit and PAC-DOT",0
rules6 db "are worth points. Power cards have special rules, like having two players swap hands.",0
rules7 db "Enter any key to return to home screen !",0
 
choice db ?
choice1 db "Press 1 for LEVEL 1",0
choice2 db "Press 2 for LEVEL 2",0
choice3 db "Press 3 for LEVEL 3",0
choice4 db "Press 4 for instructions",0
choice5 db "Enter Your Choice: ",0

str1 db " _ __   __ _  ___ _ __ ___   __ _ _ __  ",0
str2 db "| '_ \ / _` |/ __| '_ ` _ \ / _` | '_ \ ",0
str3 db "| |_) | (_| | (__| | | | | | (_| | | | |",0
str4 db "| .__/ \__,_|\___|_| |_| |_|\__,_|_| |_|",0
str5 db "|_|",0

str11 db " .================================================.",0
str12 db " |     .-.   .-.     .--.                         |",0
str13 db " |    | OO| | OO|   / _.-' .-.   .-.  .-.   .''.  |",0
str14 db " |    |   | |   |   \  '-. '-'   '-'  '-'   '..'  |",0
str15 db " |    '^^^' '^^^'    '--'                         |",0
str16 db " |===============.  .-.  .================.  .-.  |",0
str17 db " |               | |   | |                |  '-'  |",0
str18 db " |               | |   | |                |       |",0
str19 db " |               | ':-:' |                |  .-.  |",0
str21 db " |   Haider      |  '-'  |     Zia        |  '-'  |",0
str22 db " |==============='       '================'       |",0
str23 db " .================================================.",0


iVal2 db 16       
iValLimit2 db 29

xx1 db 20,20,40,75,90
xy1 db 18,26,23,20,27

yx1 db 5,37,70,100
yy1 db 20,17,21,16

xx2 db 2,25,50,75,100
xy2 db 27,25,27,25,27

yx2 db 20,40,60,80,100
yy2 db 17,17,17,17,17

xx3 db 2,102,82,62,42,22,2,25,50,75,100
xy3 db 22,20,22,20,22,20,27,25,27,25,27

yx3 db 20,40,60,80,100
yy3 db 17,17,17,17,17

fruitx db 1,118,0
fruity db 16,28,0

lv2coinx db 3000 dup(0)
lv2coiny db 3000 dup(0)

lv3coinx db 3000 dup(0)
lv3coiny db 3000 dup(0)

lv1coinx db 3,60,85,110,105,85,30,20,50,45,0
lv1coiny db 28,20,17,19,25,22,27,21,25,18,0

lives db 3
livesPrompt db "Lives: ",0

str24 db "Enter your Name: ",0
str25 db "Welcome to the game ",0

counter db ?

wall  db "---------------",0
wallyy  db "|",0

nam db 50 dup(?)

ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
ground1 BYTE " ",0ah,0
ground2 BYTE " ",0

temp byte ?

strScore BYTE "Your score is: ",0
score dw 0

xPos BYTE 2                      ;initial Player Position
yPos BYTE 28

xPosNPC BYTE  65                    ;initial Bot Position
yPosNPC BYTE 19

xPosNPC2 BYTE  1                    
yPosNPC2 BYTE 19

xPosNPC3 BYTE  118                   
yPosNPC3 BYTE 19

xCoinPos BYTE ?
yCoinPos BYTE ?

inputChar BYTE ?

sound1 db 'E:\ghostkill.wav',0,0,0,0
sound2 db 'E:\pacman_eatfruit.wav',0,0,0,0
sound3 db 'E:\pacman_beginning.wav',0,0,0,0
sound4 db 'E:\pacman_death.wav', 0,0,0,0

 PlaySound   PROTO,
              pszSound:PTR BYTE,
                hmod:DWORD,
                fdwSound:DWORD

.code
main PROC


    
mov eax,green   (white * 16)                            ;Packman Ascii
call SetTextColor
call clrscr

mov dl,40
mov dh,0
call gotoxy
lea edx,str1
call writestring
call crlf

mov dl,40
mov dh,1
call gotoxy
lea edx,str2
call writestring
call crlf

mov dl,40
mov dh,2
call gotoxy
lea edx,str3
call writestring
call crlf

mov dl,40
mov dh,3
call gotoxy
lea edx,str4
call writestring
call crlf

mov dl,40
mov dh,4
call gotoxy
lea edx,str5
call writestring
call crlf
call crlf

lea edx,str24
call writestring
mov ecx,50
lea edx,nam
call readstring
                                      ;  White page start


HOME:


mov eax,green   (white * 16)                            ;Packman Ascii
call SetTextColor
call clrscr

mov dl,40
mov dh,0
call gotoxy
lea edx,str1
call writestring
call crlf

mov dl,40
mov dh,1
call gotoxy
lea edx,str2
call writestring
call crlf

mov dl,40
mov dh,2
call gotoxy
lea edx,str3
call writestring
call crlf

mov dl,40
mov dh,3
call gotoxy
lea edx,str4
call writestring
call crlf

mov dl,40
mov dh,4
call gotoxy
lea edx,str5
call writestring
call crlf
call crlf


mov eax,magenta (white * 16)
call SetTextColor


mov dl,45
mov dh,7
call gotoxy
lea edx,str25
call writestring            ;Welcomes Player

lea edx,nam
call writestring
call crlf
call crlf

mov eax,brown (white * 16)
call SetTextColor

mov dl,20                      ;choices
mov dh,10
call gotoxy
lea edx,choice1
call writestring 

mov dl,20                      
mov dh,12
call gotoxy
lea edx,choice2
call writestring 

mov dl,20                      
mov dh,14
call gotoxy
lea edx,choice3
call writestring 

mov dl,20                      
mov dh,16
call gotoxy
lea edx,choice4
call writestring 


       

mov dl,20                      
mov dh,18
call gotoxy
lea edx,choice5
call writestring  

 INVOKE PlaySound, OFFSET sound3, NULL, 11h
        mov eax,3000
        call delay
call readchar
mov choice,al

        cmp choice,"1"
        je LEVEL1

        cmp choice,"2"
        je LEVEL2

        cmp choice,"3"
        je LEVEL3

        cmp choice,"4"
        je Rules


              Rules:

        mov eax,magenta   (white * 16)                           
        call SetTextColor
        call clrscr

        mov dl,50
        mov dh,2
        call gotoxy
        lea edx,rules1
        call writestring


        mov eax,cyan   (white * 16)                     
        call SetTextColor

        mov dl,15
        mov dh,6
        call gotoxy
        lea edx,rules2
        call writestring


        mov dl,15
        mov dh,8
        call gotoxy
        lea edx,rules3
        call writestring


        mov dl,15
        mov dh,10
        call gotoxy
        lea edx,rules4
        call writestring

        mov dl,15
        mov dh,12
        call gotoxy
        lea edx,rules5
        call writestring

        mov dl,15
        mov dh,14
        call gotoxy
        lea edx,rules6
        call writestring


        mov eax,red   (white * 16)                     
        call SetTextColor
        mov dl,3
        mov dh,18
        call gotoxy
        lea edx,rules7
        call writestring
        call crlf
        call readchar
        jmp HOME


    ; draw ground at (0,29):                                           ; Game Start

      LEVEL1:
 

        mov eax,lightgreen
    call SetTextColor
      call clrscr

mov dl,30
mov dh,2
call gotoxy
lea edx,str11
call writestring
call crlf

mov dl,30
mov dh,3
call gotoxy
lea edx,str12
call writestring
call crlf

mov dl,30
mov dh,4
call gotoxy
lea edx,str13
call writestring
call crlf

mov dl,30
mov dh,5
call gotoxy
lea edx,str14
call writestring
call crlf


mov dl,30
mov dh,6
call gotoxy
lea edx,str15
call writestring
call crlf

mov dl,30
mov dh,7
call gotoxy
lea edx,str16
call writestring
call crlf

mov dl,30
mov dh,8
call gotoxy
lea edx,str17
call writestring
call crlf

mov dl,30
mov dh,9
call gotoxy
lea edx,str18
call writestring
call crlf

mov dl,30
mov dh,10
call gotoxy
lea edx,str19
call writestring
call crlf

mov dl,30
mov dh,11
call gotoxy
lea edx,str21
call writestring
call crlf

mov dl,30
mov dh,12
call gotoxy
lea edx,str22
call writestring
call crlf

mov dl,30
mov dh,13
call gotoxy
lea edx,str23
call writestring
call crlf

mov eax,white
call SetTextColor
mov dl,90
mov dh,13
call gotoxy
lea edx,nam
call writestring
call crlf


 

    mov eax,magenta (magenta*16)
    call SetTextColor

    mov dl,0
    mov dh,29
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,15
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString


    mov ecx,13
    mov dl,0
    mov dh,16
        call Gotoxy
    l1:
    mov edx,OFFSET ground1
    call WriteString
  
    loop l1


    mov ecx,14
    mov dh,16
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2

    mov eax,white (black*16)
    call SetTextColor

    call DrawPlayer


    call Randomize

     call lv1

     gameLoop:
     


     cmp lives,0
     je killed
        call livecheck
        call livesdisplay

        call scorecheck
        call DrawCoinLv1

        call UpdateNPC
        call DrawNPC
       call NpcRandomMov

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,4
        mov dh,13
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt

       
    
             INVOKE PlaySound, OFFSET sound2, NULL, 11h
        mov eax,300
        call delay
        ; get user key input:
        call Readkey
        jz continu
        mov inputChar,al

        continu:

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame3

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je movenextlevel

        cmp inputChar,"z"
        je pause1

     


        moveUp:

      


       cmp yPos,16
        je ll4

        ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bh
          call lv1Collide
          pop ebx
          cmp temp,1
          je ll4
           
        ;;;;

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        ll4:


       
        jmp gameLoop

        moveDown:
        cmp yPos,28
        je ll1

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bh
          call lv1Collide
          pop ebx
          cmp temp,1
          je ll4
           
        ;;;;

        call UpdatePlayer
        inc yPos
        call DrawPlayer
        ll1:

        jmp gameLoop

        moveLeft:
          cmp xPos,1
          je ll2

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bl
          call lv1Collide
          pop ebx
          cmp temp,1
          je ll4
           
        ;;;;

        call UpdatePlayer
        dec xPos
        call DrawPlayer
        ll2:
        jmp gameLoop

        moveRight:
        cmp xPos,118
        je ll3

          ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bl
          call lv1Collide
          pop ebx
          cmp temp,1
          je ll4
           
        ;;;;
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        ll3:
      
    jmp gameLoop

    pause1:
    call readchar
    jmp gameLoop
   
       movenextlevel:
        jmp LEVEL2

    LEVEL2:



    mov score,0
    call  CoinArrayMakerLv2
    call clrscr
            mov eax,lightgreen
    call SetTextColor
      call clrscr

mov dl,30
mov dh,2
call gotoxy
lea edx,str11
call writestring
call crlf

mov dl,30
mov dh,3
call gotoxy
lea edx,str12
call writestring
call crlf

mov dl,30
mov dh,4
call gotoxy
lea edx,str13
call writestring
call crlf

mov dl,30
mov dh,5
call gotoxy
lea edx,str14
call writestring
call crlf


mov dl,30
mov dh,6
call gotoxy
lea edx,str15
call writestring
call crlf

mov dl,30
mov dh,7
call gotoxy
lea edx,str16
call writestring
call crlf

mov dl,30
mov dh,8
call gotoxy
lea edx,str17
call writestring
call crlf

mov dl,30
mov dh,9
call gotoxy
lea edx,str18
call writestring
call crlf

mov dl,30
mov dh,10
call gotoxy
lea edx,str19
call writestring
call crlf

mov dl,30
mov dh,11
call gotoxy
lea edx,str21
call writestring
call crlf

mov dl,30
mov dh,12
call gotoxy
lea edx,str22
call writestring
call crlf

mov dl,30
mov dh,13
call gotoxy
lea edx,str23
call writestring
call crlf

mov eax,white
call SetTextColor
mov dl,90
mov dh,13
call gotoxy
lea edx,nam
call writestring
call crlf

    mov eax,magenta (magenta*16)
    call SetTextColor
                         ; Clears Screen

    mov dl,0
    mov dh,29                        ;Horizontal Boundary
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,15             
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString


    mov ecx,13
    mov dl,0
    mov dh,16
        call Gotoxy
    Fl1:
    mov edx,OFFSET ground1           ;vertical Boundary
    call WriteString
  
    loop Fl1


    mov ecx,14
    mov dh,16
    mov temp,dh
    Fl2:
    mov dh,temp                       ;vertical Boundary
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop Fl2

    mov eax,white (black*16)
    call SetTextColor

    mov xPos,1                              ; Reset Player and bots
    mov yPos,26
    mov xPosNPC,65                             
    mov yPosNPC,19

    call DrawPlayer                         ;Draw Player
    call Randomize

     call LV2

    gameLoop2:

    cmp lives,0
     je killed

         call livecheck
        call livesdisplay

        call scorechecklv2
        call DrawCoinLv2

        call fruitcheck
     call Drawfruit

        call UpdateNPC
        call DrawNPC
      call NpcRandomMov2

        mov eax,white (black * 16)
        call SetTextColor

         ;draw score:

        mov dl,4
        mov dh,13
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov ax,score
        call WriteInt

    
       
             INVOKE PlaySound, OFFSET sound2, NULL, 11h
        mov eax,250
        call delay
        ; get user key input:
        call Readkey
        jz continu2
        mov inputChar,al

        continu2:

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame3

        cmp inputChar,"w"
        je moveUp2

        cmp inputChar,"s"
        je moveDown2

        cmp inputChar,"a"
        je moveLeft2

        cmp inputChar,"d"
        je moveRight2
        
        cmp inputChar,"l"
        je movenextlevel1

        cmp inputChar,"o"
        je moveprevlevel1

        cmp inputChar,"z"
        je pause2


        

        moveUp2:

      


       cmp yPos,16
        je Fll4

        ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bh
          call lv2Collide
          pop ebx
          cmp temp,1
          je Fll4
           
        ;;;;

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        Fll4:


       
        jmp gameLoop2

        moveDown2:
        cmp yPos,28
        je Fll1

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bh
          call lv2Collide
          pop ebx
          cmp temp,1
          je Fll4
           
        ;;;;

        call UpdatePlayer
        inc yPos
        call DrawPlayer
        Fll1:

        jmp gameLoop2

        moveLeft2:
          cmp xPos,1
          je Fll2

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bl
          call lv2Collide
          pop ebx
          cmp temp,1
          je Fll4
           
        ;;;;

        call UpdatePlayer
        dec xPos
        call DrawPlayer
        Fll2:
        jmp gameLoop2

        moveRight2:
        cmp xPos,118
        je Fll3

          ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bl
          call lv2Collide
          pop ebx
          cmp temp,1
          je Fll4
           
        ;;;;
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        Fll3: 

 
    jmp gameLoop2

    pause2:
    call readchar
    jmp gameLoop2

     movenextlevel1:
        jmp LEVEL3

     moveprevlevel1:
        jmp LEVEL1

   

    LEVEL3:

    
    mov score,0
    call  CoinArrayMakerLv3
    call clrscr 

            mov eax,lightgreen
    call SetTextColor
      call clrscr

mov dl,30
mov dh,2
call gotoxy
lea edx,str11
call writestring
call crlf

mov dl,30
mov dh,3
call gotoxy
lea edx,str12
call writestring
call crlf

mov dl,30
mov dh,4
call gotoxy
lea edx,str13
call writestring
call crlf

mov dl,30
mov dh,5
call gotoxy
lea edx,str14
call writestring
call crlf


mov dl,30
mov dh,6
call gotoxy
lea edx,str15
call writestring
call crlf

mov dl,30
mov dh,7
call gotoxy
lea edx,str16
call writestring
call crlf

mov dl,30
mov dh,8
call gotoxy
lea edx,str17
call writestring
call crlf

mov dl,30
mov dh,9
call gotoxy
lea edx,str18
call writestring
call crlf

mov dl,30
mov dh,10
call gotoxy
lea edx,str19
call writestring
call crlf

mov dl,30
mov dh,11
call gotoxy
lea edx,str21
call writestring
call crlf

mov dl,30
mov dh,12
call gotoxy
lea edx,str22
call writestring
call crlf

mov dl,30
mov dh,13
call gotoxy
lea edx,str23
call writestring
call crlf

mov eax,white
call SetTextColor
mov dl,90
mov dh,13
call gotoxy
lea edx,nam
call writestring
call crlf
    mov eax,magenta (magenta*16)
    call SetTextColor
                         ; Clears Screen

    mov dl,0
    mov dh,29                        ;Horizontal Boundary
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,15             
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString


    mov ecx,13
    mov dl,0
    mov dh,16
        call Gotoxy
    vFl1:
    mov edx,OFFSET ground1           ;vertical Boundary
    call WriteString
  
    loop vFl1


    mov ecx,13
    mov dh,16
    mov temp,dh
    vFl2:
    mov dh,temp                       ;vertical Boundary
    mov dl,119
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop vFl2

    mov eax,white (black*16)
    call SetTextColor

    mov xPos,1                              ; Reset Player and bots
    mov yPos,26
    mov xPosNPC,65                             
    mov yPosNPC,19

    call DrawPlayer                         ;Draw Player
    call Randomize

     call LV3

    gameLoop3:

    cmp lives,0
     je killed

         call livecheck2
        call livesdisplay

        call scorechecklv3
        call DrawCoinLv3

       call UpdateNPC
       call DrawNPC
       call NpcRandomMov3

       call UpdateNPC2
        call DrawNPC2
       call NpcRandomMov3b

       call UpdateNPC3
        call DrawNPC3
       call NpcRandomMov3c

        mov eax,white (black * 16)
        call SetTextColor

      ; draw score:
      mov dl,4
      mov dh,13
      call Gotoxy
      mov edx,OFFSET strScore
      call WriteString
      mov ax,score
      call WriteInt

 
       
                      INVOKE PlaySound, OFFSET sound2, NULL, 11h
        mov eax,20
        call delay
        ; get user key input:
        call Readkey
        jz continu3
        mov inputChar,al

        continu3:

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame3

        cmp inputChar,"w"
        je moveUp3

        cmp inputChar,"s"
        je moveDown3

        cmp inputChar,"a"
        je moveLeft3

        cmp inputChar,"d"
        je moveRight3


        cmp inputChar,"k"
        je moveprevlevel

        cmp inputChar,"z"
        je pause3

        

        moveUp3:

      


       cmp yPos,16
        je cll4

        ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bh
          call lv3Collide
          pop ebx
          cmp temp,1
          je cll4
           
        ;;;;

        call UpdatePlayer
        dec yPos
        call DrawPlayer
        cll4:


       
        jmp gameLoop3

        moveDown3:
        cmp yPos,28
        je cll1

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bh
          call lv3Collide
          pop ebx
          cmp temp,1
          je cll4
           
        ;;;;

        call UpdatePlayer
        inc yPos
        call DrawPlayer
        cll1:

        jmp gameLoop3

        moveLeft3:
          cmp xPos,1
          je cll2

         ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          dec bl
          call lv3Collide
          pop ebx
          cmp temp,1
          je cll4
           
        ;;;;

        call UpdatePlayer
        dec xPos
        call DrawPlayer
        cll2:
        jmp gameLoop3

        moveRight3:
        cmp xPos,118
        je cll3

          ;;;;
          push ebx
          mov bl,xPos
          mov bh,yPos
          inc bl
          call lv3Collide
          pop ebx
          cmp temp,1
          je cll4
           
        ;;;;
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        cll3: 

 
    jmp gameLoop3

    pause3:
    call readchar
    jmp gameLoop3

    moveprevlevel:
        jmp LEVEL2

   
    exitGame3:


    killed:

   

    mov eax,magenta (white * 16)
    call settextcolor
    call clrscr

    mov dl,50
    mov dh,18
    call gotoxy
    lea edx,endlife
    call writestring

    mov lives,3

    mov dl,3
    mov dh,20
    call gotoxy
    lea edx,rules7
    call writestring
    call crlf
    
        INVOKE PlaySound, OFFSET sound4, NULL, 11h
        mov eax,2000
        call delay

    call readchar
     jmp HOME


    exit
main ENDP

DrawPlayer PROC
    ; draw player at (xPos,yPos):
    mov eax,yellow ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

DrawCoin PROC
    mov eax,yellow ;(red * 16)
    call SetTextColor
    mov dl,xCoinPos
    mov dh,yCoinPos
    call Gotoxy
    mov al,"."
    call WriteChar
    ret
DrawCoin ENDP






    lv1 PROC
    mov eax,red+(red*16)
    call settextcolor

    mov dl,20
    mov dh,18
    call wallx

    mov dl,20
    mov dh,26
     call wallx

    mov dl,40
    mov dh,23
    call wallx
    

      mov dl,75
    mov dh,20
    call wallx

    mov dl,90
    mov dh,27
    call wallx
    ;;;;;;;
    mov dl,5
    mov dh,20
    call wally

    mov dl,37
    mov dh,17
    call wally

    mov dl,70
    mov dh,21
    call wally

    mov dl,100
    mov dh,16
    call wally

     mov eax,white (black*16)
      call settextcolor
        ret
    lv1 ENDP

    


   


    wallx PROC uses edx

    call gotoxy
    mov edx,OFFSET wall
    call WriteString

    ret
    wallx Endp

    wally PROC uses eax 

    mov ecx,7
    mov al,dl
    mov ah,dh
   
    l2:
    mov dh,ah
    mov dl,al
    call Gotoxy
    mov edx,OFFSET wallyy
    call WriteString
    inc ah
    loop l2

    ret
    wally Endp

    lv1Collide PROC uses eax

 mov temp,0          
 mov ecx,0;
 lea esi,xy1

 q1:

 cmp ecx,5                  ;  5 wals check
 je qycheck
 cmp [esi+ecx],bh           ; matching y component of wal with y of player
 je q2    
 
 inc ecx
 jmp q1                      ; looping

 q2:
 lea esi,xx1                ; offseting to x component
 mov al,[esi+ecx]            ; x starting component relative to y component selected above

 cmp bl,al                  ; is x greater than wall start
 jge q3  
 inc ecx
 lea esi,xy1
 jmp q1

 q3:
 add al,15
 cmp bl,al          ; is x smaller than wall end
 jl q4
  inc ecx
  lea esi,xy1
 jmp q1

 q4:
 mov temp,1
 jmp qlast


 qycheck:
 lea esi,yx1
 mov ecx,0

 qq1:

 cmp ecx,4                  ;  5 wals check
 je qlast 
 cmp [esi+ecx],bl           ; matching x component of wal with x of player
 je qq2    
 
 inc ecx
 jmp qq1                      ; looping

  qq2:
 lea esi,yy1                ; offseting to y component
 mov ah,[esi+ecx]            ; y starting component relative to x component selected above

 cmp bh,ah                  ; is y greater than wall start
 jge qq3  
 inc ecx
 lea esi,yx1                 ; reoffsetting to x array

 jmp qq1

 qq3:
 add ah,7
 cmp bh,ah          ; is y smaller than wall end
 jl q4
  inc ecx
  lea esi,yx1       ; reoffsetting to x array
 jmp qq1


 qlast:
    ret
   lv1Collide ENDP

 

   DrawCoinLv1 PROC uses esi ecx edi edx
   mov ecx,0
   lea esi,lv1coinx
   lea edi,lv1coiny

   DrawCoinLv1l:
   cmp ecx,10
   je  DrawCoinLv1l2

   mov dl,[esi+ecx]
   mov dh,[edi+ecx]

   cmp dl,0
   je DrawCoinLv1l2

   call gotoxy
   mov al,"."
   call writechar
   inc ecx

   jmp DrawCoinLv1l

    DrawCoinLv1l2:
   ret
   DrawCoinLv1 ENDP

 Drawfruit PROC uses esi ecx edi edx

    mov ecx,0
   lea esi,fruitx
   lea edi,fruity

   fruitlv2:
   cmp ecx,2
   je  fruite

   mov dl,[esi+ecx]
   mov dh,[edi+ecx]

   cmp dl,0
   je fruite

   call gotoxy
   mov al,"0"
   call writechar
   inc ecx

   jmp fruitlv2

    fruite:
   ret

Drawfruit ENDP

fruitcheck PROC uses eax ecx esi edi
   mov al,xPos
   mov ah,yPos
   lea esi,fruitx
   lea edi,fruity
   mov ecx,0

   w1:
   cmp ecx,2           ;counter condition
   je wfinal
   cmp [esi+ecx],al
   je w2                     ; x-coordinate check
   inc ecx

   jmp w1             ;loop

    w2:
    cmp [edi+ecx],ah
    je w3                   ; y-coordinate check
    inc ecx
    jmp w1
    
    w3:
    call UpdatePlayer
    mov xPos,1
    mov yPos,28
    
    call DrawPlayer
    add score,10
    mov ah,0
    w4:
        cmp [esi+ecx],ah              ;comparing with zero
        je wfinal
        mov al,[esi+ecx+1]           ;xpoints shift left
        mov [esi+ecx],al
        mov al,[edi+ecx+1]            ;ypoints shift left
        mov [edi+ecx],al
        inc ecx
      jmp w4
      
    wfinal:

   ret
   fruitcheck ENDP


   scorecheck PROC uses eax ecx esi edi
   mov al,xPos
   mov ah,yPos
   lea esi,lv1coinx
   lea edi,lv1coiny
   mov ecx,0

   w1:
   cmp ecx,10           ;counter condition
   je wfinal
   cmp [esi+ecx],al
   je w2                     ; x-coordinate check
   inc ecx

   jmp w1             ;loop

    w2:
    cmp [edi+ecx],ah
    je w3                   ; y-coordinate check
    inc ecx
    jmp w1
    
    w3:


    inc score
    mov ah,0
    w4:
        cmp [esi+ecx],ah              ;comparing with zero
        je wfinal
        mov al,[esi+ecx+1]           ;xpoints shift left
        mov [esi+ecx],al
        mov al,[edi+ecx+1]            ;ypoints shift left
        mov [edi+ecx],al
        inc ecx
      jmp w4
      
    wfinal:

   ret
   scorecheck ENDP


UpdateNPC PROC

    mov dl,xPosNPC
    mov dh,yPosNPC
    call Gotoxy
    mov al," "
    call WriteChar
    ret

UpdateNPC ENDP

DrawNPC PROC uses edx
   
    mov eax,cyan 
    call SetTextColor
    mov dl,xPosNPC
    mov dh,yPosNPC
    call Gotoxy
    mov al,"A"
    call WriteChar
    ret

DrawNPC ENDP

NpcRandomMov PROC uses eax ebx
mov eax,4
call randomrange
inc eax
mov bl,xPosNPC
mov bh,yPosNPC
       

           cmp eax,1
           je mup
           cmp eax,2
           je mdown
           cmp eax,3
           je mright
            cmp eax,4
           je mleft

           mup:
          dec bh
          cmp bh,15
          je mLast

          call lv1Collide
          cmp temp,0
          je mup2
          jmp mLast


          mup2:
            call UpdateNPC
            dec yPosNPC
            call DrawNPC
            jmp mLast

          mdown:
          inc bh
          cmp bh,26        ;outer boundary check
          je mLast 
          call lv1Collide
          cmp temp,0
          je mdown2
          jmp mLast


          mdown2:
            call UpdateNPC
            inc yPosNPC
            call DrawNPC
            jmp mLast

         mright:
          inc bl
           cmp bl,119        ;outer boundary check
          je mLast 
          call lv1Collide
          cmp temp,0
          je mright2
          jmp mLast


          mright2:
            call UpdateNPC
            inc xPosNPC
            call DrawNPC
            jmp mLast

            mleft:
          dec bl
           cmp bl,0        ;outer boundary check
           je mLast
          call lv1Collide
          cmp temp,0
          je mleft2
          jmp mLast


          mleft2:
            call UpdateNPC
            dec xPosNPC
            call DrawNPC
            jmp mLast




  mLast:

ret
NpcRandomMov ENDP

livecheck PROC uses eax
mov temp,0

mov al,xPos
mov ah,xPosNpc

cmp al,ah
jne ylast

mov al,yPos
mov ah,yPosNpc

cmp al,ah
jne ylast

y1:
    mov temp,1
    dec lives
    jmp ylast

ylast:


ret
livecheck ENDP


livesdisplay proc uses edx eax

mov dl,52
mov dh,14
call gotoxy

lea edx,livesprompt
call writestring

mov eax,0
mov al,lives
call writeint

ret
livesdisplay ENDP

;;;;;;;;;;;;;  LEVEL 2 ;;;;;;;;;;;;;;

NpcRandomMov2 PROC uses eax ebx
mov eax,4
call randomrange
inc eax
mov bl,xPosNPC
mov bh,yPosNPC
       

           cmp eax,1
           je fmup
           cmp eax,2
           je fmdown
           cmp eax,3
           je fmright
            cmp eax,4
           je fmleft

           fmup:
          dec bh
          cmp bh,15
          je fmLast

          call lv2Collide
          cmp temp,0
          je fmup2
          jmp fmLast


          fmup2:
            call UpdateNPC
            dec yPosNPC
            call DrawNPC
            jmp fmLast

          fmdown:
          inc bh
          cmp bh,26        ;outer boundary check
          je fmLast 
          call lv2Collide
          cmp temp,0
          je fmdown2
          jmp fmLast


          fmdown2:
            call UpdateNPC
            inc yPosNPC
            call DrawNPC
            jmp fmLast

         fmright:
          inc bl
           cmp bl,119        ;outer boundary check
          je fmLast 
          call lv2Collide
          cmp temp,0
          je fmright2
          jmp fmLast


          fmright2:
            call UpdateNPC
            inc xPosNPC
            call DrawNPC
            jmp fmLast

            fmleft:
          dec bl
           cmp bl,0        ;outer boundary check
           je fmLast
          call lv2Collide
          cmp temp,0
          je fmleft2
          jmp fmLast


          fmleft2:
            call UpdateNPC
            dec xPosNPC
            call DrawNPC
            jmp fmLast




  fmLast:

ret
NpcRandomMov2 ENDP

 lv2 PROC
    mov eax,red+(red*16)
    call settextcolor

      mov dl,20
    mov dh,17
    call wally

        mov dl,40
    mov dh,17
    call wally

        mov dl,60
    mov dh,17
    call wally

        mov dl,80
    mov dh,17
    call wally

        mov dl,100
    mov dh,17
    call wally

    mov dl,2
    mov dh,27
    call wallx

    mov dl,25
    mov dh,25
    call wallx

    mov dl,50
    mov dh,27
    call wallx

    mov dl,75
    mov dh,25
    call wallx

    mov dl,100
    mov dh,27
    call wallx
    

     mov eax,white (black*16)
      call settextcolor
        ret
    lv2 ENDP

lv2Collide PROC uses eax esi ecx

 mov temp,0          
 mov ecx,0;
 lea esi,xy2

 aq1:

 cmp ecx,5                  ;  5 wals check
 je aqycheck
 cmp [esi+ecx],bh           ; matching y component of wal with y of player
 je aq2    
 
 inc ecx
 jmp aq1                      ; looping

 aq2:
 lea esi,xx2                ; offseting to x component
 mov al,[esi+ecx]            ; x starting component relative to y component selected above

 cmp bl,al                  ; is x greater than wall start
 jge aq3  
 inc ecx
 lea esi,xy2
 jmp aq1

 aq3:
 add al,15
 cmp bl,al          ; is x smaller than wall end
 jl aq4
  inc ecx
  lea esi,xy2
 jmp aq1

 aq4:
 mov temp,1
 jmp aqlast


 aqycheck:
 lea esi,yx2
 mov ecx,0

 aqq1:

 cmp ecx,5                  ;  5 wals check
 je aqlast 
 cmp [esi+ecx],bl           ; matching x component of wal with x of player
 je aqq2    
 
 inc ecx
 jmp aqq1                      ; looping

  aqq2:
 lea esi,yy2                ; offseting to y component
 mov ah,[esi+ecx]            ; y starting component relative to x component selected above

 cmp bh,ah                  ; is y greater than wall start
 jge aqq3  
 inc ecx
 lea esi,yx2                 ; reoffsetting to x array

 jmp aqq1

 aqq3:
 add ah,7
 cmp bh,ah          ; is y smaller than wall end
 jl aq4
  inc ecx
  lea esi,yx2       ; reoffsetting to x array
 jmp aqq1


 aqlast:
    ret

lv2Collide ENDP


 CoinArrayMakerLv2 PROC uses edi esi eax ecx ebx edx
      lea esi,lv2coinx               ;offsetting lv 2 array
      lea edi,lv2coiny
     mov eax,0
     mov ecx,0
	ap1:                                ; outer loop 16-28
	mov cl,ival2
	cmp cl,iValLimit2
	je aplast

	mov cl,118
		ap2:                             ;inner loop 118 times

		 push ebx
          mov bl,cl
          mov bh,ival2
          call lv2Collide
          pop ebx
          cmp temp,1
          je collionskip                     ;collion check 
	        mov [esi+eax],cl
            mov dl,ival2
            mov [edi+eax],dl
            inc eax
          collionskip:

		loop ap2


		

	inc iVal2
	jmp ap1

	aplast:

    mov ival2,16
    mov iValLimit2,29

    ret
    CoinArrayMakerLv2 ENDP

 DrawCoinLv2 PROC uses esi ecx edi edx
   mov ecx,0
   lea esi,lv2coinx
   lea edi,lv2coiny

   DrawCoinLv2l:
   cmp ecx,3000
   je  DrawCoinLv2l2

   mov dl,[esi+ecx]
   mov dh,[edi+ecx]

   cmp dl,0
   je DrawCoinLv2l2

   call gotoxy
   mov al,"."
   call writechar
   inc ecx

   jmp DrawCoinLv2l

    DrawCoinLv2l2:
   ret
   DrawCoinLv2 ENDP

   scorechecklv2 PROC uses eax ecx esi edi
   mov al,xPos
   mov ah,yPos
   lea esi,lv2coinx
   lea edi,lv2coiny
   mov ecx,0

   vw1:
   cmp ecx,3000           ;counter condition
   je vwfinal
   cmp [esi+ecx],al
   je vw2                     ; x-coordinate check
   inc ecx

   jmp vw1             ;loop

    vw2:
    cmp [edi+ecx],ah
    je vw3                   ; y-coordinate check
    inc ecx
    jmp vw1
    
    vw3:
    inc score
    mov ah,0
   vw4:
        cmp [esi+ecx],ah              ;comparing with zero
        je vwfinal
        mov al,[esi+ecx+1]           ;xpoints shift left
        mov [esi+ecx],al
        mov al,[edi+ecx+1]            ;ypoints shift left
        mov [edi+ecx],al
        inc ecx
      jmp vw4
      
    vwfinal:

   ret
   scorechecklv2 ENDP

   ;;;;;;;;;;;;;;;;   LV-3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   

    lv3 PROC
    mov eax,red+(red*16)
    call settextcolor

      mov dl,20
    mov dh,17
    call wally

        mov dl,40
    mov dh,17
    call wally

        mov dl,60
    mov dh,17
    call wally

        mov dl,80
    mov dh,17
    call wally

        mov dl,100
    mov dh,17
    call wally

    mov dl,2
    mov dh,27
    call wallx

    mov dl,25
    mov dh,25
    call wallx

    mov dl,50
    mov dh,27
    call wallx

    mov dl,75
    mov dh,25
    call wallx

    mov dl,100
    mov dh,27
    call wallx
    ;;;;;;;;;;;;
    mov dl,2
    mov dh,22
    call wallx

    mov dl,22
    mov dh,20
    call wallx

    mov dl,42
    mov dh,22
    call wallx

    mov dl,62
    mov dh,20
    call wallx

    mov dl,82
    mov dh,22
    call wallx

    mov dl,102
    mov dh,20
    call wallx
    

     mov eax,white (black*16)
      call settextcolor
        ret
    lv3 ENDP

 lv3Collide PROC uses eax esi ecx

 mov temp,0          
 mov ecx,0;
 lea esi,xy3

 qaq1:

 cmp ecx,11                  ;  5 wals check
 je qaqycheck
 mov dh,[esi+ecx]
 cmp [esi+ecx],bh           ; matching x component of wal with x of player
 je qaq2    
 
 inc ecx
 jmp qaq1                      ; looping

qaq2:
 lea esi,xx3                ; offseting to x component
 mov al,[esi+ecx]            ; x starting component relative to y component selected above

 cmp bl,al                  ; is x greater than wall start
 jge qaq3  
 inc ecx
 lea esi,xy3
 jmp qaq1

qaq3:
 add al,15
 cmp bl,al          ; is x smaller than wall end
 jl qaq4
  inc ecx
  lea esi,xy3
 jmp qaq1

qaq4:
 mov temp,1
 jmp qaqlast


 qaqycheck:
 lea esi,yx3
 mov ecx,0

 qaqq1:

 cmp ecx,5                  ;  5 wals check
 je qaqlast 
 cmp [esi+ecx],bl           ; matching x component of wal with x of player
 je qaqq2    
 
 inc ecx
 jmp qaqq1                      ; looping

  qaqq2:
 lea esi,yy3                ; offseting to y component
 mov ah,[esi+ecx]            ; y starting component relative to x component selected above

 cmp bh,ah                  ; is y greater than wall start
 jge qaqq3  
 inc ecx
 lea esi,yx3                 ; reoffsetting to x array

 jmp qaqq1

 qaqq3:
 add ah,7
 cmp bh,ah          ; is y smaller than wall end
 jl qaq4
  inc ecx
  lea esi,yx3       ; reoffsetting to x array
 jmp qaqq1


 qaqlast:
    ret

lv3Collide ENDP


CoinArrayMakerLv3 PROC uses edi esi eax ecx ebx edx
      lea esi,lv3coinx               ;offsetting lv 2 array
      lea edi,lv3coiny
     mov eax,0
     mov ecx,0
	cap1:                                ; outer loop 16-28
	mov cl,ival2
	cmp cl,iValLimit2
	je caplast

	mov cl,118
		cap2:                             ;inner loop 118 times

		 push ebx
          mov bl,cl
          mov bh,ival2
          call lv3Collide
          pop ebx
          cmp temp,1
          je ccollionskip                     ;collion check 
	        mov [esi+eax],cl
            mov dl,ival2
            mov [edi+eax],dl
            inc eax
          ccollionskip:

		loop cap2


		

	inc iVal2
	jmp cap1

	caplast:

    mov ival2,16
    mov iValLimit2,29

    ret
    CoinArrayMakerLv3 ENDP


    DrawCoinLv3 PROC uses esi ecx edi edx
   mov ecx,0
   lea esi,lv3coinx
   lea edi,lv3coiny

   DrawCoinLv3l:
   cmp ecx,3000
   je  DrawCoinLv3l2

   mov dl,[esi+ecx]
   mov dh,[edi+ecx]

   cmp dl,0
   je DrawCoinLv3l2

   call gotoxy
   mov al,"."
   call writechar
   inc ecx

   jmp DrawCoinLv3l

    DrawCoinLv3l2:
   ret
   DrawCoinLv3 ENDP

   scorechecklv3 PROC uses eax ecx esi edi
   mov al,xPos
   mov ah,yPos
   lea esi,lv3coinx
   lea edi,lv3coiny
   mov ecx,0

   kvw1:
   cmp ecx,3000           ;counter condition
   je kvwfinal
   cmp [esi+ecx],al
   je kvw2                     ; x-coordinate check
   inc ecx

   jmp kvw1             ;loop

    kvw2:
    cmp [edi+ecx],ah
    je kvw3                   ; y-coordinate check
    inc ecx
    jmp kvw1
    
    kvw3:
    inc score
    mov ah,0
   kvw4:
        cmp [esi+ecx],ah              ;comparing with zero
        je kvwfinal
        mov al,[esi+ecx+1]           ;xpoints shift left
        mov [esi+ecx],al
        mov al,[edi+ecx+1]            ;ypoints shift left
        mov [edi+ecx],al
        inc ecx
      jmp kvw4
      
    kvwfinal:

   ret
   scorechecklv3 ENDP

   NpcRandomMov3 PROC uses eax ebx

   mov eax,100
   call delay
mov eax,4
call randomrange
inc eax
mov bl,xPosNPC
mov bh,yPosNPC
      

           cmp eax,1
           je wfmup
           cmp eax,2
           je wfmdown
           cmp eax,3
           je wfmright
            cmp eax,4
           je wfmleft

           wfmup:
          dec bh
          cmp bh,15
          je wfmLast

          call lv3Collide
          cmp temp,0
          je wfmup2
          jmp wfmLast


          wfmup2:
            call UpdateNPC
            dec yPosNPC
            call DrawNPC
            jmp wfmLast

          wfmdown:
          inc bh
          cmp bh,26        ;outer boundary check
          je wfmLast 
          call lv3Collide
          cmp temp,0
          je wfmdown2
          jmp wfmLast


          wfmdown2:
            call UpdateNPC
            inc yPosNPC
            call DrawNPC
            jmp wfmLast

         wfmright:
          inc bl
           cmp bl,119        ;outer boundary check
          je wfmLast 
          call lv3Collide
          cmp temp,0
          je wfmright2
          jmp wfmLast


          wfmright2:
            call UpdateNPC
            inc xPosNPC
            call DrawNPC
            jmp wfmLast

            wfmleft:
          dec bl
           cmp bl,0        ;outer boundary check
           je wfmLast
          call lv3Collide
          cmp temp,0
          je wfmleft2
          jmp wfmLast


          wfmleft2:
            call UpdateNPC
            dec xPosNPC
            call DrawNPC
            jmp wfmLast

  wfmLast:
ret
NpcRandomMov3 ENDP

UpdateNPC2 PROC

    mov dl,xPosNPC2
    mov dh,yPosNPC2
    call Gotoxy
    mov al," "
    call WriteChar
    ret

UpdateNPC2 ENDP

DrawNPC2 PROC uses edx
   
    mov eax,cyan 
    call SetTextColor
    mov dl,xPosNPC2
    mov dh,yPosNPC2
    call Gotoxy
    mov al,"A"
    call WriteChar
    ret

DrawNPC2 ENDP

 NpcRandomMov3b PROC uses eax ebx

 mov eax,100
   call delay
mov eax,4
call randomrange
inc eax
mov bl,xPosNPC2
mov bh,yPosNPC2
      

           cmp eax,1
           je NewLabel_wfmup
           cmp eax,2
           je NewLabel_wfmdown
           cmp eax,3
           je NewLabel_wfmright
            cmp eax,4
           je NewLabel_wfmleft

           NewLabel_wfmup:
          dec bh
          cmp bh,15
          je NewLabel_wfmLast

          call lv3Collide
          cmp temp,0
          je NewLabel_wfmup2
          jmp NewLabel_wfmLast


          NewLabel_wfmup2:
            call UpdateNPC2
            dec yPosNPC2
            call DrawNPC2
            jmp NewLabel_wfmLast

          NewLabel_wfmdown:
          inc bh
          cmp bh,26        ;outer boundary check
          je NewLabel_wfmLast 
          call lv3Collide
          cmp temp,0
          je NewLabel_wfmdown2
          jmp NewLabel_wfmLast


          NewLabel_wfmdown2:
            call UpdateNPC2
            inc yPosNPC2
            call DrawNPC2
            jmp NewLabel_wfmLast

         NewLabel_wfmright:
          inc bl
           cmp bl,119        ;outer boundary check
          je NewLabel_wfmLast 
          call lv3Collide
          cmp temp,0
          je NewLabel_wfmright2
          jmp NewLabel_wfmLast


          NewLabel_wfmright2:
            call UpdateNPC2
            inc xPosNPC2
            call DrawNPC2
            jmp NewLabel_wfmLast

            NewLabel_wfmleft:
          dec bl
           cmp bl,0        ;outer boundary check
           je NewLabel_wfmLast
          call lv3Collide
          cmp temp,0
          je NewLabel_wfmleft2
          jmp NewLabel_wfmLast


          NewLabel_wfmleft2:
            call UpdateNPC2
            dec xPosNPC2
            call DrawNPC2
            jmp NewLabel_wfmLast

  NewLabel_wfmLast:
ret
NpcRandomMov3b ENDP

livecheck2 PROC uses eax
mov temp,0

mov al,xPos
mov ah,xPosNpc

cmp al,ah
jne ylast

mov al,yPos
mov ah,yPosNpc

cmp al,ah
jne ylast

y1:
    mov temp,1
    dec lives
    jmp ylast

ylast:

mov al,xPos
mov ah,xPosNpc2

cmp al,ah
jne ylast2

mov al,yPos
mov ah,yPosNpc2

cmp al,ah
jne ylast2

y12:
    mov temp,1
    dec lives
    jmp ylast2

ylast2:

mov al,xPos
mov ah,xPosNpc3

cmp al,ah
jne ylast3

mov al,yPos
mov ah,yPosNpc3

cmp al,ah
jne ylast3

y13:
    mov temp,1
    dec lives
    jmp ylast3

ylast3:



ret
livecheck2 ENDP


UpdateNPC3 PROC

    mov dl,xPosNPC3
    mov dh,yPosNPC3
    call Gotoxy
    mov al," "
    call WriteChar
    ret

UpdateNPC3 ENDP

DrawNPC3 PROC uses edx
   
    mov eax,cyan 
    call SetTextColor
    mov dl,xPosNPC3
    mov dh,yPosNPC3
    call Gotoxy
    mov al,"A"
    call WriteChar
    ret

DrawNPC3 ENDP


NpcRandomMov3c PROC uses eax ebx

mov eax, 100
   call delay
   mov eax, 4
   call randomrange
   inc eax
   mov bl, xPosNPC3
   mov bh, yPosNPC3

   cmp eax, 1
   je Label_wfmup
   cmp eax, 2
   je Label_wfmdown
   cmp eax, 3
   je Label_wfmright
   cmp eax, 4
   je Label_wfmleft

Label_wfmup:
   dec bh
   cmp bh, 15
   je Label_wfmLast

   call lv3Collide
   cmp temp, 0
   je Label_wfmup2
   jmp Label_wfmLast

Label_wfmup2:
   call UpdateNPC3
   dec yPosNPC3
   call DrawNPC3
   jmp Label_wfmLast

Label_wfmdown:
   inc bh
   cmp bh, 26
   je Label_wfmLast
   call lv3Collide
   cmp temp, 0
   je Label_wfmdown2
   jmp Label_wfmLast

Label_wfmdown2:
   call UpdateNPC3
   inc yPosNPC3
   call DrawNPC3
   jmp Label_wfmLast

Label_wfmright:
   inc bl
   cmp bl, 119
   je Label_wfmLast
   call lv3Collide
   cmp temp, 0
   je Label_wfmright2
   jmp Label_wfmLast

Label_wfmright2:
   call UpdateNPC3
   inc xPosNPC3
   call DrawNPC3
   jmp Label_wfmLast

Label_wfmleft:
   dec bl
   cmp bl, 0
   je Label_wfmLast
   call lv3Collide
   cmp temp, 0
   je Label_wfmleft2
   jmp Label_wfmLast

Label_wfmleft2:
   call UpdateNPC3
   dec xPosNPC3
   call DrawNPC3
   jmp Label_wfmLast

Label_wfmLast:
   ret
NpcRandomMov3c ENDP


END main




