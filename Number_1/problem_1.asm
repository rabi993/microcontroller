
_digit_display:

;problem_1.c,4 :: 		void digit_display(int left, int right)
;problem_1.c,6 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;problem_1.c,7 :: 		portb=array[left];
	MOVF       FARG_digit_display_left+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;problem_1.c,8 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_digit_display0:
	DECFSZ     R13+0, 1
	GOTO       L_digit_display0
	DECFSZ     R12+0, 1
	GOTO       L_digit_display0
	NOP
;problem_1.c,9 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;problem_1.c,11 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;problem_1.c,12 :: 		portb=array[right];
	MOVF       FARG_digit_display_right+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;problem_1.c,13 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_digit_display1:
	DECFSZ     R13+0, 1
	GOTO       L_digit_display1
	DECFSZ     R12+0, 1
	GOTO       L_digit_display1
	NOP
;problem_1.c,14 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;problem_1.c,15 :: 		}
L_end_digit_display:
	RETURN
; end of _digit_display

_main:

;problem_1.c,16 :: 		void main()
;problem_1.c,18 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;problem_1.c,19 :: 		portb = 0x00;
	CLRF       PORTB+0
;problem_1.c,21 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;problem_1.c,22 :: 		portc = 0x00;
	CLRF       PORTC+0
;problem_1.c,24 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;problem_1.c,26 :: 		TRISE = 0x00;
	CLRF       TRISE+0
;problem_1.c,27 :: 		porte = 0x00;
	CLRF       PORTE+0
;problem_1.c,29 :: 		while(1)
L_main2:
;problem_1.c,31 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;problem_1.c,33 :: 		mode_bit = 0;
	CLRF       _mode_bit+0
	CLRF       _mode_bit+1
;problem_1.c,34 :: 		porte.f0 = 0;
	BCF        PORTE+0, 0
;problem_1.c,35 :: 		if(i<100 && i>=0)
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      100
	SUBWF      _i+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVLW      0
	SUBWF      _i+0, 0
L__main41:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
L__main37:
;problem_1.c,37 :: 		leftDigit = i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _leftDigit+0
	MOVF       R0+1, 0
	MOVWF      _leftDigit+1
;problem_1.c,38 :: 		rightDigit = i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _rightDigit+0
	MOVF       R0+1, 0
	MOVWF      _rightDigit+1
;problem_1.c,39 :: 		}
L_main7:
;problem_1.c,40 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,41 :: 		for(k=0; k<10; k++)
	CLRF       _k+0
	CLRF       _k+1
L_main8:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main42
	MOVLW      10
	SUBWF      _k+0, 0
L__main42:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;problem_1.c,43 :: 		if(portd.f6 == 1)
	BTFSS      PORTD+0, 6
	GOTO       L_main11
;problem_1.c,45 :: 		delay_ms(115);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      176
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;problem_1.c,46 :: 		if(portd.f6 == 1)
	BTFSS      PORTD+0, 6
	GOTO       L_main13
;problem_1.c,47 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
L_main13:
;problem_1.c,48 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,49 :: 		}
L_main11:
;problem_1.c,50 :: 		if(portd.f7 == 1)
	BTFSS      PORTD+0, 7
	GOTO       L_main14
;problem_1.c,52 :: 		delay_ms(115);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      176
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;problem_1.c,53 :: 		if(portd.f7 == 1)
	BTFSS      PORTD+0, 7
	GOTO       L_main16
;problem_1.c,54 :: 		i--;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
L_main16:
;problem_1.c,55 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,56 :: 		}
L_main14:
;problem_1.c,41 :: 		for(k=0; k<10; k++)
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;problem_1.c,57 :: 		}
	GOTO       L_main8
L_main9:
;problem_1.c,58 :: 		if(mode_bit == 0)
	MOVLW      0
	XORWF      _mode_bit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      0
	XORWF      _mode_bit+0, 0
L__main43:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;problem_1.c,59 :: 		x=i, m=i;
	MOVF       _i+0, 0
	MOVWF      _x+0
	MOVF       _i+1, 0
	MOVWF      _x+1
	MOVF       _i+0, 0
	MOVWF      _m+0
	MOVF       _i+1, 0
	MOVWF      _m+1
L_main17:
;problem_1.c,60 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
;problem_1.c,61 :: 		chk=x;
	MOVF       _x+0, 0
	MOVWF      _chk+0
	MOVF       _x+1, 0
	MOVWF      _chk+1
;problem_1.c,62 :: 		}
	GOTO       L_main19
L_main4:
;problem_1.c,67 :: 		mode_bit = 1;
	MOVLW      1
	MOVWF      _mode_bit+0
	MOVLW      0
	MOVWF      _mode_bit+1
