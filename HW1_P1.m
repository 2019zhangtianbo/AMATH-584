% AMATH 584 HW1 Problem 1 Tianbo Zhang
% Set up the matrix
fprintf('Set up B: \n');
B = rand(4,4)
original_B = B;
% double column 1
fprintf('Double column 1: \n');
B(:,1) = B(:,1)*2
% halve row 3
fprintf('Halve row 3: \n');
B(3,:) = B(3,:)/2
% add row 3 to row 1
fprintf('Add row 3 to row 1: \n');
B(1,:) = B(1,:) + B(3,:)
% interchange columns 1 and 4
fprintf('Interchange columns 1 and 4: \n');
B(:, [1,4]) = B(:, [4,1])
% subtract row 2 from each of the other row
fprintf('Subtract row 2 from each of the other row: \n');
B(1,:) = B(1,:) - B(2,:)
B(3,:) = B(3,:) - B(2,:)
B(4,:) = B(4,:) - B(2,:)
% replace column 4 by column 3
fprintf('Replace column 4 by column 3: \n');
B(:,4) = B(:,3)
% delete column 1
fprintf('Delete column 1: \n');
B(:,1) = []

A1 = [2 0 0 0;
       0 1 0 0;
       0 0 1 0
       0 0 0 1]
A2 = [1 0 0 0;
      0 1 0 0;
      0 0 1/2 0;
      0 0 0 1]
A3 = [1 0 1 0;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1]
A4 = [0 0 0 1;
      0 1 0 0;
      0 0 1 0;
      1 0 0 0]
A5 = [1 -1 0 0;
      0 1 0 0;
      0 -1 1 0;
      0 -1 0 1]
A6 = [1 0 0 0;
      0 1 0 0;
      0 0 1 1;
      0 0 0 0]
A7 = [0 0 0;
      1 0 0;
      0 1 0;
      0 0 1]
fprintf('Compute matrix A: \n')
A = A5*A3*A2
fprintf('Compute matrix C: \n')
C = A1*A4*A6*A7
fprintf('Result for ABC: \n')
A*original_B*C