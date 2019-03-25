// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


//loop to check key
(KEYLOOP)
    //16384-24575
    @16383
    D=A //screen start
    @24575
    D=A-D //screen end
    @screencounter
    M=D
    (WHITELOOP)

        @16383
        D=A
        @pixels
        M=D
        @screencounter
        D=M
        M=M-1
        @pixels
        A=M+D
        M=0

        @24576
        D=M
        @SCREENLOOP
        D;JNE

        @screencounter
        D=M
        @KEYLOOP
        D;JEQ

        @WHITELOOP
        0;JMP
    (ENDWHITE)

    @24576
    D=M
    @SCREENLOOP
    D;JNE
    @KEYLOOP
    0;JMP
(KEYEND)

(SCREENLOOP)
//16384-24575
    @16383
    D=A //screen start
    @24575
    D=A-D //screen end
    @screencounter
    M=D
    (BLACKLOOP)

        @16383
        D=A
        @pixels
        M=D
        @screencounter
        D=M
        M=M-1
        @pixels
        A=M+D
        M=-1

        @24576
        D=M
        @KEYLOOP
        D;JLE

        @screencounter
        D=M
        @SCREENLOOP
        D;JEQ

        @BLACKLOOP
        0;JMP
    (ENDBLACK)





    @24576
    D=M
    @KEYLOOP
    D;JLE
    @SCREENLOOP
    D;JMP
(SCREENEND)