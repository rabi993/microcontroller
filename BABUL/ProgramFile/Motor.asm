
_main:

;Motor.c,6 :: 		void main()
;Motor.c,9 :: 		TRISB =0x00;
	CLRF       TRISB+0
;Motor.c,10 :: 		portb = 0x00;
	CLRF       PORTB+0
;Motor.c,11 :: 		TRISD = 0xff;
	MOVLW      255
	MOVWF      TRISD+0
;Motor.c,14 :: 		while(1){
L_main0:
;Motor.c,17 :: 		if( sttus==1)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      1
	XORWF      _sttus+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Motor.c,19 :: 		if(portd.f4==1)
	BTFSS      PORTD+0, 4
	GOTO       L_main3
;Motor.c,21 :: 		carry = 1;portd.f4=0;
	MOVLW      1
	MOVWF      _carry+0
	MOVLW      0
	MOVWF      _carry+1
	BCF        PORTD+0, 4
;Motor.c,22 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;Motor.c,23 :: 		}
L_main3:
;Motor.c,24 :: 		if(portd.f3==1)
	BTFSS      PORTD+0, 3
	GOTO       L_main4
;Motor.c,26 :: 		carry =0;
	CLRF       _carry+0
	CLRF       _carry+1
;Motor.c,27 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;Motor.c,28 :: 		}
L_main4:
;Motor.c,30 :: 		}
	GOTO       L_main5
L_main2:
;Motor.c,31 :: 		else if( sttus==2)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      2
	XORWF      _sttus+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Motor.c,33 :: 		if(portd.f1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main7
;Motor.c,35 :: 		carry=1;portd.f1=0;
	MOVLW      1
	MOVWF      _carry+0
	MOVLW      0
	MOVWF      _carry+1
	BCF        PORTD+0, 1
;Motor.c,36 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;Motor.c,37 :: 		}
L_main7:
;Motor.c,38 :: 		if(portd.f3==1)
	BTFSS      PORTD+0, 3
	GOTO       L_main8
;Motor.c,40 :: 		carry=0;
	CLRF       _carry+0
	CLRF       _carry+1
;Motor.c,41 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;Motor.c,42 :: 		}
L_main8:
;Motor.c,43 :: 		}
	GOTO       L_main9
L_main6:
;Motor.c,46 :: 		if(portd.f1==1 && !carry)
	BTFSS      PORTD+0, 1
	GOTO       L_main12
	MOVF       _carry+0, 0
	IORWF      _carry+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
L__main24:
;Motor.c,47 :: 		sttus=1;
	MOVLW      1
	MOVWF      _sttus+0
	MOVLW      0
	MOVWF      _sttus+1
	GOTO       L_main13
L_main12:
;Motor.c,48 :: 		else if(portd.f4==1 && !carry)
	BTFSS      PORTD+0, 4
	GOTO       L_main16
	MOVF       _carry+0, 0
	IORWF      _carry+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main16
L__main23:
;Motor.c,49 :: 		sttus=2;
	MOVLW      2
	MOVWF      _sttus+0
	MOVLW      0
	MOVWF      _sttus+1
	GOTO       L_main17
L_main16:
;Motor.c,52 :: 		carry=0;
	CLRF       _carry+0
	CLRF       _carry+1
;Motor.c,53 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Motor.c,54 :: 		portd.f4=0;
	BCF        PORTD+0, 4
;Motor.c,55 :: 		sttus=0;
	CLRF       _sttus+0
	CLRF       _sttus+1
;Motor.c,56 :: 		}
L_main17:
L_main13:
;Motor.c,58 :: 		}
L_main9:
L_main5:
;Motor.c,60 :: 		if(sttus ==1)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      1
	XORWF      _sttus+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
;Motor.c,62 :: 		forward();
	CALL       _forward+0
;Motor.c,63 :: 		}
	GOTO       L_main19
L_main18:
;Motor.c,64 :: 		else if(sttus==2)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      2
	XORWF      _sttus+0, 0
L__main29:
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;Motor.c,66 :: 		reverse();
	CALL       _reverse+0
;Motor.c,67 :: 		}
	GOTO       L_main21
L_main20:
;Motor.c,68 :: 		else if(sttus==0)
	MOVLW      0
	XORWF      _sttus+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	XORWF      _sttus+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;Motor.c,70 :: 		stop();
	CALL       _stop+0
;Motor.c,71 :: 		}
L_main22:
L_main21:
L_main19:
;Motor.c,72 :: 		}
	GOTO       L_main0
;Motor.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_forward:

;Motor.c,75 :: 		void forward()
;Motor.c,77 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;Motor.c,78 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;Motor.c,79 :: 		}
L_end_forward:
	RETURN
; end of _forward

_reverse:

;Motor.c,81 :: 		void reverse()
;Motor.c,83 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;Motor.c,84 :: 		portb.f2=1;
	BSF        PORTB+0, 2
;Motor.c,85 :: 		}
L_end_reverse:
	RETURN
; end of _reverse

_stop:

;Motor.c,87 :: 		void stop()
;Motor.c,89 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;Motor.c,90 :: 		portb.f2=0;
	BCF        PORTB+0, 2
;Motor.c,91 :: 		}
L_end_stop:
	RETURN
; end of _stop
