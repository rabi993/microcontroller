void Rotation0()   // 0 degree
{
unsigned int i;
for(i=0;i<50;i++)
{
PORTB.F0 = 1;      //connected to RB0, Motor OFF
Delay_us(800);     //delay of 800us
PORTB.F0 = 0;      //connected to RB0, Motor ON
Delay_us(19200);   //delay of 19200us
}
}


void Rotation90() //90 Degree
{
unsigned int i;
for(i=0;i<50;i++)
{
PORTB.F0 = 1;
Delay_us(1500); // delay of 1500us
PORTB.F0 = 0;
Delay_us(18500);  //delay of 18500us
}
}


void Rotation180() //180 Degree

{
unsigned int i;
for(i=0;i<50;i++)
{
PORTB.F0 = 1;
Delay_us(2200); // delay of 2200us
PORTB.F0 = 0;
Delay_us(17800); //delay of 17800us
}
}
void main()
{
TRISB = 0; // PORTB as Ouput Port
do
{
Rotation0(); //0 Degree
Delay_ms(200);
Rotation90(); //90 Degree
Delay_ms(200);
Rotation180(); //180 Degree
}while(1);
}