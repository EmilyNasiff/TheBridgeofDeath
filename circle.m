sub = rossubscriber('/bump')

t = 0;
while t < 16
    tic;
    pub = rospublisher('/raw_vel');
    message = rosmessage(pub);
    message.Data = [0.1, 0.2];
    send(pub, message);
    pause(0.1);
    toc;
    t = t + toc;
    disp(t)
end

pub = rospublisher('/raw_vel')
message = rosmessage(pub);
message.Data = [0, 0];
send(pub, message);r