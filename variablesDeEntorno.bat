REM BAT QUE CREA VARIABLES DE ENTORNO MODIFICAR SEGUN SEA NECESARIO.
REM EL .BAT SE TIENE QUE EJECUTAR COMO ADMINISTRADOR.

@echo off
setx RIEMON_NODE_SERVER /m "127.0.0.1"
setx RIEMON_NODE_PORT /m "3000"
setx RIEMON_NODE_USER /m "root"
setx RIEMON_NODE_PASS /m "L3nt3j4"
setx RIEMON_BC_URLHist /m "riemon"
setx RIEMON_BC_URLCFG /m "riemon"
setx RIEMON_BC_USER /m "root"
setx RIEMON_BC_PASS /m "L3nt3j4"
pause