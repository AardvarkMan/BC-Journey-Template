codeunit 82025 ARD_ResultsCalculatorRouter
{
    Procedure CalculateResult1(Rec: record ARD_AOCChallenge; RunExample: Boolean): Integer
    var
        Day1: CodeUnit ARD_AOC202301;
        Results: Integer;

    begin
        Results := 0;
        case Rec.ARD_Day of
        1:
            Results := Day1.CalculateResult1(Rec, RunExample);
        
        end;
        exit(Results);
    end;

    Procedure CalculateResult2(Rec: record ARD_AOCChallenge; RunExample: Boolean): Integer
        var
        Day1: CodeUnit ARD_AOC202301;
        Results: Integer;

    begin
        Results := 0;
        case Rec.ARD_Day of
        1:
            Results := Day1.CalculateResult2(Rec, RunExample);
        
        end;
        exit(Results);
    end;
}
