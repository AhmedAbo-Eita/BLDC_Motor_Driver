function V_out = inverter_bridge_logic(S_abc, V_dc)
    % S_abc: [3x1] Switching states [Sa; Sb; Sc] (0 or 1)
    % V_dc:  DC Link Voltage
    % V_out: [3x1] Phase-to-Neutral voltages [Van; Vbn; Vcn]
    
    % if the S is 1 (high) so the high side MOSFET is on and Low Side is
    % off
    % if the S is 0 (Zero) so the high side MOSFET is off and Low Side is
    % on


    % Calculate terminal voltages relative to Ground
    %Voltage referance to ground = the switching value * DC voltage
    V_gnd = S_abc .* V_dc; 

    % Calculate Neutral Point Voltage (floating neutral)
    %sum of 3 voltage relative to ground /3 
    V_n = sum(V_gnd) / 3;

    % Output Phase-to-Neutral voltages
    % This is the output phase voltage
    V_out = V_gnd - V_n;
end