$Path = "C:\dc_util"
Get-ChildItem "$Path" -Recurse | Unblock-File

$imagePath = 'C:\dc_util\Wallpaper\new_wallpaper.jpg'

$newImagePath = [System.IO.Path]::Combine([System.IO.Path]::GetDirectoryName($imagePath), (New-Guid).Guid + [System.IO.Path]::GetExtension($imagePath))
Copy-Item $imagePath $newImagePath

[Windows.System.UserProfile.LockScreen,Windows.System.UserProfile,ContentType=WindowsRuntime] | Out-Null
Add-Type -AssemblyName System.Runtime.WindowsRuntime

$asTaskGeneric = ([System.WindowsRuntimeSystemExtensions].GetMethods() | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]

Function Await($WinRtTask, $ResultType) {
    $asTask = $asTaskGeneric.MakeGenericMethod($ResultType)
    $netTask = $asTask.Invoke($null, @($WinRtTask))
    $netTask.Wait(-1) | Out-Null
    $netTask.Result
}

Function AwaitAction($WinRtAction) {
    $asTask = ([System.WindowsRuntimeSystemExtensions].GetMethods() | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and !$_.IsGenericMethod })[0]
    $netTask = $asTask.Invoke($null, @($WinRtAction))
    $netTask.Wait(-1) | Out-Null
}

[Windows.Storage.StorageFile,Windows.Storage,ContentType=WindowsRuntime] | Out-Null
$image = Await ([Windows.Storage.StorageFile]::GetFileFromPathAsync($newImagePath)) ([Windows.Storage.StorageFile])
AwaitAction ([Windows.System.UserProfile.LockScreen]::SetImageFileAsync($image))

