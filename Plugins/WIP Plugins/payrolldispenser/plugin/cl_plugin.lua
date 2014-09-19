local PLUGIN = PLUGIN;

-- The amount of time passed in seconds.
-- One week: 604800
-- Half a week: 302400

Clockwork.config:AddToSystem("Payroll interval", "payroll_interval", "The time that it takes for the next payroll to be allowed to be recieved.", 0, 302400);