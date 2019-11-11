function [ sum1 ] = bcharya( q,q2 )
sum1=0;
for g=1:16;
   sum1=sum1+((q(1,g).*q2( 1,g)).^0.5);
end

end

