function A=matrixA(theta,lambda,l,alpha)
A=[cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) l*cos(theta);
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) l*sin(theta);
    0 sin(alpha) cos(alpha) lambda;
    0 0 0 1];
end

