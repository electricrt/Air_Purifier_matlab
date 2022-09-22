function [new_aqi, generate_new_seed] = increment_aqi(current_aqi)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%AQI Increment

    if current_aqi > generate_seed 

        new_aqi = current_aqi-1;
                
        generate_new_seed = 0;


    elseif current_aqi < generate_seed

        new_aqi = current_aqi+1;
                
        generate_new_seed = 0;


    elseif current_aqi == generate_seed

        
        % generate new seed
        generate_new_seed = 1;
       
    end

end