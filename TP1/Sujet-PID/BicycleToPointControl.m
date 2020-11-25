function [ u ] = BicycleToPointControl( xTrue,xGoal )
%Computes a control to reach a pose for bicycle
%   xTrue is the robot current pose : [ x y theta ]'
%   xGoal is the goal point
%   u is the control : [v phi]'


% TODO

    Krho = 20;
    Kalpha = 10;

    error = xGoal-xTrue;
    goalDist = norm(error(1:2));
    alpha = AngleWrap(atan2(error(2),error(1))-xTrue(3));
    
    u(1) = Krho * goalDist;
    u(2) = Kalpha * alpha;
    
end

