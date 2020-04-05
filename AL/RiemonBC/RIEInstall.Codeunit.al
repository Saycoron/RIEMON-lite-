codeunit 50101 "RIE Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        RIEcfg: Record "RIE cfg";
    begin
        if NOT RIEcfg.Get() then begin
            RIEcfg.Init();
            RIEcfg.Insert();
        end;
    end;
}