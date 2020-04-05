table 50100 "RIE Macetas"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Maceta; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Flower pot', comment = 'ESP="Maceta"';
        }
        field(2; Planta; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Plant', comment = 'ESP="Planta"';
            TableRelation = "RIE Plantas";
            trigger OnValidate()
            var
                RIEPlantas: Record "RIE Plantas";
            begin
                if RIEPlantas.Get(Planta) then
                    Descripcion := RIEPlantas.Descripcion;
            end;
        }
        field(3; Descripcion; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Descripción', comment = 'ESP="Description"';
        }
    }
    keys
    {
        key(PK; Maceta)
        {
            Clustered = true;
        }
    }
}

