
_main:

;seven_segment.c,1 :: 		void main() {
;seven_segment.c,2 :: 		char array[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
	MOVLW      192
	MOVWF      main_array_L0+0
	MOVLW      249
	MOVWF      main_array_L0+1
	MOVLW      164
	MOVWF      main_array_L0+2
	MOVLW      176
	MOVWF      main_array_L0+3
	MOVLW      153
	MOVWF      main_array_L0+4
	MOVLW      146
	MOVWF      main_array_L0+5
	MOVLW      130
	MOVWF      main_array_L0+6
	MOVLW      248
	MOVWF      main_array_L0+7
	MOVLW      128
	MOVWF      main_array_L0+8
	MOVLW      144
	MOVWF      main_array_L0+9
;seven_segment.c,4 :: 		trisb =0x00;
	CLRF       TRISB+0
;seven_segment.c,5 :: 		portb = 0x00;
	CLRF       PORTB+0
;seven_segment.c,7 :: 		while(1) {
L_main0:
;seven_segment.c,8 :: 		for(i=0;i<10;i++){
	CLRF       R1+0
	CLRF       R1+1
L_main2:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      R1+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;seven_segment.c,9 :: 		portb = array[i];
	MOVF       R1+0, 0
	ADDLW      main_array_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;seven_segment.c,10 :: 		delay_ms(1000);
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
;seven_segment.c,8 :: 		for(i=0;i<10;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;seven_segment.c,11 :: 		}
	GOTO       L_main2
L_main3:
;seven_segment.c,12 :: 		}
	GOTO       L_main0
;seven_segment.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
