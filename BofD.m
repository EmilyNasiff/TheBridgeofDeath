% pub = rospublisher('/raw_vel')
% msg = rosmessage(pub) 
%send(pub,msg) 

u = (2*pi)/20
v = @(t) -(1.0494*u + 1.46916)*sin(2.65*t*u + 3.71*t) - (.99*u + 1.386)*cos(u*t + 1.4*t)
w = @(t) -(((-.99*u + 1.386)*cos(u*t + 1.4*t))/(cos(2.65*t*u + 3.71*t))) - ((.99*sin(u*t + 1.4*t))/((-1.0494*u + 1.46916)*(sin(2.65*t*u + 3.71*t)).^2))*csc((-.99*sin(u*t + 1.4*t))/(.3960*cos(2.65*t*u + 3.71*t))).^2
d = .245
dt = .01
a = 1
for b = dt:dt:20,
   V(a,:) = v(b);
   a = a+1;
end

c =1

    for b = dt:dt:20
        W(c,:) = w(b);
        c = c+1;
    end
e = 1
for b = 1:2000
    Vl(e,:) = V(b,:)- (W(b,:)*(d/2));
    e = e+1;
end
f = 1
for b = 1:2000
    Vr(f,:) = V(b,:)+(W(b,:)*(d/2));
    f = f+1;
end
