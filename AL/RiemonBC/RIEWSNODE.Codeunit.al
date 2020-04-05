codeunit 50102 "RIE WS NODE"
{
    procedure sendAction(accion: Enum "RIE accion"; maceta: Integer; asistida: Boolean)
    notAllowed: Boolean;
    begin
        case accion of
            accion::Estado:
                begin
                    doSendAction(accion::Estado, 1);
                    doSendAction(accion::Estado, 2);
                    doSendAction(accion::Estado, 3);
                end;
            accion::regar:
                begin
                    if asistida then begin
                        //TODO:Validar si tiene agua suficiente buscando el ultimo reg y comparando con la cfg
                        //TODO:Validar temp buscando el ultimo reg y comparando con la cfg
                        //TODO:Validar claridad buscando el ultimo reg y comparando con la cfg
                        //TODO:Validar con humendad ambiental y comparando con la cfg
                        //agregar un confir que te muestre todas las incidencias  y si le das si que lo haga si no que salgo
                        doSendAction(accion, maceta);
                    end;
                end;

            else
                doSendAction(accion, maceta);
        end;
    end;

    local procedure doSendAction(accion: Enum "RIE accion"; maceta: Integer)
    var
        RIEHist: Record "RIE Hist";
        Client: HttpClient;
        Headers: HttpHeaders;
        //RequestHeaders: HttpHeaders;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        responseText: text;
        Response: JsonObject;
        AuthText: text;
        URL: Text;
    begin
        EnableWebServiceCallsInSandbox();
        URL := RIEcfg."NODE URL";
        Content.WriteFrom(GetActionData(accion, maceta));
        Content.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');
        AuthText := StrSubstNo('%1:%2', RIEcfg."NODE USER", RIEcfg."NODE PASS");

        //Client.DefaultRequestHeaders().Add('Authorization', StrSubstNo('Basic %1', BaseConvert.ToBase64(authtext)));
        Client.DefaultRequestHeaders().Add('If-Match', '*');
        Client.SetBaseAddress(URL);
        if not Client.Post(URL, Content, ResponseMessage) then
            Message(Format(ResponseMessage.HttpStatusCode()) + ' ' + Format(ResponseMessage.Headers()));
        if ResponseMessage.HttpStatusCode() > 300 then
            Message('asd'); //TODO: Falta agregar validaciones si falla login o WS

        If ResponseMessage.Content().ReadAs(responseText) then
            Response.ReadFrom(responseText);

        RIEHist.SetInformation(Response, maceta);
    end;

    local procedure GetActionData(accion: Enum "RIE accion"; maceta: Integer) Data: Text
    begin
        Data := '{"accion": "' + Format(accion) +
        '","maceta": "' + Format(maceta) + '"}';
    end;

    procedure EnableWebServiceCallsInSandbox()
    var
        NAVAppSetting: Record "NAV App Setting";
        EnvironmentInfo: Codeunit "Environment Information";
        AppInfo: ModuleInfo;
    begin
        IF NOT RIEcfg.FindFirst() then;
        NavApp.GetCurrentModuleInfo(AppInfo);
        if EnvironmentInfo.IsSandbox() then begin
            NAVAppSetting."App ID" := AppInfo.Id();
            NAVAppSetting."Allow HttpClient Requests" := true;
            if not NAVAppSetting.Insert() then
                NAVAppSetting.Modify();
        end;
    end;

    var
        RIEcfg: Record "RIE cfg";
}