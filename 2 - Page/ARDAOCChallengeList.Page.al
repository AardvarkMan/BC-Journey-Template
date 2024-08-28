page 82025 ARD_AOCChallengeList
{
    ApplicationArea = All;
    Caption = 'AOC Challenge List';
    PageType = List;
    SourceTable = ARD_AOCChallenge;
    UsageCategory = Lists;
    CardPageId = ARD_AOCChallengeCard;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("ARD_No."; Rec."ARD_No.")
                {
                }
                field(ARD_Day; Rec.ARD_Day)
                {
                }
            }
        }
    }
}
