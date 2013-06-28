% this funtion converts all images in a folder from one format to another

function ZConvertAllImages(formatA, formatB)

Current = pwd;

folder=uigetdir;
fprintf('=====Converting all images in folder %s \n ', folder)
fprintf('=====From type %s to type %s \n' , formatA, formatB)

cd (folder); 
d=dir(['*.',formatA]);
length_d = length(d);
if(length_d == 0)
    error('couldnt find any files of type %s \n', formatA);
% elseif (length_d <= 2)
%     error('no files were found in directory \n');
 end

for i = 1:length_d
    fname = d(i).name;
    [pathstr, name, ext, versn] = fileparts(fname); %to remove the extention
    saveas(openfig(fname),name,formatB);
    close 
    fprintf('Converted file %s to %s.%s \n' , fname, name,formatB)
end

cd(Current); 