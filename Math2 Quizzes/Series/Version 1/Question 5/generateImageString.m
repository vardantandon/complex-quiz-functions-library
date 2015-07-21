%Matlab plot to string convertion code, produces an xml code string output.
%plot - plot: The plot to convert
%imageNameStr - string: name of image file
%This code takes an image and encodes it to a base64 string that can be
%used directly in the xml code.
%
%Last Updated: 26/06/2015
%Created By: Avinash Javaji under supervision of Dr. Pilar Garcia Souto

function finalString = generateImageString(plot, imageNameStr)
    file=strcat('temp-image.jpg');
    saveas(plot, file);
    encodedImageString = base64file(file);
    delete(file);
    finalString = strcat('<file name="', imageNameStr,...
        '" path="/" encoding="base64">', encodedImageString, '</file>');
end

%SUBFUNCTION
%Returns the file's contents as a base64-encoded string
function base64string = base64file(file)
    fid = fopen(file,'rb');
    bytes = fread(fid);
    fclose(fid);
    encoder = org.apache.commons.codec.binary.Base64;
    base64string = char(encoder.encode(bytes))';
end