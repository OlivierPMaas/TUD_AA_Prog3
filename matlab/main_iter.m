fid = fopen('test.csv', 'w');
fprintf(fid, 'n,p,maxedgeweight,lowbound,cutweight,sdpweight,time, trials\n');
files = dir('graphs')';
files = files(3:end); % Ignore "." and "..".
for file = files
    f=file.name;
    fprintf(strcat('Working on ', f));
    tic;
    [S1, S2, lowbound, weight, sdpweight, trials] = main(f);
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
    
    fprintf(fid, strcat(n,',',p,',',maxweight,',',num2str(lowbound),',',num2str(weight),',',num2str(sdpweight,5),',',num2str(time,5),',',num2str(trials,2),'\n'));
    fprintf(strcat('Done with ', f));
end
fclose(fid);
