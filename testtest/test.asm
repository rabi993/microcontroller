
_main:

;test.c,1 :: 		void main() {
;test.c,2 :: 		TRISB = 0x00;  //PORTB as output (all the 6 pin)
	CLRF       TRISB+0
;test.c,4 :: 		while(1) {
L_main0:
;test.c,6 :: 		PORTB = 0XFF;    //On ; non case-sensetative;   portb = 0xff;
	MOVLW      255
	MOVWF      PORTB+0
;test.c,7 :: 		delay_ms(100);  //wait for 1 second
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;test.c,8 :: 		PORTB = 0x00;   // Off;
	CLRF       PORTB+0
;test.c,9 :: 		delay_ms(100); //wait for 1 second
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;test.c,10 :: 		}
	GOTO       L_main0
;test.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
