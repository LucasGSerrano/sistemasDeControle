clear
clf
%limites
ax = axes('XLim',[-2 2],'YLim',[-2 10],'ZLim',[-1.5 1.5]);
view(3);
grid on;
axis equal;

[xc, yc, zc] = cylinder([0.1 0.0]);
[x, y, z ] = cylinder([0.2 0.2]);

h(1) = surface (xc , zc ,-yc, 'FaceColor', 'red' );
h(2) = surface (z, y, 0.5*x, 'FaceColor', 'blue' );
h(3) = surface (-z , y, 0.5*x, 'FaceColor', 'yellow');
h(4) = surface (x, -1.5*z, 0.5*y, 'FaceColor', 'red');
h(5) = surface (xc, (1.5*yc)-1.3, z, 'FaceColor', 'red');


% Create group object and parent surfaces
t = hgtransform('Parent',ax);
set(h,'Parent',t)

set(gcf,'Renderer','opengl')

drawnow

% lon = [0 1 2 3 4   5 6  7    8 9 10];
% lat = [0 1 1 1 0   0 0 -1  -1 -1 -1];
% bea = [0 -0.5 0 0 0.5 0 0 0.5 0 0 0];

sheet = xlsread('DadosTeste.xlsx');
len = length(sheet(:,1));
lat = sheet(2:len,1);
lon = sheet(2:len,2);
bea = sheet(2:len,3);

lat = lat';
lon = lon';
bea = bea';

for i = 1:numel(lat)
    
    trans = makehgtform('translate',[lat(i) lon(i) 0]);
    rotz = makehgtform('zrotate',bea(i));
    set(t,'Matrix',trans*rotz);
    pause(1);
end