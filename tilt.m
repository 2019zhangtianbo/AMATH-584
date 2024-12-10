% AMATH 584 HW1 Problem 1 Tianbo Zhang

% Part A
function f = tilt(s)
% tilt(s) returns the linear operator where it will perform
% a horizontal shear with shear factor s
    L = [1 s;
         0 1];
    f = L;
end