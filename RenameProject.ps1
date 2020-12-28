# $ErrorActionPreference = "SilentlyContinue"
$OrgProjectName = "SampleTemplate"
$NewProjectName = "testtest"

$orgForm = "MyForm"
$NewForm = "TestForm"

# SampleTemplate
function eChange($fileName, $ext){
    (Get-Content "$fileName").replace($OrgProjectName, $NewProjectName).replace($orgForm, $NewForm) | Set-Content -Encoding utf8 "$fileName"
    Rename-Item -Path $fileName -NewName $NewProjectName$ext
}

function eChange2($fileName, $ext){
    (Get-Content "$fileName").replace($OrgProjectName, $NewProjectName).replace($orgForm, $NewForm) | Set-Content -Encoding utf8 "$fileName"
    Rename-Item -Path $fileName -NewName $NewForm$ext
}
eChange "$OrgProjectName.sln" ".sln"
eChange "$OrgProjectName/$OrgProjectName.vcxproj" ".vcxproj"
eChange "$OrgProjectName/$OrgProjectName.vcxproj.user" ".vcxproj.user"
eChange "$OrgProjectName/$OrgProjectName.vcxproj.filters" ".vcxproj.filters"

eChange2 "$OrgProjectName/MyForm.cpp" ".cpp"
eChange2 "$OrgProjectName/MyForm.h" ".h"

Rename-Item -Path $OrgProjectName -NewName $NewProjectName

# (Get-Content "$OrgProjectName.sln").replace($OrgProjectName, $NewProjectName) | Set-Content "$OrgProjectName.sln"
# (Get-Content "$OrgProjectName/$OrgProjectName.vcxproj").replace($OrgProjectName, $NewProjectName) | Set-Content "$OrgProjectName/$OrgProjectName.vcxproj"



# Rename-Item -Path "$OrgProjectName.sln" -NewName "$ProjectName.sln"

