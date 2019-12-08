%% Position of the Lynxmotion

d1 = 3.11;
a2 = 4.75;
a3 = 4.75;
d5 = 5.61;

N = 12;

q1 = 90*ones(1,N);
q2 = [120 118.296 135.9110 104.0242 99.2081 80 64.4476 30 23.6726 0 17.6182 20 ];
q3 = [-35 -51.8276 -88.38 -88.6948 -69.5118 -60 -60.861 -40 -33.5418 0 -42.0859 -60];
q4 = [30 38.5766 22.4690 64.6706 65.3036 70 56.4134 50 29.8692 0 9.4677 10];

q5 = zeros(1,N);

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

%% Plot the robotic arm, in 4 different positions
figure (2) 

x0 = zeros(1,N);
y0 = zeros(1,N);
z0 = zeros(1,N);

x1 = zeros(1,N);
y1 = zeros(1,N);
z1 = d1*ones(1,N);

x2 = (a2*c2).*c1 ;
y2 = (a2*c2).*s1;
z2 = d1 + a2*s2;

x3 = (a2*c2 + a3*c23).*c1 ;
y3 = (a2*c2 + a3*c23).*s1;
z3 = d1 + a2*s2 + a3*s23 ;

xt = (a2*c2 + a3*c23 + d5*s234).*c1;
yt = (a2*c2 + a3*c23 + d5*s234).*s1;
zt = d1 + a2*s2 + a3*s23 - d5*c234;

pt = [ xt yt zt ] ;

for i = 1:N
    
    xx = [ x0(i); x1(i); x2(i); x3(i); xt(i) ] ; %make x point of origin, end of link 1, end of link 2
    yy = [ y0(i); y1(i); y2(i); y3(i); yt(i) ] ; %make y point of origin, end of link 1, end of link 2
    zz = [ z0(i); z1(i); z2(i); z3(i); zt(i) ] ;
   
    obs1 = [7.0109,11.5];
    obs2 = [7.0109,12.5];
    
    obsy = [obs1(1);obs2(1)];
    obsz = [obs1(2);obs2(2)];
    
%     %% Plot 3d
%     plot3(xx,yy,zz,'ko-','Linewidth',2)
%     axis ([-15 15 -15 15 -15 15])
%     xlabel('x (m)') ; ylabel('y (m)'); zlabel('z (m)');
%     
%     hold on
% 
%     text(x0, y0, z0,'x') ; %%In this case x to label position 
%     text(x0+1, y0, z0,'Base') ; %%label start pos
%     text(xt, yt, zt, 'x') ; %%In this case x to label position  
%     plot3(xt,yt,zt,'-','Linewidth',2,'Color','r')
%     
%     grid on
    
       %% Plot 2d YZ
    figure (1)
    plot(yy,zz,'ko-','Linewidth',2)
    axis ([-20 20 -20 20])
    xlabel('y (m)') ; ylabel('z (m)');
    
    hold on
    
    

    text(y0, z0,'x') ; %%In this case x to label position 
    text(y0+1, z0,'Base') ; %%label start pos
    text(yt,zt, 'x') ; %%In this case x to label position  
    plot(yt,zt,'-','Linewidth',2,'Color','r')
    plot(obsy,obsz,'o','Linewidth',2,'Color','b')
    
    %% Pause
    pause(0.5)
    hold off
    pause(0.5)
end

