page 50103 "RIE CFG"
{
    PageType = Card;
    SourceTable = "RIE cfg";
    Caption = 'RIE CFG';
    ApplicationArea = all;
    UsageCategory = Tasks;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Nivel de agua Min"; "Nivel de agua Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Nivel de agua Min', comment = 'ESP="Nivel de agua Min"';
                }
                field("Claridad ambiente min"; "Claridad ambiente min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Claridad ambiente min', comment = 'ESP="Claridad ambiente min"';
                }
                field("Claridad ambiente max"; "Claridad ambiente max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Claridad ambiente max', comment = 'ESP="Claridad ambiente max"';
                }
                field("Humedad ambiente Min"; "Humedad ambiente Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Humedad ambiente Min', comment = 'ESP="Humedad ambiente Min"';
                }
                field("Humedad ambiente Max"; "Humedad ambiente Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Humedad ambiente Max', comment = 'ESP="Humedad ambiente Max"';
                }
                field("Temp. ambiente Min"; "Temp. ambiente Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Temp. ambiente Min', comment = 'ESP="Temp. ambiente Min"';
                }
                field("Temp. ambiente Max"; "Temp. ambiente Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Temp. ambiente Max', comment = 'ESP="Temp. ambiente Max"';
                }
            }
            group(Autoriego)
            {
                Caption = 'Auto Riemon', comment = 'ESP="Auto Riemon"';
                field("Auto Riego humedad Min"; "Auto Riego humedad Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Auto Riego humedad Min', comment = 'ESP="Auto Riego humedad Min"';
                }
                field("Auto encender lampara"; "Auto encender lampara")
                {
                    ApplicationArea = All;
                    ToolTip = 'Auto encender lampara', comment = 'ESP="Auto encender lampara"';
                }
                field("Auto apagar lampara"; "Auto apagar lampara")
                {
                    ApplicationArea = All;
                    ToolTip = 'Auto apagar lampara', comment = 'ESP="Auto apagar lampara"';
                }
            }
            group(notificaciones)
            {
                Caption = 'Notifications', comment = 'ESP="Notificaciones"';
                field("Notificacion agua Min"; "Notificacion agua Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion agua Min', comment = 'ESP="Notificacion agua Min"';
                }
                field("Notificacion Claridad Min"; "Notificacion Claridad Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion Claridad Min', comment = 'ESP="Notificacion Claridad Min"';
                }
                field("Notificacion Claridad Max"; "Notificacion Claridad Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion Claridad Max', comment = 'ESP="Notificacion Claridad Max"';
                }
                field("Notificacion humedad Min"; "Notificacion humedad Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion humedad Min', comment = 'ESP="Notificacion humedad Min"';
                }
                field("Notificacion humedad Max"; "Notificacion humedad Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion humedad Max', comment = 'ESP="Notificacion humedad Max"';
                }
                field("Notificacion temp. Min"; "Notificacion temp. Min")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion temp. Min', comment = 'ESP="Notificacion temp. Min"';
                }
                field("Notificacion temp. Max"; "Notificacion temp. Max")
                {
                    ApplicationArea = All;
                    ToolTip = 'Notificacion temp. Max', comment = 'ESP="Notificacion temp. Max"';
                }
            }
            group(NODE)
            {
                field("NODE URL"; "NODE URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'NODE URL', comment = 'ESP="NODE URL"';
                }
                field("NODE USER"; "NODE USER")
                {
                    ApplicationArea = All;
                    ToolTip = 'NODE USER', comment = 'ESP="NODE USER"';
                }
                field("NODE PASS"; "NODE PASS")
                {
                    ApplicationArea = All;
                    ToolTip = 'NODE PASS', comment = 'ESP="NODE PASS"';
                }
            }
        }
    }
}
