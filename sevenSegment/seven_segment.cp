#line 1 "C:/Users/rabiu/OneDrive/Desktop/microcontroller4-2/sevenSegment/seven_segment.c"
void main() {
 char array[] = {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
 int i;
 trisb =0x00;
 portb = 0x00;

 while(1) {
 for(i=0;i<10;i++){
 portb = array[i];
 delay_ms(1000);
 }
 }
}
