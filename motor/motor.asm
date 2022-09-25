
_main:

;motor.c,6 :: 		void main()
;motor.c,9 :: 		TRISB =0x00;
	CLRF       TRISB+0
;motor.c,10 :: 		portb = 0x00;
	CLRF       PORTB+0
;motor.c,11 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;motor.c,14 :: 		while(1){
L_main0:
;motor.c,17 :: 		if( sttus==1)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      1
	XORWF      _sttus+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;motor.c,19 :: 		if(portd.f4==1)
	BTFSS      PORTD+0, 4
	GOTO       L_main3
;motor.c,21 :: 		carry = 1;portd.f4=0;
	MOVLW      1
	MOVWF      _carry+0
	MOVLW      0
	MOVWF      _carry+1
	BCF        PORTD+0, 4
;motor.c,22 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;motor.c,23 :: 		}
L_main3:
;motor.c,24 :: 		if(portd.f3==1)
	BTFSS      PORTD+0, 3
	GOTO       L_main4
;motor.c,26 :: 		carry =0;
	CLRF       _carry+0
	CLRF       _carry+1
;motor.c,27 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;motor.c,28 :: 		}
L_main4:
;motor.c,30 :: 		}
	GOTO       L_main5
L_main2:
;motor.c,31 :: 		else if( sttus==2)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      2
	XORWF      _sttus+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;motor.c,33 :: 		if(portd.f1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main7
;motor.c,35 :: 		carry=1;portd.f1=0;
	MOVLW      1
	MOVWF      _carry+0
	MOVLW      0
	MOVWF      _carry+1
	BCF        PORTD+0, 1
;motor.c,36 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;motor.c,37 :: 		}
L_main7:
;motor.c,38 :: 		if(portd.f3==1)
	BTFSS      PORTD+0, 3
	GOTO       L_main8
;motor.c,40 :: 		carry=0;
	CLRF       _carry+0
	CLRF       _carry+1
;motor.c,41 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;motor.c,42 :: 		}
L_main8:
;motor.c,43 :: 		}
	GOTO       L_main9
L_main6:
;motor.c,46 :: 		if(portd.f1==1 && !carry)
	BTFSS      PORTD+0, 1
	GOTO       L_main12
	MOVF       _carry+0, 0
	IORWF      _carry+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
L__main24:
;motor.c,47 :: 		sttus=1;
	MOVLW      1
	MOVWF      _sttus+0
	MOVLW      0
	MOVWF      _sttus+1
	GOTO       L_main13
L_main12:
;motor.c,48 :: 		else if(portd.f4==1 && !carry)
	BTFSS      PORTD+0, 4
	GOTO       L_main16
	MOVF       _carry+0, 0
	IORWF      _carry+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main16
L__main23:
;motor.c,49 :: 		sttus=2;
	MOVLW      2
	MOVWF      _sttus+0
	MOVLW      0
	MOVWF      _sttus+1
	GOTO       L_main17
L_main16:
;motor.c,52 :: 		carry=0;
	CLRF       _carry+0
	CLRF       _carry+1
;motor.c,53 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;motor.c,54 :: 		portd.f4=0;
	BCF        PORTD+0, 4
;motor.c,55 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;motor.c,56 :: 		}
L_main17:
L_main13:
;motor.c,58 :: 		}
L_main9:
L_main5:
;motor.c,60 :: 		if(sttus ==1)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      1
	XORWF      _sttus+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;motor.c,62 :: 		forward();
	CALL       _forward+0
;motor.c,63 :: 		}
	GOTO       L_main19
L_main18:
;motor.c,64 :: 		else if(sttus==2)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      2
	XORWF      _sttus+0, 0
L__main29:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;motor.c,66 :: 		reverse();
	CALL       _reverse+0
;motor.c,67 :: 		}
	GOTO       L_main21
L_main20:
;motor.c,68 :: 		else if(sttus==0)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	XORWF      _sttus+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;motor.c,70 :: 		stop();
	CALL       _stop+0
;motor.c,71 :: 		}
L_main22:
L_main21:
L_main19:
;motor.c,72 :: 		}
	GOTO       L_main0
;motor.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_forward:

;motor.c,75 :: 		void forward()
;motor.c,77 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;motor.c,78 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;motor.c,79 :: 		}
L_end_forward:
	RETURN
; end of _forward

_reverse:

;motor.c,81 :: 		void reverse()
;motor.c,83 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;motor.c,84 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;motor.c,85 :: 		}
L_end_reverse:
	RETURN
; end of _reverse

_stop:

;motor.c,87 :: 		void stop()
;motor.c,89 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;motor.c,90 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;motor.c,91 :: 		}
L_end_stop:
	RETURN
; end of _stop
