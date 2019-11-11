function [ cx,cy,width,height,frame1g ] = initial1( frame1 )
frame1g = rgb2gray(frame1);

imshow(frame1);
h=imellipse;
position = wait(h);
pos = getPosition(h);
%disp(pos);
mask1 = createMask(h);
mask1= im2uint8(mask1);
for i=1:240
    
   for j=1:352
       
       if(mask1(i,j)==255)
           mask1(i,j)=1;
       end
   end
end
frame1g =frame1g.*mask1;
imshow(frame1g);
cx=ceil(pos(1,1)+(pos(1,3)./2));
cy=ceil(pos(1,2)+(pos(1,4)./2));
width=pos(1,3);
height=pos(1,4);

end

