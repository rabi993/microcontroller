#line 1 "D:/4-2/Interfacing & Microcontroller/LapWork/MicroController/ProgramFile/SevenSegmentWithBUTTON.c"

char array[]={ 0x3F,0x06 ,0x5B ,0x4F , 0x66 ,0x6D , 0x7D,0x07 ,0x7F, 0x6F};
int cnt = 0;
void main() {
 TRISB =0x00;
 portb = 0xff;
 TRISD = 0xff;
 while(1){
 portb = array[cnt];
 if(portd.f5==1)
 {
 delay_ms(300);
 if(cnt<9) cnt++;
 else cnt=0;
 }
 if(portd.f6==1)
 {
 delay_ms(300);
 if(cnt>0) cnt--;
 else cnt =9;
 }

 }
}
