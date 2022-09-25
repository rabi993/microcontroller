#line 1 "C:/Users/rabiu/OneDrive/Desktop/microcontroller4-2/servomotor/servoMotor.c"
void Rotation0()
{
 unsigned int i;
 for(i=0;i<50;i++){
 PORTB.F0 = 1;
 Delay_ms(800);
 PORTB.F0 = 0;
 Delay_ms(19200);
 }
 }

void Rotation90()
 {
 unsigned int i;
 for(i=0;i<50;i++)
 {
 PORTB.F0 = 1;
 Delay_ms(1500);
 PORTB.F0 = 0;
 Delay_ms(18500);
 }
 }

void Rotation180()

 {
 unsigned int i;
 for(i=0;i<50;i++)
 {
 PORTB.F0 = 1;
 Delay_ms(2200);
 PORTB.F0 = 0;
 Delay_ms(17800);
 }
 }

void main()
{
 TRISB = 0;
 do
 {
 Rotation0();
 Delay_ms(2000);
 Rotation90();
 Delay_ms(2000);
 Rotation180();
 }while(1);
}
