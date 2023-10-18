
function P1TurnOutput = P1Turn(P1,P2,P3,C)
%Generates a random number array between 1:3 depending on player chip count then determines where the cips will go depending on whatthe player rolled
%Sets player chip count and center pot

P1=3;
P2=3;
P3=3;
C=0;
rolls = P1;

switch rolls
   
    case 3
        dice=randi([1 6],1,3)

%unneccesssary block of code, because P1=P1 if it does not meet the
%following conditions after them (dice ~=  1,2, or 3)

        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
    
    case 2
       dice=randi([1 6],1,2)
       
        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
    
    case 1
        dice=randi([1 6],1,1)

        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
end
    P1TurnOutput = [P1,P2,P3,C];
end

function P2TurnOutput = P2Turn
%Sets player chip count and center pot

P1=P1TurnOutput(1);
P2=P1TurnOutput(2);
P3=P1TurnOutput(3);
C=P1TurnOutput(4);
rolls = P2;

switch rolls
   
    case 3
        dice=randi([1 6],1,3)

        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
    
    case 2
       dice=randi([1 6],1,2)

        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
    
    case 1
        dice=randi([1 6],1,1)

        if sum(dice==4)> 0
            locFour=sum(dice==4);
            numFour=sum(locFour);
            P1=P1-numFour;
            P3=P3+numFour;
        end
        if sum(dice==5)> 0
            locFive=sum(dice==5);
            numFive=sum(locFive);
            P1=P1-numFive;
            C=C+numFive;
        end
        if sum(dice==6)> 0
            locSix=sum(dice==6);
            numSix=sum(locSix);
            P1= P1-numSix;
            P2= P2+numSix;
        end
end
    P2TurnOutput=[P1,P2,P3,C]
end