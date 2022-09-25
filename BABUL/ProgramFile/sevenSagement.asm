
_main:

;sevenSagement.c,3 :: 		void main() {
;sevenSagement.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;sevenSagement.c,5 :: 		portb= 0x00;
	CLRF       PORTB+0
;sevenSagement.c,6 :: 		while(1){
L_main0:
;sevenSagement.c,7 :: 		for(i=0;i<10;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      _i+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;sevenSagement.c,8 :: 		portb= array[i];
	MOVF       _i+0, 0
	ADDLW      _array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;sevenSagement.c,9 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;sevenSagement.c,7 :: 		for(i=0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;sevenSagement.c,10 :: 		}
	GOTO       L_main2
L_main3:
;sevenSagement.c,11 :: 		}
	GOTO       L_main0
;sevenSagement.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
