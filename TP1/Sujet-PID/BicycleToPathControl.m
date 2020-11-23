function [ u ] = BicycleToPathControl( xTrue, Path )
%Computes a control to follow a path for bicycle
%   xTrue is the robot current pose : [ x y theta ]'
%   Path is set of points defining the path : [ x1 x2 ... ;
%                                               y1 y2 ...]
%   u is the control : [v phi]'

% TODO

persistent goalWaypointId xGoal;

%set first waypoint and goal on the path when starting trajectory
if xTrue==[0;0;0]
    goalWaypointId=1;
    xGoal=Path(:,1);
end

rho=0.3;

%% First define current goal
% check if the goal waypoint is reached 
error=Path(:,goalWaypointId)-xTrue;
waypointDist=norm(error(1:2));
if waypointDist<rho
    % if reached, set xGoal to waypoint and goalWaipoint to next waypoint
    xGoal=Path(:,goalWaypointId);
    goalWaypointId=goalWaypointId+1;
    goalWaypointId = min(goalWaypointId,size(Path,2)); % avoid taking point after path end
else
    %if not reached, move goal along line to next waypoint while dist < rho
    delta=Path(:,goalWaypointId) - Path(:,goalWaypointId-1);
    delta=delta/norm(delta); % unit direction vector to next waypoint
    
    error=xGoal-xTrue;
    goalDist=norm(error(1:2)); % rho
    
    while goalDist<rho
        xGoal=xGoal+0.01*delta;
        error=xGoal-xTrue;
        goalDist=norm(error(1:2)); % rho
    end
end

%% Then perform control
    Krho=15;
    Kalpha=10;
 
    error = xGoal-xTrue;
    goalDist = norm(error(1:2));
    AngleToGoal = AngleWrap(atan2(error(2),error(1))-xTrue(3));

    u(1) = Krho * goalDist;
    u(2) = Kalpha * Kalpha*AngleToGoal;
;
    
end

