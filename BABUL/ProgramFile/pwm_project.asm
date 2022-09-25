
_main:

;pwm_project.c,2 :: 		void main() {
;pwm_project.c,4 :: 		TRISB = 0x00;        //Set portB as output
	CLRF       TRISB+0
;pwm_project.c,5 :: 		PORTB = 0x00;        //PortB initialization
	CLRF       PORTB+0
;pwm_project.c,7 :: 		TRISC = 0x00;       //Set portC as output
	CLRF       TRISC+0
;pwm_project.c,8 :: 		PORTC = 0x00;       //Portc initialization
	CLRF       PORTC+0
;pwm_project.c,10 :: 		TRISD = 0xff;       //Set portC as intput
	MOVLW      255
	MOVWF      TRISD+0
;pwm_project.c,12 :: 		PWM1_Init(2000);    // Initialize PWM1 module at 5KHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm_project.c,13 :: 		duty = 0;
	CLRF       _duty+0
	CLRF       _duty+1
;pwm_project.c,15 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;pwm_project.c,16 :: 		PWM1_Set_Duty(duty);        // Set current duty for PWM1
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_project.c,17 :: 		portc.f2=1;
	BSF        PORTC+0, 2
;pwm_project.c,18 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;pwm_project.c,19 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;pwm_project.c,20 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;pwm_project.c,22 :: 		while(1)
L_main0:
;pwm_project.c,24 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;pwm_project.c,26 :: 		delay_ms(100);
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
;pwm_project.c,27 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;pwm_project.c,29 :: 		if(duty<=240)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _duty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _duty+0, 0
	SUBLW      240
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;pwm_project.c,30 :: 		duty=duty+10;
	MOVLW      10
	ADDWF      _duty+0, 1
	BTFSC      STATUS+0, 0
	INCF       _duty+1, 1
L_main5:
;pwm_project.c,31 :: 		PWM1_Set_Duty(duty);        // Set current duty for PWM1
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_project.c,32 :: 		}
L_main4:
;pwm_project.c,33 :: 		}
L_main2:
;pwm_project.c,34 :: 		if(portd.f1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main6
;pwm_project.c,36 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;pwm_project.c,37 :: 		if(portd.f1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main8
;pwm_project.c,39 :: 		if(duty>=10)
	MOVLW      128
	XORWF      _duty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      10
	SUBWF      _duty+0, 0
L__main12:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;pwm_project.c,40 :: 		duty=duty-10;
	MOVLW      10
	SUBWF      _duty+0, 1
	BTFSS      STATUS+0, 0
	DECF       _duty+1, 1
L_main9:
;pwm_project.c,41 :: 		PWM1_Set_duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm_project.c,42 :: 		}
L_main8:
;pwm_project.c,43 :: 		}
L_main6:
;pwm_project.c,45 :: 		}
	GOTO       L_main0
;pwm_project.c,46 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
