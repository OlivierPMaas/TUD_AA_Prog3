function [r] = random_vector(n)
    % Generates a random vector r of length _n_, such that ||r|| = 1.
    m = 1;
    mu = 0;
    sigma = 1;
    R = normrnd(mu,sigma,n,m);
    factor = 1/norm(R);
    r = R * factor;
end

