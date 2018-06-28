x=0:0.1:10;
m1=trimf(x,[0 1 3 8]);
m2=trapmf(x,[0 3 7 10]);
m4=max(0.5*m2,0.7*m1);
plot(x,m4,'linewidth',1);
set(gca,'YLim',[-1 1],'YTick',[0 .5 1]);
c=1;
while(c==1)
    
disp(sprintf('\n********** Methods for Defuzzification **********\n1)Centroid method\n2)Bi-sector method\n3)Mean-of-Maximum methods\n4)Smallest-of-Maximum method\n5)Largest-of-Maximum method\n '));
a=input('Select any method(1-5): ');
if(a==1)
    area=sum(m4);
    if(area==0)
        disp('Error in the input');
    else
        x1=sum(m4.*x)/area;
    end
    h1 = line([x1 x1],[-0.2 1.2],'Color','k');
    t1 = text(x1,-0.2,'centroid','FontWeight','bold');

elseif(a==2)
    area=sum(m4);
    if(area==0)
        disp('Error in the input');
    else
        tmp = 0;
        for k=1:length(x)
                tmp = tmp + m4(k);
                if tmp >= area/2,
                        break;
                end
        end
        x2=x(k);
    end
    h2 = line([x2 x2],[-0.4 1.2],'Color','k');
    t2 = text(x2,-0.4,'bisector','FontWeight','bold');
elseif(a==3)
    x3 = mean(x(find(m4==max(m4))));
    h3 = line([x3 x3],[-0.7 1.2],'Color','k');
    t3 = text(x3,-0.7,'MOM','FontWeight','bold');
elseif(a==4)
    tmp = x(find(m4 == max(m4)));
    [junk, which] = min(abs(tmp));
    x4 = tmp(which);
    h4 = line([x4 x4],[-0.7 1.2],'Color','k');
    t4 = text(x4,-0.7,'SOM','FontWeight','bold');
elseif(a==5)
    tmp = x(find(m4 == max(m4)));
    [junk, which] = max(abs(tmp));
    x5 = tmp(which);
    h5 = line([x5 x5],[-0.7 1.2],'Color','k');
    t5 = text(x5,-0.7,'LOM','FontWeight','bold');
end
cn=input('Do you want to continue?(1/0)');
if(cn==0)
    c=0;
end
end
