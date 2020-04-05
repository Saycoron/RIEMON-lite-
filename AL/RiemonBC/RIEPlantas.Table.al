table 50101 "RIE Plantas"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Planta; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Plant', comment = 'ESP="Planta"';
        }
        field(2; Descripcion; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Descripción', comment = 'ESP="Description"';
        }
        field(3; "Humedad Min"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Humidity min', comment = 'ESP="Humedad min"';
        }
        field(4; "Humedad Max"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Humidity max', comment = 'ESP="Humedad max"';
        }
        field(5; "Claridad min"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Clarity min', comment = 'ESP="Claridad min"';
        }
        field(6; "Claridad max"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Clarity max', comment = 'ESP="Claridad max"';
        }
        field(7; Imagen; Media)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Planta)
        {
            Clustered = true;
        }
    }
}
