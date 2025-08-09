page 50001 ARD_AICampaign
{
    ApplicationArea = All;
    Caption = 'AI Campaign';
    PageType = Card;
    SourceTable = ARD_Campaign;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(ARD_Name; Rec.ARD_Name)
                {
                }
                field(ARD_StartDate; Rec.ARD_StartDate)
                {
                }
                field(ARD_EndDate; Rec.ARD_EndDate)
                {
                }
                field(ARD_MaxQuantity; Rec.ARD_MaxQuantity)
                {
                }
            }
            group(Items)
            {
                Caption = 'Campaign Items';
                
                part(CampaignItems; ARD_CampaignItem)
                {
                    ApplicationArea = All;
                    SubPageLink = "ARD_CampaignNo." = field("ARD_No.");
                }
            }
            group(PostalCodes)
            {
                Caption = 'Campaign Postal Codes';
                
                part(CampaignPostalCodes; ARD_CampaignPostalCodes)
                {
                    ApplicationArea = All;
                    SubPageLink = "ARD_CampaignNo." = field("ARD_No.");
                }
            }
        }
    }
    actions
    {
        area(Prompting)
        {
            Action(GenerateCampaignRegion)
            {
                Caption = 'Generate Campaign Regions';
                ToolTip = 'Generate a new campaign region based on AI suggestions.';
                Image = Sparkle;
                ApplicationArea = All;

                trigger OnAction()
                var
                    CampaignPrompt: Page ARD_CampaignPrompt;
                    CampaignRegionText: Text;
                begin
                    if CampaignPrompt.RunModal() = Action::OK then begin
                        CampaignRegionText := CampaignPrompt.GetResult();
                        ParsePostalCodes(CampaignRegionText);
                    end;
                end;
            }
        }
    }

    local procedure ParsePostalCodes(PostalCodesJSON: Text): Text
    var
        CampaignPostalCode: Record ARD_CampaignPostalCode;
        RegionName: Text;
        PostalCode: Text;
        JObject: JsonObject;
        JPostalObject: JsonObject;
        JArray: JsonArray;
        JToken: JsonToken;
    begin

        if not JObject.ReadFrom(PostalCodesJSON) then
            Error('Invalid JSON format.');

        if not JObject.Get('PostalCodes', JToken) then
            Error('PostalCodes field not found in JSON.');

        if not JToken.IsArray() then
            Error('PostalCodes field is not an array.');
        
        JArray := JToken.AsArray();

        foreach JToken in JArray do begin
            JPostalObject := JToken.AsObject();
            RegionName := JPostalObject.GetText('Region Name', true);
            PostalCode := JPostalObject.GetText('Postal Code', true);

            CampaignPostalCode.Init();
            CampaignPostalCode."ARD_CampaignNo." := Rec."ARD_No.";
            CampaignPostalCode.ARD_PostalCode := CopyStr(PostalCode, 1, 10); // Ensure Postal Code is within the defined length
            CampaignPostalCode.ARD_RegionName := CopyStr(RegionName, 1, 100); // Ensure Region Name is within the defined length
            CampaignPostalCode.Insert(true);
        end;
    end;
}
