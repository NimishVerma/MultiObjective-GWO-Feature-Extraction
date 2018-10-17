%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPML122
% Project Title: Multi-Objective Feature selection using NSGA-II
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%
function [z, out]=FeatureSelectionCost(s,nf,data)
    % Read Data Elements
    x=data.x;
    t=data.t;
    
   [~, q]=sort(s);
    
    % Selected Features
    S=q(1:nf);
    % Ratio of Selected Features
    rf=nf/numel(q);
    
    % Selecting Features
    xs=x(:,S);
    
    % Weights of Train and Test Errors
    wTrain=0.8;
    wTest=1-wTrain;
    % Number of Runs
    nRun=5;
    EE=zeros(1,nRun);
    for r=1:nRun
        % Create and Train ANN
        results=CreateAndTrainANN(xs,t);
        % Calculate Overall Error
        EE(r) = wTrain*results.TrainData.E + wTest*results.TestData.E;
    end
    
    E=mean(EE);
    if isinf(E)
       E=100;
    end
    
    % Calculate Final Cost
    z=[nf
       E];
    % Set Outputs
    out.S=S;
    out.nf=nf;
    out.rf=rf;
    out.E=E;
    out.z=z;
    %out.net=results.net;
    %out.Data=results.Data;
    %out.TrainData=results.TrainData;
    %out.TestData=results.TestData;
    
end