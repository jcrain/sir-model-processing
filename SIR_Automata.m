% Set Parameter Values
N = 100;
beta = 0.01; %Probability of Infection
gamma = 0.01; %Probability of Recovery

% Define the Grid
x = rand(N,N) < 0.1;

x(20,20) = 1;

%Define the 1st order Moore neighborhood, i.e. the 8 nearest neighbors
neigh = [-1 -1; 0 -1; 1 -1; 1 0; 1 1; 0 1; -1 1; -1 0];

%Main loop, iterating the time variable, t
for t = 1:20
    % Iterate over all cells in the grid x, for index i = 1:N and j=1:N
    for i = 1:N
        for j=1:N
            for k=1:8
                i2 = i+neigh(k,1);
                j2 = j+neigh(k,2);
                % Check that the cell is within the grid boundaries
                if (i2 >= 1 && j2 >= 1 && i2 <= N && j2 <= N)
                    %Do Something
                end
            end
        end
    end
    figure, imshow(x)
end