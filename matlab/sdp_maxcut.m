function [Y, obj, n, solvertime] = sdp_maxcut(filename)
    loadData = importdata("java/" + filename);
    n = loadData(1);
    % Weight matrix buildup.
    W = zeros(n,n);
    for i = 2:3:length(loadData)
        % +1 because generated graph numbers nodes starting from 0,
        % but indices of matlab matrices start at 1.
        W(loadData(i)+1,loadData(i+1)+1) = loadData(i+2);
        W(loadData(i+1)+1,loadData(i)+1) = loadData(i+2);
    end 

    % Approximation SDP solver of the Max-Cut problem.
    ops = sdpsettings('solver','sedumi');
    Y = sdpvar(n,n);

    % Objective function
    obj = 0;
    for idx2 = 1:n
        for idx1 = 1:idx2-1
            % SDP presupposes minimization problems,
            % whereas we are dealing with a maximization problem.
            % Of course, maximizing S is equivalent to minimizing -S.
            % Hence, we subtract instead of add.
            obj = obj - 1/2*W(idx1,idx2)*(1-Y(idx1,idx2));
        end
    end
    
    % Constraints
    cons = [Y >= 0];
    for idx = 1:n
        cons = [cons, Y(idx,idx) == 1];
    end

    sol = solvesdp(cons, obj, ops);
    solvertime = sol.solvertime;
    Y = double(Y);
    obj = -value(obj); % See above comment.
end

