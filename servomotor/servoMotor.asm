
_Rotation0:

;servoMotor.c,1 :: 		void Rotation0() //0 Degree
;servoMotor.c,4 :: 		for(i=0;i<50;i++){
	CLRF       R1+0
	CLRF       R1+1
L_Rotation00:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation021
	MOVLW      50
	SUBWF      R1+0, 0
L__Rotation021:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation01
;servoMotor.c,5 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;servoMotor.c,6 :: 		Delay_ms(800); // pulse of 800us
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_Rotation03:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation03
	DECFSZ     R12+0, 1
	GOTO       L_Rotation03
	DECFSZ     R11+0, 1
	GOTO       L_Rotation03
	NOP
;servoMotor.c,7 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;servoMotor.c,8 :: 		Delay_ms(19200);
	MOVLW      195
	MOVWF      R11+0
	MOVLW      206
	MOVWF      R12+0
	MOVLW      157
	MOVWF      R13+0
L_Rotation04:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation04
	DECFSZ     R12+0, 1
	GOTO       L_Rotation04
	DECFSZ     R11+0, 1
	GOTO       L_Rotation04
	NOP
	NOP
;servoMotor.c,4 :: 		for(i=0;i<50;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;servoMotor.c,9 :: 		}
	GOTO       L_Rotation00
L_Rotation01:
;servoMotor.c,10 :: 		}
L_end_Rotation0:
	RETURN
; end of _Rotation0

_Rotation90:

;servoMotor.c,12 :: 		void Rotation90() //90 Degree
;servoMotor.c,15 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_Rotation905:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation9023
	MOVLW      50
	SUBWF      R1+0, 0
L__Rotation9023:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation906
;servoMotor.c,17 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;servoMotor.c,18 :: 		Delay_ms(1500); // pulse of 1500us
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_Rotation908:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation908
	DECFSZ     R12+0, 1
	GOTO       L_Rotation908
	DECFSZ     R11+0, 1
	GOTO       L_Rotation908
	NOP
	NOP
;servoMotor.c,19 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;servoMotor.c,20 :: 		Delay_ms(18500);
	MOVLW      188
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      115
	MOVWF      R13+0
L_Rotation909:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation909
	DECFSZ     R12+0, 1
	GOTO       L_Rotation909
	DECFSZ     R11+0, 1
	GOTO       L_Rotation909
	NOP
	NOP
;servoMotor.c,15 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;servoMotor.c,21 :: 		}
	GOTO       L_Rotation905
L_Rotation906:
;servoMotor.c,22 :: 		}
L_end_Rotation90:
	RETURN
; end of _Rotation90

_Rotation180:

;servoMotor.c,24 :: 		void Rotation180() //180 Degree
;servoMotor.c,28 :: 		for(i=0;i<50;i++)
	CLRF       R1+0
	CLRF       R1+1
L_Rotation18010:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation18025
	MOVLW      50
	SUBWF      R1+0, 0
L__Rotation18025:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation18011
;servoMotor.c,30 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;servoMotor.c,31 :: 		Delay_ms(2200); // pulse of 2200us
	MOVLW      23
	MOVWF      R11+0
	MOVLW      83
	MOVWF      R12+0
	MOVLW      55
	MOVWF      R13+0
L_Rotation18013:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation18013
	DECFSZ     R12+0, 1
	GOTO       L_Rotation18013
	DECFSZ     R11+0, 1
	GOTO       L_Rotation18013
	NOP
	NOP
;servoMotor.c,32 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;servoMotor.c,33 :: 		Delay_ms(17800);
	MOVLW      181
	MOVWF      R11+0
	MOVLW      154
	MOVWF      R12+0
	MOVLW      73
	MOVWF      R13+0
L_Rotation18014:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation18014
	DECFSZ     R12+0, 1
	GOTO       L_Rotation18014
	DECFSZ     R11+0, 1
	GOTO       L_Rotation18014
	NOP
	NOP
;servoMotor.c,28 :: 		for(i=0;i<50;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;servoMotor.c,34 :: 		}
	GOTO       L_Rotation18010
L_Rotation18011:
;servoMotor.c,35 :: 		}
L_end_Rotation180:
	RETURN
; end of _Rotation180

_main:

;servoMotor.c,37 :: 		void main()
;servoMotor.c,39 :: 		TRISB = 0; // PORTB as Ouput Port
	CLRF       TRISB+0
;servoMotor.c,40 :: 		do
L_main15:
;servoMotor.c,42 :: 		Rotation0(); //0 Degree
	CALL       _Rotation0+0
;servoMotor.c,43 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;servoMotor.c,44 :: 		Rotation90(); //90 Degree
	CALL       _Rotation90+0
;servoMotor.c,45 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;servoMotor.c,46 :: 		Rotation180(); //180 Degree
	CALL       _Rotation180+0
;servoMotor.c,47 :: 		}while(1);
	GOTO       L_main15
;servoMotor.c,48 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
