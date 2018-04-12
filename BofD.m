
dt = .1
c = 0.1;
t = 0:dt:3.2/c
t = t'


r = [.3960*cos(2.65*(t*c+1.4)), -.99*sin(c*t + 1.4)];
v = diff(r)./diff(t);
mag_v = sqrt(v(:,1).^2 +v(:,2).^2)
That = v./mag_v(1:length(v),:);
That_p= diff(That)./diff(t(1:length(That),:));
That_c = horzcat(That, zeros(length(That),1));
That_pc = horzcat(That_p, zeros(length(That_p),1));
w = cross(That_c(1:length(That_pc),:),That_pc);
V = sqrt(sum((v'.^2)))'

d = .245

for b = 1:length(w)
    VL(b,:) = V(b,:)- (w(b,3)*(d/2));
end
for b = 1:length(w)
    VR(b,:) = V(b,:)+(w(b,3)*(d/2));
end

pub = rospublisher('/raw_vel')
msg = rosmessage(pub)
    
for i = 1:length(VL)
    msg.Data = [VL(i,:),VR(i,:)]
    VL(i,:)
    VR(i,:)
    send(pub,msg)
    pause(dt)
end


msg.Data = [0,0]
send(pub,msg)

