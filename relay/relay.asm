
_main:

;relay.c,1 :: 		void main() {
;relay.c,2 :: 		TRISC = 0X00;
	CLRF       TRISC+0
;relay.c,3 :: 		portc = 0X00;
	CLRF       PORTC+0
;relay.c,5 :: 		while(1)
L_main0:
;relay.c,7 :: 		portc.f0=0xff;
	BSF        PORTC+0, 0
;relay.c,8 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;relay.c,9 :: 		portc.f0= 0x00;
	BCF        PORTC+0, 0
;relay.c,10 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;relay.c,12 :: 		}
	GOTO       L_main0
;relay.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
