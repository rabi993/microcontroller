#line 1 "D:/4-2/Interfacing & Microcontroller/LapWork/ProgramFile/sevenSagement.c"
char array[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
int i;
void main() {
 TRISB = 0x00;
 portb= 0x00;
 while(1){
 for(i=0;i<10;i++){
 portb= array[i];
 delay_ms(1000);
 }
 }
}
