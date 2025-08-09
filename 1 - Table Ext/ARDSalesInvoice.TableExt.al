tableextension 50001 ARD_SalesInvoice extends "Sales Invoice Header"
{
    fields
    {
        field(50000; ARD_Campaign; Integer)
        {
            Caption = 'Campaign';
            DataClassification = CustomerContent;
        }
        field(50001; ARD_CampaignName; Text[50])
        {
            Caption = 'Campaign Name';
            FieldClass = FlowField;
            CalcFormula = lookup(ARD_Campaign.ARD_Name WHERe("ARD_No." = field(ARD_Campaign)));
        }
    }
}
