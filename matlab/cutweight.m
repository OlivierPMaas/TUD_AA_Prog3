function [weight] = cutweight(S1, S2, filename)
    % Calculates the weight achieved by a given cut.
    loadData = importdata("java/" + filename);
    weight = 0;
    for i = 2:3:length(loadData)
        % +1 because Matlab starts counting at 1 whereas our graphs' nodes
        % number from 0 to n-1.
        if (ismember(loadData(i)+1,S1) && ismember(loadData(i+1)+1,S2))|(ismember(loadData(i)+1,S2) && ismember(loadData(i+1)+1,S1))
            weight = weight + loadData(i+2);
        end
    end
end

