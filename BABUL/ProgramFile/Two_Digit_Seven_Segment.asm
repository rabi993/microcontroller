
_main:

;Two_Digit_Seven_Segment.c,3 :: 		void main() {
;Two_Digit_Seven_Segment.c,5 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Two_Digit_Seven_Segment.c,6 :: 		portb = 0x00;
	CLRF       PORTB+0
;Two_Digit_Seven_Segment.c,7 :: 		TRISC =0x00;
	CLRF       TRISC+0
;Two_Digit_Seven_Segment.c,8 :: 		portc=0x00;
	CLRF       PORTC+0
;Two_Digit_Seven_Segment.c,10 :: 		while(1)
L_main0:
;Two_Digit_Seven_Segment.c,12 :: 		for(i=0;i<10;i++)
	CLRF       R1+0
	CLRF       R1+1
L_main2:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      10
	SUBWF      R1+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Two_Digit_Seven_Segment.c,14 :: 		for(j =0;j<10;j++)
	CLRF       R3+0
	CLRF       R3+1
L_main5:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      10
	SUBWF      R3+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Two_Digit_Seven_Segment.c,16 :: 		for( k=0;k<50;k++)
	CLRF       R5+0
	CLRF       R5+1
L_main8:
	MOVLW      128
	XORWF      R5+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      50
	SUBWF      R5+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Two_Digit_Seven_Segment.c,18 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;Two_Digit_Seven_Segment.c,19 :: 		portb= array[i];
	MOVF       R1+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Two_Digit_Seven_Segment.c,20 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
;Two_Digit_Seven_Segment.c,21 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Two_Digit_Seven_Segment.c,23 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;Two_Digit_Seven_Segment.c,24 :: 		portb = array[j];
	MOVF       R3+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Two_Digit_Seven_Segment.c,25 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;Two_Digit_Seven_Segment.c,26 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;Two_Digit_Seven_Segment.c,16 :: 		for( k=0;k<50;k++)
	INCF       R5+0, 1
	BTFSC      STATUS+0, 2
	INCF       R5+1, 1
;Two_Digit_Seven_Segment.c,27 :: 		}
	GOTO       L_main8
L_main9:
;Two_Digit_Seven_Segment.c,14 :: 		for(j =0;j<10;j++)
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;Two_Digit_Seven_Segment.c,28 :: 		}
	GOTO       L_main5
L_main6:
;Two_Digit_Seven_Segment.c,12 :: 		for(i=0;i<10;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Two_Digit_Seven_Segment.c,29 :: 		}
	GOTO       L_main2
L_main3:
;Two_Digit_Seven_Segment.c,31 :: 		}
	GOTO       L_main0
;Two_Digit_Seven_Segment.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
