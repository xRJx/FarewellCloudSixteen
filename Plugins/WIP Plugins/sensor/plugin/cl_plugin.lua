local PLUGIN = PLUGIN;

openAura.schema.lastHeartbeatAmount = 0;
openAura.schema.nextHeartbeatCheck = 0;
openAura.schema.heartbeatGradient = Material("gui/gradient_down");
openAura.schema.heartbeatOverlay = Material("effects/combine_binocoverlay");
openAura.schema.heartbeatPoints = {};
openAura.schema.heartbeatPoint = Material("sprites/glow04_noz");