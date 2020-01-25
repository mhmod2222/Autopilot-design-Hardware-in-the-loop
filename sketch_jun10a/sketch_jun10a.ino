#define pi 3.141592654

const int V_pin = A0;
const int alpha_pin = A1;
const int beta_pin = A2;
const int q_pin = A3;
const int theta_pin = A4;
const int de_pin = 10;

const double dr = pi/180;

const double k1 = 0.0031;
const double k2 = -0.7217;
const double k3 = -7.7460;

const double desired_angle = 10 * dr;

double Vo = 350; // m/s
double V;
double u;
double w;
float alpha;
float beta;
double q;
double theta;
double de;


void setup() {
  
  pinMode(de_pin, OUTPUT);
}

void loop() {
  
  V = analogRead(V_pin);
  V = map(V,0,1024,-0.25*Vo,0.25*Vo);
  V = constrain(V,-0.25*Vo,0.25*Vo);
  delay(1);

  alpha = analogRead(alpha_pin);
  alpha = map(alpha,0,1023,-30*dr,30*dr);
  alpha = constrain(alpha,-30*dr,30*dr);
  delay(1);

  beta = analogRead(beta_pin);
  beta = map(beta,0,1023,-30*dr,30*dr);
  beta = constrain(beta,-30*dr,30*dr);
  delay(1);

  theta = analogRead(theta_pin);
  theta = map(theta,0,1023,-90*dr,90*dr);
  theta = constrain(theta,-90*dr,90*dr);
  delay(1);

  q = analogRead(q_pin);
  q = map(q,0,1024,-50*dr,50*dr);
  q = constrain(q,-50*dr,50*dr);
  delay(1);

  u = sqrt((V*V*(1-(sin(beta)*sin(beta))))/(1+(tan(alpha)*tan(alpha))));
  w = u * tan(alpha);

  de = k3 * desired_angle - k1 * w - k2 * q - k3 * theta;
  de = constrain(de,-30*dr,30*dr);
  de = map(de,-30*dr,30*dr,0,255);
  analogWrite(de_pin,de);
}
