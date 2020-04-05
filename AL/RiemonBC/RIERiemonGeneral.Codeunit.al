codeunit 50100 "RIE Riemon General"
{
    procedure fontColorChange(VAR styleColor: Text; Validations: Text)
    // Para funcionar correctamente necesitamos:
    // 1- Propiedad StyleExpr en los campos en los que queremos cambiar el estilo. Ejemplo: StyleExpr = fontStyle (Variable global de página).
    // 2- Usa un disparador para llamar a nuestra función a la cual pasaremos como la variable global que asignamos a la propiedad StyleExpr.
    // 3- Modifica el parámetro "Validación", el caso y los colores que queremos usar.
    begin
        case Validations of
            'Soft Red':
                styleColor := 'Attention';
            'Soft blue':
                styleColor := 'AttentionAccent';
            'Soft gray':
                styleColor := 'Subordinate';
            'Standard Black':
                styleColor := 'Standard';
            'Standard Blue':
                styleColor := 'StandardAccent';
            'Strong Black':
                styleColor := 'Strong';
            'Strong Blue':
                styleColor := 'StrongAccent';
            'Red strong':
                styleColor := 'Unfavorable';
            'Green':
                styleColor := 'Favorable';
            'Yellow':
                styleColor := 'Ambiguous';
        end;
    end;
}