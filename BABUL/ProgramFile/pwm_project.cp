#line 1 "D:/4-2/Interfacing & Microcontroller/LapWork/MicroController/ProgramFile/pwm_project.c"
int duty;
void main() {

 TRISB = 0x00;
 PORTB = 0x00;

 TRISC = 0x00;
 PORTC = 0x00;

 TRISD = 0xff;

 PWM1_Init(2000);
 duty = 0;

 PWM1_Start();
 PWM1_Set_Duty(duty);
 portc.f2=1;
 portc.f1=1;
 portb.f0=1;
 portb.f1=0;

 while(1)
 {
 if(portd.f0==1)
 {
 delay_ms(100);
 if(portd.f0==1)
 {
 if(duty<=240)
 duty=duty+10;
 PWM1_Set_Duty(duty);
 }
 }
 if(portd.f1==1)
 {
 delay_ms(100);
 if(portd.f1==1)
 {
 if(duty>=10)
 duty=duty-10;
 PWM1_Set_duty(duty);
 }
 }

 }
}
