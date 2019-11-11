function [ ] = trackingrect( cx,cy,width,height,frame2)
frame3=frame2;
box = insertShape(frame3,'circle',[cx-width/2 cy-height/2 35],'LineWidth',3);
imshow(box);
end

