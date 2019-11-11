function [ ncenter,weight] = meanshift( cx,cy,width,height,frame2g,q)
q2=quantpdf1( cx,cy,width,height,frame2g );
a=cx-ceil(width/2);
b=cy-ceil(height/2);
a1=cx+ ceil(width/2);
b1=cy+ ceil(height/2);
height=ceil(height);
width=ceil(width);
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
weight=zeros(height,width);
for i=b:b1
    for j= a:a1
        %if frame2g(i,j)~=0
            k=0;
            
           while(k<256)
                if frame2g(i,j)>=k && frame2g(i,j)<(k+16)
                                    w=k./16;
                    weight(i,j)=((q(1,w+1)./q2(1,w+1))^0.5);
                    k=256;
                end
                    k=k+16;
            end
        %end
    end
end
meanx=0;
meany=0;
sumx=0;
sumy=0;
sumw=0;
for i=b:b1
    for j= a:a1
        meanx=weight(i,j).*i;
        meany=weight(i,j).*j;
        sumx=sumx+meanx;
        sumy=sumy+meany;
        sumw=sumw+weight(i,j);
    end
end

sumx=sumx./sumw;
sumy=sumy./sumw;
ncenter=[sumy,sumx];
ncenter=ceil(ncenter);
end

