

function fan_level = fanmode_logic(aqi_reading)
    
   
    
    if aqi_reading < 50
       
        fan_level = 1;
    
    elseif aqi_reading > 50 & aqi_reading < 100
       
        fan_level = 2;
        
    elseif aqi_reading > 100 & aqi_reading < 150
        
        fan_level = 3;
        
    else if aqi_reading > 150
            
        fan_level = 4;
        
    else 
       
        fan_level = 0;
        
    end
    
end
    
   

    