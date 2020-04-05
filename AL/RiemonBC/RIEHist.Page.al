page 50102 "RIE Hist"
{
    PageType = List;
    SourceTable = "RIE Hist";
    Caption = 'RIE Hist';
    UsageCategory = Lists;
    ApplicationArea = ALL;
    //TODO: Ordenar descendente

    layout
    {
        area(content)
        {
            repeater(General)

            {
                field(Maceta; Maceta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Maceta', comment = 'ESP="Maceta"';
                }
                field(Fecha; Fecha)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Fecha', comment = 'ESP="Fecha"';
                }
                field(Hora; Hora)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Hora', comment = 'ESP="Hora"';
                }
                field("Nivel agua"; "Nivel agua")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Nivel agua', comment = 'ESP="Nivel agua"';
                }
                field(Humedad; Humedad)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Humedad', comment = 'ESP="Humedad"';
                }
                field(Iluminacion; Iluminacion)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Iluminacion', comment = 'ESP="Iluminacion"';
                }
                field(Temp; Temp)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Temp', comment = 'ESP="Temp"';
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Nombre', comment = 'ESP="Nombre"';
                }
                field(EstadoLuz; EstadoLuz)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Estado Luz', comment = 'ESP="Estado Luz"';
                }
                field(HumedadPlanta; HumedadPlanta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Humedad Planta', comment = 'ESP="Humedad Planta"';
                }
                field(EstadoAgua; EstadoAgua)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Estado Agua', comment = 'ESP="Estado Agua"';
                }
                field(Alerta; Alerta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Alerta', comment = 'ESP="Alerta"';
                }
                field(TextoAlerta; TextoAlerta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Texto Alerta', comment = 'ESP="Texto Alerta"';
                }
                field(UltimoReg; UltimoReg)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'UltimoReg', comment = 'ESP="UltimoReg"';
                }
            }
        }
    }
}
