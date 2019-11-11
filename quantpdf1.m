function [ q ] = quantpdf( cx,cy,width,height,framexy )
a=cx-ceil(width/2);
b=cy-ceil(height/2);
a1=cx+ ceil(width/2);
b1=cy+ ceil(height/2);
q=zeros(1,16);
if a1>352
    a1=352;
end

if b1>240
    b1=240;
end
if a<1
    a=1;
end
if b<1
    b=1;
end
w=0;
for i=b:b1
    for j= a:a1
        %if framexy(i,j)~=0
            k=0;
            
           while(k<256)
                if framexy(i,j)>=k && framexy(i,j)<(k+16)
                    o=epkernel( i,j,cx,cy,width,height);
                    %disp(o);
                w=k./16;
                    q(1,w+1)=o+q(1,w+1);
                    k=256;
                end
                    k=k+16;
            end
       %end
    end
end
ctr=0;
for j=1:16
    ctr=ctr+q(1,j);
end
q=q./ctr;%q is the pdf for the elliptical object selected
%disp(q);
%disp(sum(q));
end
