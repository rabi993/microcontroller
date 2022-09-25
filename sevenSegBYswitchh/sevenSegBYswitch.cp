#line 1 "C:/Users/rabiu/OneDrive/Desktop/microcontroller4-2/sevenSegBYswitchh/sevenSegBYswitch.c"
void main() {
 char array[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
 int i = 0;
 TRISB = 0x00;
 PORTB = 0x00;
 TRISD = 0xff;


 while(1) {
 if (portd.f0==1){
 delay_ms(200);

 if (portd.f0==1) {
 if (i<9)
 i++;

 }


 }

 if (portd.f4==1){
 delay_ms(200);

 if (portd.f4==1) {
 if(i>0)
 i--;

 }

 }
 portb = array[i];

 }
}
