clear all
clc
close all



%%% Change the folder 
Data_dir='E:\Abo milad random forrest\newdata\onesubject\';

Files = dir(Data_dir);


Files=Files(3:22);


Files = {Files.name};




 for ii=1:2  : length(Files)
     
fileID{1,ii} = horzcat(Data_dir,char(Files{1, ii} )); 


raw_csi{1,ii}=load(fileID{1,ii});

raw_csi{1,ii}=raw_csi{1,ii}.CSI.Data;

exercise{1,ii}=reshape(raw_csi{1,ii},64,[]);


% figure
% plot(raw_csi_final{1,ii})
% title(Files{ii});
% 
% 
% time_history{1,ii}=raw_csi_final{1,ii}';
% 
% figure
% plot(time_history{1,ii})
% title(Files{ii});

 end
 
 
 
 
 empties = find(cellfun(@isempty,exercise)); % identify the empty cells
exercise(empties) = [];                      % remove the empty cells





BaseName='newdata_1subject_';
for k=1        :length(exercise)
Activity_1_Exercise=[BaseName,num2str(k)]


csvwrite([Activity_1_Exercise '.csv'],  exercise{1, k}  );    %% Change the name of Activity # here for instance Activity_2_Walking or Activity_3_Waving and so on

end
 
