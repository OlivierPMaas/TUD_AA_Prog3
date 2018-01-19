fid = fopen('test.csv', 'w');
fprintf(fid, 'n,p,maxweight,weight,sdpweight,time\n');
files = dir('graphs')';
files = files(3:end); % Ignore "." and "..".
for file = files
    f=file.name;
    tic;
    [S1, S2, weight, sdpweight] = main(f);
    time = toc;
    x=regexp(f, '\d*');
    y=regexp(f, '_');
    n = f(x(1):y(2)-1);
    p = f(x(2):y(3)-1);
    % Note: p is either 0.5 or 1.
    if p == '05'
        p = '0.5';
    else
        p = '1';
    end
    maxweight = f(x(3):y(4)-1);
    
    fprintf(fid, strcat(n,',',p,',',maxweight,',',num2str(weight),',',num2str(sdpweight,5),',',num2str(time,5),'\n'));
end
fclose(fid);
