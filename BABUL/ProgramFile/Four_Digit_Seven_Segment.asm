
_main:

;Four_Digit_Seven_Segment.c,2 :: 		void main() {
;Four_Digit_Seven_Segment.c,3 :: 		int i=0, j,k,a,b,c,d;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Four_Digit_Seven_Segment.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Four_Digit_Seven_Segment.c,5 :: 		portb = 0x00;
	CLRF       PORTB+0
;Four_Digit_Seven_Segment.c,6 :: 		TRISD =0x00;
	CLRF       TRISD+0
;Four_Digit_Seven_Segment.c,7 :: 		portd=0x00;
	CLRF       PORTD+0
;Four_Digit_Seven_Segment.c,8 :: 		while(1)
L_main0:
;Four_Digit_Seven_Segment.c,10 :: 		for(i=0;i<30;i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      30
	SUBWF      main_i_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Four_Digit_Seven_Segment.c,12 :: 		a=i;
	MOVF       main_i_L0+0, 0
	MOVWF      R4+0
	MOVF       main_i_L0+1, 0
	MOVWF      R4+1
;Four_Digit_Seven_Segment.c,13 :: 		b=a+1;
	MOVF       main_i_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      R6+0
	MOVF       R0+1, 0
	MOVWF      R6+1
;Four_Digit_Seven_Segment.c,14 :: 		c=b+1;
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      R8+0
	MOVF       R0+1, 0
	MOVWF      R8+1
;Four_Digit_Seven_Segment.c,15 :: 		d=c+1;
	MOVF       R0+0, 0
	ADDLW      1
	MOVWF      R10+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      R10+1
;Four_Digit_Seven_Segment.c,17 :: 		for(k=0;k<10;k++)
	CLRF       R2+0
	CLRF       R2+1
L_main5:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      10
	SUBWF      R2+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Four_Digit_Seven_Segment.c,19 :: 		portd.f2=1;
	BSF        PORTD+0, 2
;Four_Digit_Seven_Segment.c,20 :: 		portb = array[a];
	MOVF       R4+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Four_Digit_Seven_Segment.c,21 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
;Four_Digit_Seven_Segment.c,22 :: 		portd.f2=0;
	BCF        PORTD+0, 2
;Four_Digit_Seven_Segment.c,24 :: 		portd.f3=1;
	BSF        PORTD+0, 3
;Four_Digit_Seven_Segment.c,25 :: 		portb= array[b];
	MOVF       R6+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Four_Digit_Seven_Segment.c,26 :: 		delay_ms( 10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;Four_Digit_Seven_Segment.c,27 :: 		portd.f3=0;
	BCF        PORTD+0, 3
;Four_Digit_Seven_Segment.c,29 :: 		portd.f4=1;
	BSF        PORTD+0, 4
;Four_Digit_Seven_Segment.c,30 :: 		portb = array[c];
	MOVF       R8+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Four_Digit_Seven_Segment.c,31 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;Four_Digit_Seven_Segment.c,32 :: 		portd.f4=0;
	BCF        PORTD+0, 4
;Four_Digit_Seven_Segment.c,34 :: 		portd.f5=1;
	BSF        PORTD+0, 5
;Four_Digit_Seven_Segment.c,35 :: 		portb= array[d];
	MOVF       R10+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Four_Digit_Seven_Segment.c,36 :: 		delay_ms(10);
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
;Four_Digit_Seven_Segment.c,37 :: 		portd.f5=0;
	BCF        PORTD+0, 5
;Four_Digit_Seven_Segment.c,17 :: 		for(k=0;k<10;k++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Four_Digit_Seven_Segment.c,38 :: 		}
	GOTO       L_main5
L_main6:
;Four_Digit_Seven_Segment.c,10 :: 		for(i=0;i<30;i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Four_Digit_Seven_Segment.c,40 :: 		}
	GOTO       L_main2
L_main3:
;Four_Digit_Seven_Segment.c,41 :: 		}
	GOTO       L_main0
;Four_Digit_Seven_Segment.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
