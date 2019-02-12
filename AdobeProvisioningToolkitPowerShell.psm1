function Set-AdobeProvisioningToolkitAdobe_PRTKFilePath {
    param (
        $Path
    )
    $Script:Adobe_PRTKFilePath = $Path
}

function Get-AdobeProvisioningToolkitAdobe_PRTKFilePath {
    if ($Script:Adobe_PRTKFilePath) {
        $Script:Adobe_PRTKFilePath
    } else {
        $adobe_prtkPath = Get-Command adobe_prtk.exe |
        Select-Object -ExpandProperty Source
    
        if ($adobe_prtkPath) {
            $Script:Adobe_PRTKFilePath = $adobe_prtkPath
            $Script:Adobe_PRTKFilePath
        } else {
            Throw "Set-AdobeProvisioningToolkitAdobe_PRTKFilePath not called and no adobe_prtk.exe found any directory in Path environment variable"
        }
    }
}

function Invoke-AdobeProvisioningToolkitSerialize {
    param (
        $SerialNumber,
        $LicensingIdentifier,
        $ProvisioningXMLFilePath
    )
    & $Script:Adobe_PRTKFilePath --tool=VolumeSerialize --generate --serial=$SerialNumber --leid=$LicensingIdentifier --provfilepath=$ProvisioningXMLFilePath
}

function Get-AdobeProvisioningToolkitLicensingIdentifiers {
    Start-Process https://helpx.adobe.com/enterprise/package/help/creative-cloud-licensing-identifiers.html
}