;problem_1.c,69 :: 		if(y<100 && y>=0)
	MOVLW      128
	XORWF      _y+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVLW      100
	SUBWF      _y+0, 0
L__main44:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	MOVLW      128
	XORWF      _y+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      0
	SUBWF      _y+0, 0
L__main45:
	BTFSS      STATUS+0, 0
	GOTO       L_main22
L__main36:
;problem_1.c,71 :: 		leftDigit = y/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _y+0, 0
	MOVWF      R0+0
	MOVF       _y+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _leftDigit+0
	MOVF       R0+1, 0
	MOVWF      _leftDigit+1
;problem_1.c,72 :: 		rightDigit = y%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _y+0, 0
	MOVWF      R0+0
	MOVF       _y+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _rightDigit+0
	MOVF       R0+1, 0
	MOVWF      _rightDigit+1
;problem_1.c,73 :: 		}
L_main22:
;problem_1.c,74 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,75 :: 		for(k=0; k<10; k++)
	CLRF       _k+0
	CLRF       _k+1
L_main23:
	MOVLW      128
	XORWF      _k+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      10
	SUBWF      _k+0, 0
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;problem_1.c,78 :: 		if(portd.f6 == 1)
	BTFSS      PORTD+0, 6
	GOTO       L_main26
;problem_1.c,80 :: 		delay_ms(115);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      176
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
;problem_1.c,81 :: 		if(portd.f6 == 1)
	BTFSS      PORTD+0, 6
	GOTO       L_main28
;problem_1.c,82 :: 		y++;
	INCF       _y+0, 1
	BTFSC      STATUS+0, 2
	INCF       _y+1, 1
L_main28:
;problem_1.c,83 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,84 :: 		}
L_main26:
;problem_1.c,85 :: 		if(portd.f7 == 1)
	BTFSS      PORTD+0, 7
	GOTO       L_main29
;problem_1.c,87 :: 		delay_ms(115);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      176
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
;problem_1.c,88 :: 		if(portd.f7 == 1)
	BTFSS      PORTD+0, 7
	GOTO       L_main31
;problem_1.c,89 :: 		y--;
	MOVLW      1
	SUBWF      _y+0, 1
	BTFSS      STATUS+0, 0
	DECF       _y+1, 1
L_main31:
;problem_1.c,90 :: 		digit_display(leftDigit, rightDigit);
	MOVF       _leftDigit+0, 0
	MOVWF      FARG_digit_display_left+0
	MOVF       _leftDigit+1, 0
	MOVWF      FARG_digit_display_left+1
	MOVF       _rightDigit+0, 0
	MOVWF      FARG_digit_display_right+0
	MOVF       _rightDigit+1, 0
	MOVWF      FARG_digit_display_right+1
	CALL       _digit_display+0
;problem_1.c,91 :: 		}
L_main29:
;problem_1.c,75 :: 		for(k=0; k<10; k++)
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;problem_1.c,92 :: 		}
	GOTO       L_main23
L_main24:
;problem_1.c,94 :: 		if(mode_bit == 1)
	MOVLW      0
	XORWF      _mode_bit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      1
	XORWF      _mode_bit+0, 0
L__main47:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;problem_1.c,95 :: 		m=y, n=y;
	MOVF       _y+0, 0
	MOVWF      _m+0
	MOVF       _y+1, 0
	MOVWF      _m+1
	MOVF       _y+0, 0
	MOVWF      _n+0
	MOVF       _y+1, 0
	MOVWF      _n+1
L_main32:
;problem_1.c,97 :: 		if(m==chk)
	MOVF       _m+1, 0
	XORWF      _chk+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       _chk+0, 0
	XORWF      _m+0, 0
L__main48:
	BTFSS      STATUS+0, 2
	GOTO       L_main33
;problem_1.c,99 :: 		porte.f0 = 0;
	BCF        PORTE+0, 0
;problem_1.c,100 :: 		porte.f1 = 1;
	BSF        PORTE+0, 1
;problem_1.c,101 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
;problem_1.c,102 :: 		porte.f1 = 0;
	BCF        PORTE+0, 1
;problem_1.c,103 :: 		porte.f2 = 1;
	BSF        PORTE+0, 2
;problem_1.c,104 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;problem_1.c,105 :: 		porte.f2 = 0;
	BCF        PORTE+0, 2
;problem_1.c,106 :: 		porte.f0 = 1;
	BSF        PORTE+0, 0
;problem_1.c,108 :: 		}
L_main33:
;problem_1.c,109 :: 		}
L_main19:
;problem_1.c,110 :: 		}
	GOTO       L_main2
;problem_1.c,111 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