Remove-Item $newImagePath
# SIG # Begin signature block
# MIIJDAYJKoZIhvcNAQcCoIII/TCCCPkCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUXwnfik5QEt4ODgGvUrL0EA0U
# mFSgggZtMIIGaTCCBVGgAwIBAgITQwAAACE7ggxRJ4FT8AAAAAAAITANBgkqhkiG
# 9w0BAQsFADBRMRMwEQYKCZImiZPyLGQBGRYDbmV0MRgwFgYKCZImiZPyLGQBGRYI
# ZGlhZ29uYWwxIDAeBgNVBAMTF2RpYWdvbmFsLVBSREFELVNSVjAwLUNBMB4XDTI0
# MTAwMzE5MzcyNVoXDTI2MTAwMzE5NDcyNVowgY8xEzARBgoJkiaJk/IsZAEZFgNu
# ZXQxGDAWBgoJkiaJk/IsZAEZFghkaWFnb25hbDEqMCgGA1UECxMhRERDIERpcmV0
# b3JpYSBEaWdpdGFsIGUgQ29tZXJjaWFsMREwDwYDVQQLEwhVc3VhcmlvczEfMB0G
# A1UEAxMWRGVuaWxzb24gQ291eSBkZSBBc3NpczCCASIwDQYJKoZIhvcNAQEBBQAD
# ggEPADCCAQoCggEBAL/TvkST6Krp4HCRps+LlCI12Q/1LZLQ1ZObOAl5JY82FQRZ
# 4QiJifvbMjBUXohHfasxpRFvcluL5vgkGII3Lowc/4H/AvZYWKJ9XxE6M7Mcz9Qp
# mZSFjWQ3K5NU7OncWtK05xMPKx8i//WzT/xCR3xZwO1XN5rpJAzNPQt16Z5oUUpH
# k9Lb4gEhII3HLYBM/+GWGvLfZYa5dYGkMYR3tNg2rQIW4vnUaOSYD4R2xMbwrcD2
# 6BlePELFE3sWJXFPVrwKsAUYhSfUoDXSRggQYEXMi2mDnkGmJhECUf8KK0mU3TIi
# Em84I1cGp0XuDGx4tWAP5BgMlwftjanjvYkUwHUCAwEAAaOCAvkwggL1MD4GCSsG
# AQQBgjcVBwQxMC8GJysGAQQBgjcVCIb+53uE5+tygeGbGYP+11+E9Yd9gW6C/fV7
# g6arTQIBZAIBBTATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4Aw
# GwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQU4fWoXLYhmUQ4
# Y4vCdEa+q0Qoc3owHwYDVR0jBBgwFoAU0+R5Posb+IDgrx/hgzwx315Ai08wgdoG
# A1UdHwSB0jCBzzCBzKCByaCBxoaBw2xkYXA6Ly8vQ049ZGlhZ29uYWwtUFJEQUQt
# U1JWMDAtQ0EsQ049UFJEQUQtU1JWMDAsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUy
# MFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9ZGlhZ29u
# YWwsREM9bmV0P2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFzZT9vYmplY3RD
# bGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDCBygYIKwYBBQUHAQEEgb0wgbowgbcG
# CCsGAQUFBzAChoGqbGRhcDovLy9DTj1kaWFnb25hbC1QUkRBRC1TUlYwMC1DQSxD
# Tj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049
# Q29uZmlndXJhdGlvbixEQz1kaWFnb25hbCxEQz1uZXQ/Y0FDZXJ0aWZpY2F0ZT9i
# YXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRob3JpdHkwOAYDVR0RBDEw
# L6AtBgorBgEEAYI3FAIDoB8MHWRlbmlsc29uLmNvdXlAZGlhZ29uYWwuc29jaWFs
# ME0GCSsGAQQBgjcZAgRAMD6gPAYKKwYBBAGCNxkCAaAuBCxTLTEtNS0yMS0yNzYw
# NDY2MjkyLTYzMDY5OTkyOC02MjQ0NzIxODYtNjI0OTANBgkqhkiG9w0BAQsFAAOC
# AQEAv6onQY/oovq3Tg+p1uF8X4c5o/ARdFPoTeH/FynaUqLznZaOeBJQTKd5cNLY
# oRkoiQ5fZ8d8ZZZDKKiq+zxDCpWof2S8YCmFwWIEWKyV0z6Tne9Zgab31hHuAQ4S
# aYuhzRi67he94dAhDRGSpR7kc6XgqLeGBzgke6UIzV0HciLlVQG8Vof/0GfAl7xR
# bn7osSndRbsCgrbtkVxi249qX68J1HYd5pvsNP/8IHT3AxfOB4hPpake15HZRup2
# ZdXRx+OZhvDRhtIe+C0eFKo9UWBOVNQa3rWqwNC0M2AGJ622I6hyOdfVGzMW5PSj
# Y8Z5pvEOyca3t7ivQ8kl3UapHjGCAgkwggIFAgEBMGgwUTETMBEGCgmSJomT8ixk
# ARkWA25ldDEYMBYGCgmSJomT8ixkARkWCGRpYWdvbmFsMSAwHgYDVQQDExdkaWFn
# b25hbC1QUkRBRC1TUlYwMC1DQQITQwAAACE7ggxRJ4FT8AAAAAAAITAJBgUrDgMC
# GgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYK
# KwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG
# 9w0BCQQxFgQUEUJrVep7lmp6wwB+vR7nisSHibMwDQYJKoZIhvcNAQEBBQAEggEA
# bSc8EFYp4XH+skuXG0rrE8t37iHHwBtGzx8ED7ol9TSclZ4EC1HlFlVKmOcrZvY8
# 658GWZzPp7pLFOkIf7MDdTPzpLiUvBpOaN5uJbS7ct+i7ZYOJKe3cGdOYUyv3pmM
# mUwie8ohyG6LDEIVR4yWlN077JXhUfCOkNypFQqSkB6kSnTWRvtLcmRc+VFz/phS
# s/CIvlHa8Isx+Gx/vyWW8RczfjDUeGOpCOUnZ6q9+p+eBVTkfGqUKyu1D6r521dy
# hsbY5nNd0Vxf4Sa7XcZStA1YsXfRwcdLnIeNEvRpGeqi1qdT9W/Hv/b/2k3K4KBc
# Ckwlxr2E3H8zHVPmP0zMvA==
# SIG # End signature block
