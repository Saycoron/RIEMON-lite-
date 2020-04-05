page 50100 "RIE Macetas"
{
    PageType = List;
    SourceTable = "RIE Macetas";
    Caption = 'RIE Macetas';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Maceta; Maceta)
                {
                    ApplicationArea = All;
                    ToolTip = 'Maceta', comment = 'ESP="Maceta"';
                }
                field(Planta; Planta)
                {
                    ApplicationArea = All;
                    ToolTip = 'Plant Code', comment = 'ESP="Codigo de planta"';
                }
                field(Descripcion; Descripcion)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Descripcion', comment = 'ESP="Descripcion"';
                }
            }
        }
    }
}
