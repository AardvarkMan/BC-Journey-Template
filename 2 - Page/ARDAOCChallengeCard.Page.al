page 82024 ARD_AOCChallengeCard
{
    ApplicationArea = All;
    Caption = 'AOC Challenge Card';
    PageType = Card;
    SourceTable = ARD_AOCChallenge;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("ARD_No."; Rec."ARD_No.")
                {
                }
                field(ARD_Day; Rec.ARD_Day)
                {
                }
                field(ARD_Example; ChallengeExample)
                {
                    Caption = 'Example Data';
                    ToolTip = 'Example data set';
                    MultiLine = true;
                    
                    trigger OnValidate()
                    var
                        TempBLOB: Codeunit "Temp Blob";
                        VarOutStream: OutStream;
                        BlobInStream: InStream;
                    begin
                        if Challenge1Body <> '' then begin
                            TempBLOB.CreateOutStream(VarOutStream);
                            VarOutStream.WriteText(ChallengeExample);
                            TempBLOB.CreateInStream(BlobInStream);
                            Rec.ARD_SimpleData.ImportStream(BlobInStream, 'Challenge Example', 'plain/text');
                        end;
                    end;
                }

                field(ARd_Data; ChallengeData)
                {
                    Caption = 'Challenge Data';
                    ToolTip = 'Challenge data set';
                    MultiLine = true;

                    trigger OnValidate()
                    var
                        TempBLOB: Codeunit "Temp Blob";
                        VarOutStream: OutStream;
                        BlobInStream: InStream;
                    begin
                        if Challenge1Body <> '' then begin
                            TempBLOB.CreateOutStream(VarOutStream);
                            VarOutStream.WriteText(ChallengeData);
                            TempBLOB.CreateInStream(BlobInStream);
                            Rec.ARD_ChallengeData.ImportStream(BlobInStream, 'Challenge Data', 'plain/text');
                        end;
                    end;
                }

                field(RunSampleData;RunSampleData)
                {
                    Caption = 'Run Example Data';
                    ToolTip = 'Run only the Example Data for a test run';
                }
            }

            group(Challenge1)
            {
                Caption = 'Challenge 1';
                field(ARD_Challenge1Text; Challenge1Body)
                {
                    Caption = 'Challenge 1';
                    ToolTip = 'Challenge 1 Body Text';
                    MultiLine = true;
                    trigger OnValidate()
                    var
                        TempBLOB: Codeunit "Temp Blob";
                        VarOutStream: OutStream;
                        BlobInStream: InStream;
                    begin
                        if Challenge1Body <> '' then begin
                            TempBLOB.CreateOutStream(VarOutStream);
                            VarOutStream.WriteText(Challenge1Body);
                            TempBLOB.CreateInStream(BlobInStream);
                            Rec.ARD_Challenge1Text.ImportStream(BlobInStream, 'Challenge 1 Text', 'plain/text');
                        end;
                    end;
                }
                field(ARD_Result1; Rec.ARD_Result1)
                {
                }
            }
            group(Challenge2)
            {
                Caption = 'Challenge 2';
                field(ARD_Challenge2Text; Challenge2Body)
                {
                    Caption = 'Challenge 2';
                    ToolTip = 'Challenge 2 Body Text';
                    MultiLine = true;

                    trigger OnValidate()
                    var
                        TempBLOB: Codeunit "Temp Blob";
                        VarOutStream: OutStream;
                        BlobInStream: InStream;
                    begin
                        if Challenge2Body <> '' then begin
                            TempBLOB.CreateOutStream(VarOutStream);
                            VarOutStream.WriteText(Challenge2Body);
                            TempBLOB.CreateInStream(BlobInStream);
                            Rec.ARD_Challenge2Text.ImportStream(BlobInStream, 'Challenge 2 Text', 'plain/text');
                        end;
                    end;
                }
                field(ARD_Result2; Rec.ARD_Result2)
                {
                }
            }
        }
        
    }
    
    actions
    {
        area(Processing)
        {
            action(CalculateResult1)
            {
                Caption = 'Calculate Result 1';
                ToolTip = 'Calculate Result 1';
                Image = Calculate;
                trigger OnAction()
                var
                    AOCCalculator: Codeunit ARD_ResultsCalculatorRouter;
                begin
                    AOCCalculator.CalculateResult1(Rec, RunSampleData);
                end;
            }
            action(CalculateResult2)
            {
                Caption = 'Calculate Result 2';
                ToolTip = 'Calculate Result 2';
                Image = Calculate;
                trigger OnAction()
                var
                    AOCCalculator: Codeunit ARD_ResultsCalculatorRouter;
                begin
                    AOCCalculator.CalculateResult2(Rec, RunSampleData);
                end;
            }
        }
    }

    var
        Challenge1Body: Text;
        Challenge2Body: Text;
        ChallengeExample: Text;
        ChallengeData: Text;
        RunSampleData: Boolean;

    trigger OnAfterGetCurrRecord()
    begin
        Challenge1Body := RetrieveChallenge1Text();
        Challenge2Body := RetrieveChallenge2Text();
        ChallengeExample := RetrieveChallengeExample();
        ChallengeData := RetrieveChallengeData();
    end;

    procedure RetrieveChallenge1Text(): Text
    var
        TempBlob: codeunit "Temp Blob";
        VarOutStream: OutStream;
        VarInStream: InStream;
        ChallengeText: Text;
    begin
        ChallengeText := '';
        TempBlob.CreateOutStream(VarOutStream);
        TempBlob.CreateInStream(VarInStream);

        if Rec.ARD_Challenge1Text.ExportStream(VarOutStream) then
            VarInStream.Read(ChallengeText);

        exit(ChallengeText);
    end;

    procedure RetrieveChallenge2Text(): Text
    var
        TempBlob: codeunit "Temp Blob";
        VarOutStream: OutStream;
        VarInStream: InStream;
        ChallengeText: Text;
    begin
        ChallengeText := '';
        TempBlob.CreateOutStream(VarOutStream);
        TempBlob.CreateInStream(VarInStream);

        if Rec.ARD_Challenge2Text.ExportStream(VarOutStream) then
            VarInStream.Read(ChallengeText);

        exit(ChallengeText);
    end;

    procedure RetrieveChallengeExample(): Text
    var
        TempBlob: codeunit "Temp Blob";
        VarOutStream: OutStream;
        VarInStream: InStream;
        ChallengeText: Text;
    begin
        ChallengeText := '';
        TempBlob.CreateOutStream(VarOutStream);
        TempBlob.CreateInStream(VarInStream);

        if Rec.ARD_SimpleData.ExportStream(VarOutStream) then
            VarInStream.Read(ChallengeText);

        exit(ChallengeText);
    end;

    procedure RetrieveChallengeData(): Text
    var
        TempBlob: codeunit "Temp Blob";
        VarOutStream: OutStream;
        VarInStream: InStream;
        ChallengeText: Text;
    begin
        ChallengeText := '';
        TempBlob.CreateOutStream(VarOutStream);
        TempBlob.CreateInStream(VarInStream);

        if Rec.ARD_ChallengeData.ExportStream(VarOutStream) then
            VarInStream.Read(ChallengeText);

        exit(ChallengeText);
    end;
}
