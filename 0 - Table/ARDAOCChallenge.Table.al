table 82024 ARD_AOCChallenge
{
    Caption = '_AOCChallenge';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "ARD_No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Record number';
            AutoIncrement = true;
        }
        field(2; ARD_Day; Integer)
        {
            Caption = 'Day';
            Tooltip = 'Advent of Code Day';
        }
        field(3; ARD_Result1; Integer)
        {
            Caption = 'Result 1';
            ToolTip = 'Result value 1';
        }
        field(4; ARD_Result2; Integer)
        {
            Caption = 'Result 2';
            ToolTip = 'Result Value 2';
        }
        field(5; ARD_Challenge1Text; Media)
        {
            Caption = 'Challenge 1 Text';
            ToolTip = 'Challenge input text 1';
        }
        field(6; ARD_Challenge2Text; Media)
        {
            Caption = 'Challenge 2 Text';
            ToolTip = 'Challenge input text 2';
        }
        field(7; ARD_SimpleData; Media)
        {
            Caption = 'Challenge Simple Example';
            ToolTip = 'The simple data set example for the challenge';
        }
        field(8; ARD_ChallengeData; Media)
        {
            Caption = 'Challenge Data';
            ToolTip = 'Challenge data set';
        }
    }
    keys
    {
        key(PK; "ARD_No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(brick; "ARD_No.", ARD_Day){}
        fieldgroup(dropdown; "ARD_No.", ARD_Day){}
    }
}
