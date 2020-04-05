table 50103 "RIE cfg"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; Mov; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Temp. ambiente Min"; Decimal)
        {
            DataClassification = SystemMetadata;
            Caption = 'Ambient Temp. Min.', comment = 'ESP="Temp ambiente Min"';
        }
        field(3; "Temp. ambiente Max"; Decimal)
        {
            DataClassification = SystemMetadata;
            Caption = 'Ambient Temp. Max.', comment = 'ESP="Temp ambiente Max"';
        }
        field(4; "Humedad ambiente Min"; Decimal)
        {
            DataClassification = SystemMetadata;
            Caption = 'Humidity Temp. Min.', comment = 'ESP="Humedad ambiente Min"';
        }
        field(5; "Humedad ambiente Max"; Decimal)
        {
            DataClassification = SystemMetadata;
            Caption = 'Humidity Temp. Max.', comment = 'ESP="Humedad ambiente Max"';
        }
        field(6; "Nivel de agua Min"; Decimal)
        {
            DataClassification = SystemMetadata;
            Caption = 'Min water level', comment = 'ESP="Nivel de agua Min"';
        }
        field(7; "Claridad ambiente min"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Clarity min', comment = 'ESP="Claridad min"';
        }
        field(8; "Claridad ambiente max"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Clarity max', comment = 'ESP="Claridad max"';
        }
        field(9; "Notificacion agua Min"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Min water notification', comment = 'ESP="Notificacion agua Min"';
        }
        field(10; "Notificacion temp. Min"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Min temp. notification', comment = 'ESP="Notificacion temp. Min"';
        }
        field(11; "Notificacion temp. Max"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Max temp. notification', comment = 'ESP="Notificacion temp. Max"';
        }
        field(12; "Notificacion humedad Min"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Min Humidity notification', comment = 'ESP="Notificacion humedad Min"';
        }
        field(13; "Notificacion humedad Max"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Max Humidity notification', comment = 'ESP="Notificacion humedad Max"';
        }
        field(14; "Notificacion Claridad Min"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Min Claridad notification', comment = 'ESP="Notificacion Claridad Min"';
        }
        field(15; "Notificacion Claridad Max"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Max Claridad notification', comment = 'ESP="Notificacion Claridad Max"';
        }
        field(16; "Auto Riego humedad Min"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Irrigation Humidity Min', comment = 'ESP="Auto Riego humedad Min"';
        }
        field(17; "Auto encender lampara"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Auto turn on lamp', comment = 'ESP="Encender lámpara"';
        }
        field(18; "Auto apagar lampara"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Auto turn off lamp', comment = 'ESP="Auto apagar lámpara"';
        }
        field(25; "NODE URL"; text[2048])
        {
            DataClassification = CustomerContent;
            Caption = 'NODE URL', comment = 'ESP="URL NODE"';
        }
        field(26; "NODE USER"; text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'NODE USER', comment = 'ESP="USER NODE"';
        }
        field(27; "NODE PASS"; text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'NODE PASS', comment = 'ESP="PASS NODE"';
        }
        field(30; ID; Guid)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Mov)
        {
            Clustered = true;
        }
    }
}