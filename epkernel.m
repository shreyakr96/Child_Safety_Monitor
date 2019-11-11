function [o] = epkernel( i,j,cx,cy,width,height)

di= (( j-cx))./(width/2);
dj=((i-cy))./(height/2);
distance=((di.^2)+(dj.^2)).^0.5;
o= (3/4).*(1-((distance.^2)/5))/sqrt(5);

end

