#line 1 "D:/4-2/Interfacing & Microcontroller/LapWork/ProgramFile/LEDLight.c"
void main() {
 TRISB =0x00;
 portb = 0x00;
 while(1){
 portb.f0= 0xff;
 delay_ms(500);
 portb.f0= 0x00;
 delay_ms(500);

 }
}
