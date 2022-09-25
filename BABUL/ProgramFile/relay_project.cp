#line 1 "D:/4-2/Interfacing & Microcontroller/LapWork/MicroController/ProgramFile/relay_project.c"
void main() {
 TRISC = 0X00;
 portc = 0X00;

 while(1)
 {
 portc.f0=0xff;
 delay_ms(1000);
 portc.f0= 0x00;
 delay_ms(1000);

 }
}
