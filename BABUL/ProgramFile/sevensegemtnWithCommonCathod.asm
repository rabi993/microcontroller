
_main:

;sevensegemtnWithCommonCathod.c,3 :: 		void main() {
;sevensegemtnWithCommonCathod.c,4 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;sevensegemtnWithCommonCathod.c,5 :: 		portb = 0xff;
	MOVLW      255
	MOVWF      PORTB+0
;sevensegemtnWithCommonCathod.c,7 :: 		while(1){
L_main0:
;sevensegemtnWithCommonCathod.c,8 :: 		for(i=0;i<10;i++){portb = arr[i];
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
	MOVF       _i+0, 0
	ADDLW      _arr+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;sevensegemtnWithCommonCathod.c,9 :: 		delay_ms(1000);   }
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
;sevensegemtnWithCommonCathod.c,8 :: 		for(i=0;i<10;i++){portb = arr[i];
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;sevensegemtnWithCommonCathod.c,9 :: 		delay_ms(1000);   }
	GOTO       L_main2
L_main3:
;sevensegemtnWithCommonCathod.c,10 :: 		}
	GOTO       L_main0
;sevensegemtnWithCommonCathod.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
