%% Angles
%d1 = 7.899;
%a2 = 12.065;
%a3 = 12.065;
%d5 = 14.249;

d1 = 3.11;
a2 = 4.75;
a3 = 4.75;
d5 = 5.61;


q1 = 90;
q2 = 103.0405;  
q3 = -23.56;
q4 = 30.5195;
q5 = 0;

c1 = cosd(q1);
s1 = sind(q1);

c2 = cosd(q2);
s2 = sind(q2);

c3 = cosd(q3);
s3 = sind(q3);

c4 = cosd(q4);
s4 = sind(q4);

c5 = cosd(q5);
s5 = sind(q5);

c23 = cosd(q2+q3);
s23 = sind(q2+q3);

c234 = cosd(q2+q3+q4);
s234 = sind(q2+q3+q4);

T01 = [ c1 -s1 0 0; s1 c1 0 0; 0 0 1 d1; 0 0 0 1 ];
T12 = [ c2 -s2 0 0; 0 0 -1 0; s2 c2 0 0; 0 0 0 1 ];
T23 = [ c3 -s3 0 a2; s3 c3 0 0; 0 0 1 0; 0 0 0 1 ];
T34 = [ c4 -s4 0 a3; s4 c4 0 0; 0 0 1 0; 0 0 0 1];
T45 = [ c5 -s5 0 0; 0 0 -1 -d5; s5 c5 0 0; 0 0 0 1];

T05c = T01*T12*T23*T34*T45

T05 = [(c1*c234*c5+s1*s5) (-c1*c234*s5+s1*c5) (c1*s234) ((a2*c2+a3*c23+d5*s234).*c1);
       (s1*c234*c5-c1*s5) (-s1*c234*s5-c1*c5) (s1*s234) ((a2*c2+a3*c23+d5*s234).*s1);
       (s234*c5) (-s234*s5) (-c234) (d1+a2*s2+a3*s23-d5*c234);
        0 0 0 1;];