%In case of file corruption
% variable properties

 %Ensures variable updates
  properties (Access = public)
        player1Chips;
        player2Chips;
        player3Chips;
        centerChips;
        turnNum;
        rollOutput;
        p1HasChips;
        p2HasChips;
        p3HasChips;
        hasChips;
        player1Rolls;
        player2Rolls;
        player3Rolls;
        diceSetP1;
        diceSetP2;
        diceSetP3;
        end

%start up function

     %Initial distribution
            app.player1Chips = 3; 
            app.player2Chips = 3;
            app.player3Chips = 3;
            app.centerChips = 0;
            app.turnNum = 0;
            app.P1Score.Data = app.player1Chips;
            app.P2Score.Data = app.player2Chips;
            app.P3Score.Data = app.player3Chips;
            app.CScore.Data = app.centerChips;
            app.ContinueGameButton.Visible = "off";
            app.P1Win.Visible ="off";
            app.P2Win.Visible ="off";
            app.P3Win.Visible ="off";

%player one button press

            [a, Fs]= audioread('DiceRoll.mp3');
            diceSound = audioplayer(a, Fs);
            play(diceSound)

            %Checks for a winner yet
            app.p1HasChips = app.player1Chips > 0;
            app.p2HasChips = app.player2Chips > 0;
            app.p3HasChips = app.player3Chips > 0;
            app.hasChips = app.p1HasChips + app.p2HasChips + app.p3HasChips;

            %Determines number of player rolls
            if app.player1Chips > 3
            app.player1Rolls = 3;
            else
            app.player1Rolls = app.player1Chips;
            end
            app.diceSetP1 = randi([1 6], 1, app.player1Rolls);

            %Rolls if there is no winner yet
            %NEED TO ADD: Else, display player wins
            if app.hasChips > 1
                for dice = app.diceSetP1(1:end)
                    if dice==1 || dice==2 || dice==3
                    app.player1Chips = app.player1Chips;
                    end
                    if dice==4
                    app.player1Chips = app.player1Chips - 1;
                    app.player3Chips = app.player3Chips + 1;
                    end
                    if dice==5
                    app.player1Chips = app.player1Chips - 1;
                    app.centerChips = app.centerChips + 1;
                    end
                    if dice==6
                    app.player1Chips = app.player1Chips - 1;
                    app.player2Chips = app.player2Chips + 1;
                    end
                end
              

                displayString = "";
                for item = app.diceSetP1(1:end)
                    displayString = append(displayString, "[", string(item), "]");
                end
                
                app.rollOutput = [app.player1Chips,app.player2Chips,app.player3Chips,app.centerChips];
                app.turnNum = app.turnNum + 1;
                app.MainTable.Data = [app.MainTable.Data; (app.turnNum),displayString];
                app.P1Score.Data = app.rollOutput(1);
                app.P2Score.Data = app.rollOutput(2);
                app.P3Score.Data = app.rollOutput(3);
                app.CScore.Data = app.rollOutput(4);
              
            end
        
       %Checks if there is a winner and displays winner banner  
       player12Total = app.player1Chips + app.player2Chips;
       player23Total = app.player3Chips + app.player2Chips;
       player13Total = app.player1Chips + app.player3Chips;
        
        if player12Total <= 0;
            app.P3Win.Visible = "on";
        elseif player23Total <= 0;
            app.P1Win.Visible ="on";
        elseif player13Total <= 0;
            app.P2Win.Visible ="on";
        end 

       
