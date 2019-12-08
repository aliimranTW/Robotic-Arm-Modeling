%% ***INVERSE KINEMATIC***
%% Input Transform and Length
d1 = 3.11;
a2 = 4.75;
a3 = 4.75;
d5 = 5.61;

r11=0 ;     r12=1; r13=0;       px=0;
r21=-0.9877; r22=0; r23=0.1564;  py=9.9789;
r31=0.1564; r32=0; r33=0.9877 ;pz=37.7415;

%% Thetas
q1 = atan2d(py,px);
s1=sind(q1);
c1=cosd(q1);

%q5 = atand((-r32)/r31);

q234 = sign(r23)*acosd(-r33);

s234 = sind(q234);
c234 = cosd(q234);

u = (py/s1) - d5*s234;
t = pz - d1 + d5*c234;
q3 = -acosd((u^2 + t^2 - a2^2 - a3^2)/(2*a2*a3));
s3 = sind(q3);
c3 = cosd(q3);

k = (py/s1) - d5*s234;
m = pz - d1 + d5*c234;

y = a3*s3;
x = a2 + a3*c3;

q2 = atan2d((m*x - k*y),(k*x + m*y));
