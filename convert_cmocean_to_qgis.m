function convert_cmocean_to_qgis

% CONVERT_CMOCEAN_TO_QGIS  Export cmocean colormaps for use in QGIS.
%
% CONVERT_CMOCEAN_TO_QGIS writes a file, cmocean.xml, containing the
% cmocean perceptually-uniform colormaps (http://matplotlib.org/cmocean/) 
% by Kristen Thyng in a format used by QGIS. Requires the cmocean Matlab 
% function, available from https://github.com/chadagreene/cmocean or 
% http://www.mathworks.com/matlabcentral/fileexchange/57773-cmocean-perceptually-uniform-colormaps
%
% See also cmocean.

% written by Povl Abrahamsen (epab@bas.ac.uk), British Antarctic Survey, June 2024
%
% This software is licensed under a MIT license. For more information please see the attached LICENSE file.

cmocean_names={...
... % SEQUENTIAL:
         'thermal',...
         'haline',...
         'solar',...
         'ice',...
         'gray',...
         'oxy',...
         'deep',...
         'dense',...
         'algae',...
         'matter',...
         'turbid',...
         'speed',...
         'amp',...
         'tempo',...
         'rain',...
... % DIVERGING: 
         'balance',...
         'delta',...
         'curl',...
         'diff',...
         'tarn',...
... % CONSTANT LIGHTNESS:
         'phase',...
... % OTHER:
         'topo'};

ncolors=256; % number of steps in our generated colormaps
interval=linspace(0,1,ncolors)'; % generate evenly spaced numbers for our "stops"
fid=fopen('cmocean.xml','wt'); % open our XML file
fprintf(fid,['<!DOCTYPE qgis_style>\n<qgis_style version="2">\n  <symbols/>\n',...
    '  <colorramps>\n']); % write general headers, up to the colorramps

for m=1:length(cmocean_names) % loop through the colormaps

    themap=cmocean(cmocean_names{m},ncolors); % load our colormap into Matlab, with ncolors steps
    fprintf(fid,['    <colorramp name="%s" tags="cmocean" type="gradient">\n',...
        '      <prop v="%.0f,%.0f,%.0f,255" k="color1"/>\n',... % our first color
        '      <prop v="%.0f,%.0f,%.0f,255" k="color2"/>\n',... % our last color
        '      <prop v="0" k="discrete"/>\n      <prop v="gradient" k="rampType"/>\n',...
        '      <prop v="'],cmocean_names{m},themap([1,end],:)'.*255); % write our first and last colors
    thedata=[interval,themap.*255];
    fprintf(fid,'%.3f;%.0f,%.0f,%.0f,255:',thedata(2:end-2,:)'); % write the intervening colors, up to the penultimate one
    fprintf(fid,['%.3f;%.0f,%.0f,%.0f,255" k="stops"/>\n',...
        '    </colorramp>\n'],thedata(end-1,:)); % write the penultimate color and end the colorramp tag

end

fprintf(fid,['  </colorramps>\n  <textformats/>\n  <labelsettings/>\n'...
    '  <legendpatchshapes/>\n  <symbols3d/>\n</qgis_style>\n']); % end our style file
fclose(fid); % close the file
