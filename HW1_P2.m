% HW1 Problem 2 executable part

% Part 1:
% Plots the grid of points
figure(1)
t = linspace(0, 1, 20); %t is 20 equally spaced points from 0 to 1
[x, y] = meshgrid(t,t); % form a grid of (x,y) pairs on [0, 1]^2
x = x(:);
y = y(:);
plot(x, y, '.k', 'markersize', 15) % plots pairs of points,
% uses dot markers, k = black color, size 15 markers
title('Square points');

% Part 2:
% Plots the transformed points
figure(2)
L = tilt(1/6);
v = [x.'; y.'];
result = L*v;
plot(result(1,:), result(2,:), '.k', 'markerSize', 15);
title('Tilted points')