page 50101 "RIE Rie Plantas"
{
    PageType = List;
    SourceTable = "RIE Plantas";
    Caption = 'Rie Plantas';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Planta; Planta)
                {
                    ApplicationArea = All;
                    ToolTip = 'Planta', comment = 'ESP="Planta"';
                }
                field(Descripcion; Descripcion)
                {
                    ApplicationArea = All;
                    ToolTip = 'Descripcion', comment = 'ESP="Descripcion"';
                }
                field("Claridad min"; "Claridad min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min allowable lighting plant', comment = 'ESP="Iluminación min permitida para planta"';
                }
                field("Claridad max"; "Claridad max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum allowable lighting plant', comment = 'ESP="Iluminación máxima permitida para planta"';
                }
                field("Humedad Min"; "Humedad Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Min moisture allowed for plant', comment = 'ESP="Humedad min permitida para planta"';
                }
                field("Humedad Max"; "Humedad Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maximum moisture allowed for plant', comment = 'ESP="Humedad máxima permitida para planta"';
                }
            }
        }
    }

}
