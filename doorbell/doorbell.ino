#define SERIAL_BAUDRATE 9600

void setup()
{
  Serial.begin( SERIAL_BAUDRATE);
}

void loop()
{
  if( analogRead(A0) > 800)
  {
    Serial.write("HELLO\n");
  }
}


