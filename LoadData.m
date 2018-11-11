
function data=LoadData()
    dataset=load('spect.dat');
    data.x=dataset(:,2:end);
    data.t=dataset(:,1);
    
    data.nx=size(data.x,2);
    data.nt=size(data.t,2);
    data.nSample=size(data.x,1);
end