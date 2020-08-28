Fs=128;
data1=audioDatastore('D:\deep learning\irmas data set\IRMAS-TrainingData\cel','IncludeSubFolders',true,'LabelSource','foldernames','ReadFcn',@audioread,'FileExtensions','.wav');
data=readall(data1);

for i=1:1
    
s=size(data{i,1});
fb = cwtfilterbank('SignalLength',s(1),...
    'SamplingFrequency',Fs,...
    'VoicesPerOctave',12);
sig = data{i,1}(1:s(1),1);
[cfs,frq] = wt(fb,sig);
t = (0:s(1)-1)/Fs;figure;pcolor(t,frq,abs(cfs))
set(gca,'yscale','log');shading interp;axis tight;
title('Scalogram');xlabel('Time (s)');ylabel('Frequency (Hz)')
fileName = sprintf('%dcello.hdf',i); 
saveas(gcf,fileName)
end