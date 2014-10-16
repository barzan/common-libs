function recursiveRemovePath(topDir, varargin)

%topDir = '.';
queue = {topDir};

while ~isempty(queue)
    curDir = queue{1};
    queue(1) = [];
    
    if ~isdir(curDir) || ~isempty(findstr('+', curDir))
        continue;
    end
    
    %fprintf(1, '%s\n', curDir);
    rmpath(curDir);
    newDirs = dir(curDir);
    for i=1:length(newDirs)
        d = newDirs(i).name;
        if strcmp(d, '.') || strcmp(d, '..')
            continue;
        end
        dirToAdd = [curDir '/' d];
        queue = [queue dirToAdd];
    end
end

    disp(['removed ' topDir ' from matlab''s path']);
end
