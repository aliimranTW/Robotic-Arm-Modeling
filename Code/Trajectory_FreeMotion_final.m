%% Position of the Lynxmotion

t = linspace(0,4,41);

d1 = 3.11;
a2 = 4.75;
a3 = 4.75;
d5 = 5.61;

N = 41;

%% Plot the robotic arm, in 4 different positions

x0 = zeros(1,N);
y0 = zeros(1,N);
z0 = zeros(1,N);

x1 = zeros(1,N);
y1 = zeros(1,N);
z1 = d1*ones(1,N);

for i = 1:N    
    
if t(i)>=0 && t(i)<=1
q1(i) = 90;
q2(i) = 120 - 120*(t(i)^2) + 80*(t(i)^3);
q3(i) = -35 - 75*(t(i)^2) + 50*(t(i)^3);
q4(i) = 30 + 120*(t(i)^2) - 80*(t(i)^3);

elseif t(i)>1 && t(i)<=2
q1(i) = 90;
q2(i) = 80 - 150*(t(i)-1)^2 + 100*(t(i)-1)^3;
q3(i) = -60 + 60*(t(i)-1)^2 - 40*(t(i)-1)^3;
q4(i) = 70 - 60*(t(i)-1)^2 + 40*(t(i)-1)^3;

elseif t(i)>2 && t(i)<=3
q1(i) = 90;
q2(i) = 30 - 90*(t(i)-2)^2 + 60*(t(i)-2)^3;
q3(i) = -40 + 120*(t(i)-2)^2 - 80*(t(i)-2)^3;
q4(i) = 50 - 150*(t(i)-2)^2 + 100 *(t(i)-2)^3;   

elseif t(i)>3 && t(i)<=4
q1(i) = 90;
q2(i) = 60*(t(i)-3)^2 - 40*(t(i)-3)^3;
q3(i) = -180*(t(i)-3)^2 + 120*(t(i)-3)^3;
q4(i) = 30*(t(i)-3)^2 - 20*(t(i)-3)^3;
end    

c1(i) = cosd(q1(i));
s1(i) = sind(q1(i));

c2(i) = cosd(q2(i));
s2(i) = sind(q2(i));

c3(i) = cosd(q3(i));
s3(i) = sind(q3(i));

c4(i) = cosd(q4(i));
s4(i) = sind(q4(i));

c23(i) = cosd(q2(i)+q3(i));
s23(i) = sind(q2(i)+q3(i));

c234(i) = cosd(q2(i)+q3(i)+q4(i));
s234(i) = sind(q2(i)+q3(i)+q4(i));

x2(i) = (a2*c2(i))*c1(i) ;
y2(i) = (a2*c2(i))*s1(i);
z2(i) = d1 + a2*s2(i);

x3(i) = (a2*c2(i) + a3*c23(i))*c1(i) ;
y3(i) = (a2*c2(i) + a3*c23(i))*s1(i);
z3(i) = d1 + a2*s2(i) + a3*s23(i) ;

xt(i) = (a2*c2(i) + a3*c23(i) + d5*s234(i))*c1(i);
yt(i) = (a2*c2(i) + a3*c23(i) + d5*s234(i))*s1(i);
zt(i) = d1 + a2*s2(i) + a3*s23(i) - d5*c234(i);
    
xx = [ x0(i); x1(i); x2(i); x3(i); xt(i) ] ; 
yy = [ y0(i); y1(i); y2(i); y3(i); yt(i) ] ; 
zz = [ z0(i); z1(i); z2(i); z3(i); zt(i) ] ;
    
    %% Plot 3d
    figure(2)
    plot3(xx,yy,zz,'ko-','Linewidth',2)
    axis ([-10 20 -10 20 -10 20])
    
    % Defined Point in Part IB
    text(0, 10.8984, 9.4124, 'x') ;
    text(0, 12.3975, 0.3627, 'x') ;
    text(0, 9.5, -2.5, 'x') ;
    text(0, 5.2973, -3.177, 'x') ;
    
    xlabel('x (inch)') ; ylabel('y (inch)'); zlabel('z (inch)');
    
    hold on

    text(x0, y0, z0,'x') ; %%In this case x to label position 
    text(x0+1, y0, z0,'Base') ; %%label start pos
    text(xt(1), yt(1), zt(1), 'x') ; %%In this case x to label position 
    plot3(xt,yt,zt,'-','Linewidth',2,'Color','r')
    
    grid on
    

    %% Pause
    pause(0.1)
    hold off
    pause(0.1)
end

