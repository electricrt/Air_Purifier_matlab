classdef system_state_class < handle
    %system state class Summary of this class goes here
    %
    % OFF > AUTO > MANUAL
    %  
    % WHILE AUTO MODE 
    %   CYCLE FAN LV 1-4
    %
    % WHILE MANUAL MODE
    %
    % CYCLE FAN LV 1-4
    %
    %   Detailed explanation goes here

    properties
        state_off = 0;
        state_auto = 1;
        state_manual = 2;
        state_sleep = 3;

        fanOFF = 0;
        fanL1 = 1;
        fanL2 = 2;
        fanL3 = 3;
        fanL4 = 4;


        system_mode = 0;
        fan_level = 0;

        aqi_reading = 0;
    end

    methods (Access = public)
        
        function obj = system_state_class
            %UNTITLED10 Construct an instance of this class
            %   Detailed explanation goes here
            obj.system_mode = obj.state_off;
            obj.fan_level = obj.fanOFF;
        end

        function powerbutton_press(obj)
            %  Manual Button Press
            %   
            if obj.system_mode == obj.state_off

               obj.system_mode = obj.state_auto;

            elseif obj.system_mode == obj.state_auto

                obj.system_mode = obj.state_manual;
                    
            elseif obj.system_mode == obj.state_manual
                
                obj.manual_mode_press;

            elseif obj.system_mode == obj.state_sleep

                obj.system_mode = obj.state_off;

            end

        end

        function manual_mode_press(obj)
                
            if obj.fan_level == obj.fanOFF
            
                obj.fan_level = obj.fanL1;
            
            elseif obj.fan_level < obj.fanL4

                    obj.fan_level = obj.fan_level + 1;

            elseif obj.fan_level == obj.fanL4

                    % turn system off
                    obj.fan_level = obj.fanOFF;

                    obj.system_mode = obj.state_sleep;

            
            end


        end


        function state_auto_mainloop(obj)

            if obj.aqi_reading < 50
                
                obj.fan_level = obj.fanL1;
            
            elseif obj.aqi_reading > 50 & < 100

                obj.fan_level = obj.fanL2;

            elseif obj.aqi_reading > 100 & < 150

                obj.fan_level = obj.fanL3;

            elseif obj.aqi_reading > 150

                obj.fan_level = obj.fanL4;

            end
        
           
            

        end

        function systemMode_main(obj)
            % system main loop
            if obj.system_mode == obj.state_off

            elseif obj.system_mode == obj.state_auto
                % automatically read aqi_reading and cycle thru levels
                state_auto_mainloop;

            elseif obj.system_mode == obj.state_manual

            elseif obj.system_mode == obj.state_sleep

            end



        end
    end

    methods (Access = private)

    end 
end