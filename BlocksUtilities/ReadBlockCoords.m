function b = ReadBlockCoords(direc)
% READBLOCKCOORDS	 Reads a Block.coords file.
%   B = READBLOCKCOORDS(DIREC) reads the Block.coords file from the 
%   results folder DIREC and returns coordinates to the cell array
%   B.  Each cell of B contains a 2-column array giving the ordered
%   [lon. lat.] of the block coordinates.
%

% Read the file
data = textread([direc filesep 'Block.coords'],'','delimiter','>','emptyvalue', NaN);

% Find NaNs and split
sep = find(isnan(data(:, 1))); sep(end) = [];
beg = [1; sep+1];
fin = [sep-1; length(data)];

b = cell(length(beg), 1);
for i = 1:length(beg)
   b{i} = data(beg(i):fin(i), :);
end
