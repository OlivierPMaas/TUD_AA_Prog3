function [Y, solvertime] = sdp_maxcut(W)
    % Approximation SDP solver of the Max-Cut problem.
    n = length(W);
    ops = sdpsettings('solver','sedumi');
    Y = sdpvar(n,n);

    obj = 0;
    for idx2 = 1:n
        for idx1 = 1:idx2-1
            obj = obj + 1/2*W(idx1,idx2)*(1-Y(idx1,idx2));
        end
    end
    cons = [Y >= 0];
    for idx = 1:n
        cons = [cons, Y(idx,idx) == 1];
    end

    sol = solvesdp(cons, obj, ops);
    solvertime = sol.solvertime;
    Y = double(Y);
end

