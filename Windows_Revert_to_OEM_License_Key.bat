@Echo Off
Set "pkey="
For /F "Tokens=2 Delims==" %%A In ('
    WMIC Path SoftwareLicensingService Get OA3xOriginalProductKey /Value
') Do Set "pkey=%%A"
If Not Defined pkey Exit /B
cscript C:\Windows\system32\slmgr.vbs /ipk %pkey%