%player 2/3 button press


            %Checks for a winner yet
            app.p1HasChips = app.player1Chips > 0;
            app.p2HasChips = app.player2Chips > 0;
            app.p3HasChips = app.player3Chips > 0;
            app.hasChips = app.p1HasChips + app.p2HasChips + app.p3HasChips;

            %Determines number of player rolls
            if app.player2Chips > 3
            app.player2Rolls = 3;
            else
            app.player2Rolls = app.player2Chips;
            end
            app.diceSetP2 = randi([1 6], 1, app.player2Rolls);

            %Rolls if there is no winner yet
            %NEED TO ADD: Else, display player wins
            if app.hasChips > 1
                for dice = app.diceSetP2(1:end)
                    if dice==1 || dice==2 || dice==3
                    app.player2Chips = app.player2Chips;
                    end
                    if dice==4
                    app.player2Chips = app.player2Chips - 1;
                    app.player1Chips = app.player1Chips + 1;
                    end
                    if dice==5
                    app.player2Chips = app.player2Chips - 1;
                    app.centerChips = app.centerChips + 1;
                    end
                    if dice==6
                    app.player2Chips = app.player2Chips - 1;
                    app.player3Chips = app.player3Chips + 1;
                    end
            
                end

                displayString = "";
                for item = app.diceSetP2(1:end)
                    displayString = append(displayString, "[", string(item), "]");
                end
                
                app.rollOutput = [app.player1Chips,app.player2Chips,app.player3Chips,app.centerChips];
                app.turnNum = app.turnNum + 1;
                app.MainTable.Data = [app.MainTable.Data; (app.turnNum),displayString];
                app.P1Score.Data = app.rollOutput(1);
                app.P2Score.Data = app.rollOutput(2);
                app.P3Score.Data = app.rollOutput(3);
                app.CScore.Data = app.rollOutput(4);
            end

       %Checks if there is a winner and displays winner banner  
       player12Total = app.player1Chips + app.player2Chips;
       player23Total = app.player3Chips + app.player2Chips;
       player13Total = app.player1Chips + app.player3Chips;
        
        if player12Total <= 0;
            app.P3Win.Visible = "on";
        elseif player23Total <= 0;
            app.P1Win.Visible ="on";
        elseif player13Total <= 0;
            app.P2Win.Visible ="on";
        end 

            %Checks for a winner yet
            app.p1HasChips = app.player1Chips > 0;
            app.p2HasChips = app.player2Chips > 0;
            app.p3HasChips = app.player3Chips > 0;
            app.hasChips = app.p1HasChips + app.p2HasChips + app.p3HasChips;

            %Determines number of player rolls
            if app.player3Chips > 3
            app.player3Rolls = 3;
            else
            app.player3Rolls = app.player3Chips;
            end
            app.diceSetP3 = randi([1 6], 1, app.player3Rolls);

            %Rolls if there is no winner yet
            %NEED TO ADD: Else, display player wins
            if app.hasChips > 1
                for dice = app.diceSetP3(1:end)
                    if dice==1 || dice==2 || dice==3
                    app.player3Chips = app.player3Chips;
                    end
                    if dice==4
                    app.player3Chips = app.player3Chips - 1;
                    app.player2Chips = app.player2Chips + 1;
                    end
                    if dice==5
                    app.player3Chips = app.player3Chips - 1;
                    app.centerChips = app.centerChips + 1;
                    end
                    if dice==6
                    app.player3Chips = app.player3Chips - 1;
                    app.player1Chips = app.player1Chips + 1;
                    end
                end

                displayString = "";
                for item = app.diceSetP3(1:end)
                    displayString = append(displayString, "[", string(item), "]");
                end
                
                app.rollOutput = [app.player1Chips,app.player2Chips,app.player3Chips,app.centerChips];
                app.turnNum = app.turnNum + 1;
                app.MainTable.Data = [app.MainTable.Data; (app.turnNum),displayString];
                app.P1Score.Data = app.rollOutput(1);
                app.P2Score.Data = app.rollOutput(2);
                app.P3Score.Data = app.rollOutput(3);
                app.CScore.Data = app.rollOutput(4);
            end

       %Checks if there is a winner and displays winner banner  
       player12Total = app.player1Chips + app.player2Chips;
       player23Total = app.player3Chips + app.player2Chips;
       player13Total = app.player1Chips + app.player3Chips;
        
        if player12Total <= 0;
            app.P3Win.Visible = "on";
        elseif player23Total <= 0;
            app.P1Win.Visible ="on";
        elseif player13Total <= 0;
            app.P2Win.Visible ="on";
        end 



        