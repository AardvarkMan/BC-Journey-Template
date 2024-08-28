codeunit 82024 ARD_ResultsCalculatorRouter
{
    TableNo = ARD_AOCChallenge;

    trigger OnRun() begin
    end;

    Procedure CalculateResult1(Rec: record ARD_AOCChallenge; RunExample: Boolean)
    begin

    end;

    Procedure CalculateResult2(Rec: record ARD_AOCChallenge; RunExample: Boolean)
    begin

    end;

    //AOC 2023 Day 1
    Procedure Calc2023011(Input:Text):Integer
    var
        Inputs: list of [Text];
        Result: Integer;
        NewLineCharacter: Char;
    begin
        Result := 0;
        NewLineCharacter := 13;

        Inputs := Input.Split(NewLineCharacter);

        exit(Result);
    end;
}
