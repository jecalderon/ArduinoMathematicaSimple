// Voltmeter

void setup() {
  Serial.begin(115200);
}

void loop() {
  // A value of 1023 = 5V, a value of 0 = 0V
  int value = analogRead(A0);
  float voltage = value * (5.0 / 1023.0);
  
  Serial.println(voltage);
  
  delay(100);
}

