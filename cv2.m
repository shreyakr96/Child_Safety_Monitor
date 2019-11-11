clc;

%implay('pray.mp4');
vr = VideoReader('kid.mp4');
%{
vp = vision.VideoPlayer;
while ~isDone(vr)
  videoFrame = vr();
  vp(videoFrame);
end
%}

frame1 = read(vr,1);
[cx,cy,width,height,frame1g]=initial2(frame1);
q=quantpdf1( cx,cy,width,height,frame1g );
%trackingrect(cx,cy,width,height,frame1);
%{
frame2= read(vr,2);
frame2g = rgb2gray(frame2);
q2=quantpdf( cx,cy,width,height,frame2g );
sum1=bcharya(q,q2);
disp("d");
disp(sum1);
[ ncenter,weight ] = meanshift( cx,cy,width,height,frame2g,q);
disp(cx);
disp(cy);
disp(ncenter);
ncenter=ceil(ncenter);
q3=quantpdf( ncenter(1,1),ncenter(1,2),width,height,frame2g );
sum2=bcharya(q,q3);
disp("d1");
disp(sum2);
%}

%{

%}

sum1=0.1;
for m=5:150
    frame2=read(vr,m);
    frame2g=rgb2gray(frame2);
    sum1=0;
    while(sum1<0.86)
        [ncenter,weight]=meanshift2(cx,cy,width,height,frame2g,q);
        cx=ncenter(1,1);
        cy=ncenter(1,2);%check
        q2=quantpdf1(cx,cy,width,height,frame2g);
        sum1=bcharya(q,q2);
    end
    trackingrect( cx,cy,width,height,frame2)
end

