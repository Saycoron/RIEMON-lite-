table 50102 "RIE Hist"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Mov; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; Fecha; Date)
        {
            DataClassification = CustomerContent;
        }
        field(3; Hora; Time)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Nivel agua"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(5; Iluminacion; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(6; Humedad; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(7; Temp; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(8; Planta; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(9; Nombre; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(10; HumedadPlanta; decimal)
        {
            DataClassification = CustomerContent;
        }
        field(11; Alerta; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(12; TextoAlerta; text[2048])
        {
            DataClassification = CustomerContent;
        }
        field(13; EstadoAgua; Enum "RIE estado")
        {
            DataClassification = CustomerContent;
        }
        field(14; EstadoLuz; Enum "RIE estado")
        {
            DataClassification = CustomerContent;
        }
        field(15; UltimoReg; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(16; Maceta; Integer)
        {
            DataClassification = CustomerContent;
            TableRelation = "RIE Macetas";
        }
        field(30; ID; Guid)
        {
            DataClassification = CustomerContent;
        }
        /*
               field(31; "ultima fecha mod para api"; Guid)
       {
           DataClassification = CustomerContent;
       }
       field(32; "otro campo para api"; Guid)
       {
           DataClassification = CustomerContent;
       }
        */
    }

    keys
    {
        key(PK; Mov)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        id := CreateGuid();
    end;

    procedure SetInformation(data: JsonObject; plantPot: Integer)
    var
        JObject: JsonObject;
        HumedadPlantaAux1: Decimal;
        HumedadPlantaAux2: Decimal;
        HumedadPlantaAux3: Decimal;
        plantAux: code[20];
        plantNameAux: text[250];
        nivelAguaAux: Decimal;
    begin
        JObject := data;
        alertaAux := false;
        textoAlertaAux := '';
        Init();
        nivelAguaAux := GetValue(JObject, 'nivelAguaValor').AsDecimal();
        Iluminacion := GetValue(JObject, 'claridadValor').AsDecimal();
        Humedad := GetValue(JObject, 'humedadAmbiente').AsDecimal();
        Temp := GetValue(JObject, 'tempAmbiente').AsDecimal();
        HumedadPlantaAux1 := GetValue(JObject, 'humedadPlanta1').AsDecimal();
        HumedadPlantaAux2 := GetValue(JObject, 'humedadPlanta2').AsDecimal();
        HumedadPlantaAux3 := GetValue(JObject, 'humedadPlanta3').AsDecimal();

        case plantPot of
            1:
                HumedadPlanta := HumedadPlantaAux1;
            2:
                HumedadPlanta := HumedadPlantaAux2;
            3:
                HumedadPlanta := HumedadPlantaAux3;
        end;

        //Ocosas
        Validate(Fecha, today());
        Validate(Hora, Time());
        Validate(Maceta, plantPot);

        GetPlantData(plantAux, plantNameAux, plantPot);
        Validate(Planta, plantAux);
        Validate(Nombre, plantNameAux);
        //Validate();

        Validate("Nivel agua", GetWaterStatus("Nivel agua"));
        Validate(EstadoAgua, GetHumidityStatus(HumedadPlanta));
        Validate(EstadoLuz, GetLampStatus(Iluminacion));
        ClearLastReg(Maceta);
        UltimoReg := true;

        Insert(true);
    end;

    local procedure GetValue(JObject: JsonObject; "Key": Text): JsonValue
    var
        JToken: JsonToken;
    begin
        if JObject.Get("Key", JToken) then
            exit(JToken.AsValue());
    end;

    local procedure GetPlantData(var plant: Code[20]; var plantName: text[250]; plantPot: Integer)
    var
        RIEMacetas: Record "RIE Macetas";
    begin
        RIEMacetas.get(plantPot);
        plant := RIEMacetas.Planta;
        plantName := RIEMacetas.Descripcion;
    end;

    local procedure GetWaterStatus(waterLevel: Decimal) Water: Decimal //TODO:Falta ver cual es el verdadero valor de los sensores
    begin
        Water := waterLevel; //TODO: falta formula que calcule el porcentaje del envase
        if Water < 50 then begin
            alertaAux := true;
            if textoAlertaAux <> '' then
                textoAlertaAux += ', ';
            textoAlertaAux += 'Agua'; //TODO: agregar alertas
        end;
    end;

    local procedure GetLampStatus(lamp: Decimal; plantPot: Integer): Enum "RIE estado" //TODO:Falta ver cual es el verdadero valor de los sensores
    var
        lampStatus: Enum "RIE estado";
    begin
        if lamp < 50 then begin
            alertaAux := true;
            if textoAlertaAux <> '' then
                textoAlertaAux += ', ';
            textoAlertaAux += 'Agua'; //TODO: agregar alertas
            exit(lampStatus::desfavorable);
        end;

        if (lamp > 50) and (lamp < 100) then
            exit(lampStatus::intermedio);
        if lamp > 1000 then
            exit(lampStatus::Favorable);
    end;

    local procedure GetHumidityStatus(humidity: Decimal; plantPot: Integer): Enum "RIE estado" //TODO:Falta ver cual es el verdadero valor de los sensores
    var
        RIEMacetas: Record "RIE Macetas";
        RIEPlantas: Record "RIE Plantas";
        HumidityStatus: Enum "RIE estado";
    begin
        if RIEMacetas.get(plantPot) then
            if RIEPlantas.get(RIEMacetas.Planta) then begin

                //FIXME: Como agregarias esto ?  si tengo rango minimo de 10..100 ejmeplo como quedarme con 
                // 10,11,12..........................................................................100
                // desfavorable <     intermedio      |    optimo   |     intermedio      > desfavorable 
                if Humidity < 50 then begin
                    alertaAux := true;
                    if textoAlertaAux <> '' then
                        textoAlertaAux += ', ';
                    textoAlertaAux += 'humidity'; //TODO: agregar alertas
                    exit(HumidityStatus::desfavorable);
                end;

                if (Humidity > 50) and (Humidity < 100) then
                    exit(HumidityStatus::intermedio);
                if Humidity > 1000 then
                    exit(HumidityStatus::Favorable);
            end;
    end;

    local procedure ClearLastReg(MacetaAux: Integer)
    var
        RIEHist: Record "RIE Hist";
    begin
        RIEHist.SetRange(Maceta, MacetaAux);
        RIEHist.SetRange(UltimoReg, true);
        if not RIEHist.IsEmpty() then
            if RIEHist.Findset() then
                repeat
                    RIEHist.UltimoReg := false;
                    RIEHist.Modify();
                until RIEHist.next() = 0;
    end;

    var
        alertaAux: Boolean;
        textoAlertaAux: text[2048];
}