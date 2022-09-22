



function newSystemState = button_mode_logic(systemState)
%BUTTON_MODE_LOGIC Summary of this function goes here
%   Detailed explanation goes here

% when power button is pressed, check system state

%define system states
state_off = 0;
state_auto = 1;
state_fanL1 = 2;
state_fanL2 = 3;
state_fanL3 = 4;
state_fanL4 = 5;



% cycle thru system states
if systemState == state_off
    systemState = state_auto;

elseif systemState == state_auto
    systemState = state_fanL1;

elseif systemState == state_fanL1
    systemState = state_fanL2;

elseif systemState == state_fanL2
    systemState = state_fanL3;

elseif systemState == state_fanL3
    systemState = state_fanL4;

elseif systemState == state_fanL4
    systemState = state_off;

end 

    %return system state
    newSystemState = systemState;

end

