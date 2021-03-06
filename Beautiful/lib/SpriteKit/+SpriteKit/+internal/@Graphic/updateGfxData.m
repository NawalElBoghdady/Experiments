function updateGfxData(obj,X,Y,Z,C)
%UPDATEGFXDATA Update data used in Graphic.
% UPDATEGFXDATA(OBJ,X,Y,Z,C) updates the Graphics actual XData, YData,
% ZData, and CData, respectively. Validation is done by the Handle Graphics
% object.

% Copyright 2014 The MathWorks, Inc.

set(obj.GfxHandle,...
    'XData',X,...
    'YData',Y,...
    'ZData',Z,...
    'CData',C);