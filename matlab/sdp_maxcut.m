function [Y, solvertime] = sdp_maxcut(W)
    % Approximation SDP solver of the Max-Cut problem.
    n = length(W);
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
end
