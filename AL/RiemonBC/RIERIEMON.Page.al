page 50104 "RIE RIEMON"
{
    PageType = List;
    SourceTable = "RIE Hist";
    Caption = 'RIEMON';
    UsageCategory = Lists;
    ApplicationArea = ALL;
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = false;
    //TODO: Ordenar descendente
    //TODO: Solo mostrar ultimos reg
    //TODO: Colocar imagen a las acciones
    layout
    {
        area(content)
        {
            repeater(General)

            {
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
                field(Maceta; Maceta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Maceta', comment = 'ESP="Maceta"';
                }
                field(Nombre; Nombre)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Nombre', comment = 'ESP="Nombre"';
                }
                field(HumedadPlanta; HumedadPlanta)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Humedad Planta', comment = 'ESP="Humedad Planta"';
                }

                field(Iluminacion; Iluminacion)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Iluminacion', comment = 'ESP="Iluminacion"';
                }
                field("Nivel agua"; "Nivel agua")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Nivel agua', comment = 'ESP="Nivel agua"';
                }
                field(Temp; Temp)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Temp', comment = 'ESP="Temp"';
                }
                field(Humedad; Humedad)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Humedad', comment = 'ESP="Humedad"';
                }
                field(EstadoLuz; EstadoLuz)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Estado Luz', comment = 'ESP="Estado Luz"';
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
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(getStatus)
            {
                Caption = 'Get Status', comment = 'ESP="Obtener estado"';
                ToolTip = 'Action to Get Status', comment = 'ESP="Accion para Obtener estado"';

                ApplicationArea = All;
                Image = LaunchWeb;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RIEWSNODE: Codeunit "RIE WS NODE";
                    RIEaccion: Enum "RIE accion";
                begin
                    RIEWSNODE.sendAction(RIEaccion::Estado, 0, true);
                end;

            }
        }
        area(Navigation)
        {
            group(Process)
            {
                Caption = 'Actions', comment = 'ESP="Acciones"';
                group(regar)
                {
                    Caption = 'Irrigate', comment = 'ESP="Regar"';
                    action(sendActionirrigate1)
                    {
                        Caption = 'Irrigate plant 1', comment = 'ESP="Regar planta 1"';
                        ToolTip = 'Action to Irrigate plant 1', comment = 'ESP="Accion para Regar Regar planta 1"';

                        ApplicationArea = All;
                        Image = LaunchWeb;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        var
                            RIEWSNODE: Codeunit "RIE WS NODE";
                            RIEaccion: Enum "RIE accion";
                        begin
                            RIEWSNODE.sendAction(RIEaccion::Estado, 0, true);
                            RIEWSNODE.sendAction(RIEaccion::regar, 1, true);
                        end;
                    }
                    action(sendActionirrigate2)
                    {
                        Caption = 'Irrigate plant 2', comment = 'ESP="Regar planta 2"';
                        ToolTip = 'Action to Irrigate plant 2', comment = 'ESP="Accion para Regar Regar planta 2"';

                        ApplicationArea = All;
                        Image = LaunchWeb;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        var
                            RIEWSNODE: Codeunit "RIE WS NODE";
                            RIEaccion: Enum "RIE accion";
                        begin
                            RIEWSNODE.sendAction(RIEaccion::Estado, 0, true);
                            RIEWSNODE.sendAction(RIEaccion::regar, 2, true);
                        end;
                    }
                    action(sendActionirrigate3)
                    {
                        Caption = 'Irrigate plant 3', comment = 'ESP="Regar planta 3"';
                        ToolTip = 'Action to Irrigate plant 3', comment = 'ESP="Accion para Regar Regar planta 3"';

                        ApplicationArea = All;
                        Image = LaunchWeb;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        var
                            RIEWSNODE: Codeunit "RIE WS NODE";
                            RIEaccion: Enum "RIE accion";
                        begin
                            RIEWSNODE.sendAction(RIEaccion::Estado, 0, true);
                            RIEWSNODE.sendAction(RIEaccion::regar, 3, true);
                        end;
                    }
                }
                group(lampara)
                {
                    Caption = 'Lamp', comment = 'ESP="Lampara"';
                    action(encenderLampara)
                    {
                        Caption = 'Turn on Lamp', comment = 'ESP="Encender Lámpara"';
                        ToolTip = 'Action to turn on Lamp', comment = 'ESP="Accion para Encender Lámpara"';

                        ApplicationArea = All;
                        Image = LaunchWeb;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        var
                            RIEWSNODE: Codeunit "RIE WS NODE";
                            RIEaccion: Enum "RIE accion";
                        begin
                            RIEWSNODE.sendAction(RIEaccion::encenderLuz, 0, true);
                        end;
                    }
                    action(apagarLampara)
                    {
                        Caption = 'Turn off Lamp', comment = 'ESP="Apagar Lámpara"';
                        ToolTip = 'Action to turn off Lamp', comment = 'ESP="Accion para Regar Apagar Lámpara"';

                        ApplicationArea = All;
                        Image = LaunchWeb;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        PromotedOnly = true;

                        trigger OnAction()
                        var
                            RIEWSNODE: Codeunit "RIE WS NODE";
                            RIEaccion: Enum "RIE accion";
                        begin
                            RIEWSNODE.sendAction(RIEaccion::apagarLuz, 0, true);
                        end;
                    }
                }
            }
        }
    }
}