classdef aqi_class < handle
    %UNTITLED8 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        current_aqi = 0;
        target_aqi = 0;
        max_aqi = 0;
        
    end

    methods
        function obj = aqi_class()
            % Construct an instance of this class
            %  Max Aqi
            if obj.max_aqi == 0
                obj.max_aqi = 255;
            end
        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end

        function increment_aqi(obj)


                if obj.current_aqi > obj.target_aqi  
            
                    new_aqi = obj.current_aqi-1;

                    obj.current_aqi = new_aqi;
                            
      
                elseif obj.current_aqi < obj.target_aqi
            
                    new_aqi = obj.current_aqi+1;


                    obj.current_aqi = new_aqi;
                            
                           
                elseif obj.current_aqi == obj.target_aqi
            
                   generate_aqi_target(obj);
                   
                end

        end

        function generate_aqi_target(obj)

             new_target_aqi = randi([0 obj.max_aqi]);
      
             obj.target_aqi = new_target_aqi;
        end

        function aqi = read_aqi(obj)

            aqi = obj.current_aqi;

        end 
    end

    
end