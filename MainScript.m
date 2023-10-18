
function Main()

player1Chips = 3;  
player2Chips = 3;
player3Chips = 3;
centerChips = 0;
%initial chip distribution

p1HasChips = player1Chips > 0;
p2HasChips = player2Chips > 0;
p3HasChips = player3Chips > 0;
hasChips = player1Chips + player2Chips + player3Chips;

rollOutput = [player1Chips,player2Chips,player3Chips,centerChips];

while hasChips > 1

    %TRIGGERED BY P1 BUTTON PRESS
    rollOutput = p1Roll(rollOutput(1),rollOutput(2),rollOutput(3),rollOutput(4))
    %Calls local p1 roll function

    p1HasChips = rollOutput(1) > 0;
    p2HasChips = rollOutput(2) > 0;
    p3HasChips = rollOutput(3) > 0;
    hasChips = p1HasChips + p2HasChips +p3HasChips;
    if hasChips == 1
        break
    end
    %checks to see if there is a winner

    %TRIGGERED BY P2 BUTTON PRESS    
    rollOutput = p2Roll(rollOutput(1),rollOutput(2),rollOutput(3),rollOutput(4))
    %Calls local p2 roll function

    p1HasChips = rollOutput(1) > 0;
    p2HasChips = rollOutput(2) > 0;
    p3HasChips = rollOutput(3) > 0;
    hasChips = p1HasChips + p2HasChips +p3HasChips;
    if hasChips == 1
        break
    end
    %checks to see if there is a winner

    %TRIGGERED BY P3 BUTTON PRESS
    rollOutput = p3Roll(rollOutput(1),rollOutput(2),rollOutput(3),rollOutput(4))
    %Calls local p3 roll function

    p1HasChips = rollOutput(1) > 0;
    p2HasChips = rollOutput(2) > 0;
    p3HasChips = rollOutput(3) > 0;
    hasChips = p1HasChips + p2HasChips +p3HasChips;
    if hasChips == 1
        break
    end
    %checks to see if there is a winner

end

player = 1;
for winnerWinnerChickenDinner = rollOutput(1:end)
    if winnerWinnerChickenDinner ~= 0
        break
    end
    player = player + 1;
end
fprintf("Player " + player + " wins!")
%prints the winner

end


function p1RollReturn = p1Roll(player1Chips,player2Chips,player3Chips,centerChips)
if player1Chips > 3
    player1Rolls = 3;
else
    player1Rolls = player1Chips;
end
    diceSetP1 = randi([1 6], 1, player1Rolls);
%determines number of dice and rolls for player 1

    for dice = diceSetP1(1:end)
        if dice==1 || dice==2 || dice==3
           player1Chips = player1Chips;
        end
        if dice==4
           player1Chips = player1Chips - 1;
           player3Chips = player3Chips + 1;
        end
        if dice==5
           player1Chips = player1Chips - 1;
           centerChips = centerChips + 1;
        end
        if dice==6
           player1Chips = player1Chips - 1;
           player2Chips = player2Chips + 1;
        end
    end
    p1RollReturn = [player1Chips,player2Chips,player3Chips,centerChips];
end
%Local function for player 1's roll


function p2RollReturn = p2Roll(player1Chips,player2Chips,player3Chips,centerChips)
if player2Chips > 3
    player2Rolls = 3;
else
    player2Rolls = player2Chips;
end
diceSetP2 = randi([1 6], 1, player2Rolls);
%determines number of dice and rolls for player 2

    for dice = diceSetP2(1:end)
        if dice==1 || dice==2 || dice==3
            player2Chips = player2Chips;
        end
        if dice==4
                player2Chips = player2Chips - 1;
                player1Chips = player1Chips + 1;
        end
        if dice==5
                player2Chips = player2Chips - 1;
                centerChips = centerChips + 1;
        end
        if dice==6
                player2Chips = player2Chips - 1;
                player3Chips = player3Chips + 1;
        end
    end
    p2RollReturn = [player1Chips,player2Chips,player3Chips,centerChips];
end
%Local function for player 2's roll

function p3RollReturn = p3Roll(player1Chips,player2Chips,player3Chips,centerChips)
if player3Chips > 3
    player3Rolls = 3;
else
    player3Rolls = player3Chips;
end
diceSetP3 = randi([1 6], 1, player3Rolls);
%determines number of dice and rolls for player 3

    for dice = diceSetP3(1:end)
        if dice==1 || dice==2 || dice==3
                player3Chips = player3Chips;
        end
        if dice==4
                player3Chips = player3Chips - 1;
                player2Chips = player2Chips + 1;
        end
        if dice==5
                player3Chips = player3Chips - 1;
                centerChips = centerChips + 1;
        end
        if dice==6
                player3Chips = player3Chips - 1;
                player1Chips = player1Chips + 1;
        end
    end
    p3RollReturn = [player1Chips,player2Chips,player3Chips,centerChips];
end
 
   

%Local function  for player 3's  roll
