
function data=LoadData()
    dataset=load('ilpd.dat');
    data.x=dataset(:,1:end-1);
    data.t=dataset(:,end);
    
    data.nx=size(data.x,2);
    data.nt=size(data.t,2);
    data.nSample=size(data.x,1);
end