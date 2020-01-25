function [t,y] = rk4(f,a,b,ya,n)
h = (b - a) / n;
halfh = h / 2;
y(:,1) = ya;
t(1) = a;
h6 = h/6;
for i = 1 : n
    t(i+1) = t(i) + h;
    th2 = t(i) + halfh;
    s1 = f(t(i), y(:,i));
    s2 = f(th2, y(:,i) + halfh * s1);
    s3 = f(th2, y(:,i) + halfh * s2);
    s4 = f(t(i+1), y(:,i) + h * s3);
    y(:,i+1) = y(:,i) + (s1 + s2+s2 + s3+s3 + s4) * h6;
end