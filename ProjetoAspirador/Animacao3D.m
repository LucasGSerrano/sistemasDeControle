clear
clf
%limites
ax = axes('XLim',[-2 2],'YLim',[-2 10],'ZLim',[-1.5 1.5]);
view(3);
grid on;
axis equal;

[xc, yc, zc] = cylinder([0.1 0.0]);
[x, y, z ] = cylinder([0.2 0.2]);
[xw,yw,zw] = cylinder([-0.2 -0.2]);

[a,b,c] = sphere (2^4-1);
a = a(8:end,:);
b = b(8:end,:);
c = c(8:end,:);
h(1) = surface(a,b,c + 1, 'FaceColor', 'blue');
h(2) = surface(5*x, 5*y, z);
h(3) = surface(0.1*z - 1.1,1.5*x,1.5*y, 'FaceColor', 'black');
h(4) = surface(0.1*z + 1,1.5*x,1.5*y, 'FaceColor', 'black');

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