#############################################
#                                           #
#  Author: Jeremiah Peterson                #
#  Date Created: 12/1/2015                  #
#  PowerShell Version: 4.0                  #
#                                           #
#############################################

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form 
$form.Text = "Data Entry Form"
$form.Size = New-Object System.Drawing.Size(300,200) 
$form.StartPosition = "CenterScreen"

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = "Cancel"
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20) 
$label.Size = New-Object System.Drawing.Size(280,20) 
$label.Text = "Enter the full path to your file without quotes:"
$form.Controls.Add($label) 

$textBox = New-Object System.Windows.Forms.TextBox 
$textBox.Location = New-Object System.Drawing.Point(10,40) 
$textBox.Size = New-Object System.Drawing.Size(260,20) 
$form.Controls.Add($textBox) 

$form.Topmost = $True

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)

#Output Results Below
{
    $x = $textBox.Text    
    Write-Output "File Name: $((Get-Item $x).BaseName)$((Get-Item $x).Extension)" | Out-file $pwd\Prefetch.txt
    Write-Output "File Path: $((Get-Item $x).FullName)" | Out-file $pwd\Prefetch.txt
    Write-Output "SHA1: $((Get-FileHash -Path $x -Algorithm SHA1).Hash)" | Out-file -Append $pwd\Prefetch.txt 
    Write-Output "SHA256: $((Get-FileHash -Path $x -Algorithm SHA256).Hash)" | Out-file -Append $pwd\Prefetch.txt
    Write-Output "Size: $((Get-Item $x).length)"| Out-file -Append $pwd\Prefetch.txt
    Write-Output " " | Out-file -Append $pwd\Prefetch.txt
    Write-Output "######################################### Prefetch Statement Below ###############################################################" | Out-file -Append $pwd\Prefetch.txt
    Write-Output " " | Out-file -Append $pwd\Prefetch.txt
    Write-Output "begin prefetch block" | Out-file -Append $pwd\Prefetch.txt
    Write-Output "add prefetch item name=$((Get-FileHash -Path $x -Algorithm SHA1).Hash) sha1=$((Get-FileHash -Path $x -Algorithm SHA1).Hash) Size=$((Get-Item $x).length)" | Out-file -Append $pwd\Prefetch.txt
    Write-Output "url=SWDProtocol://127.0.0.1:52311/Uploads/$((Get-FileHash -Path $x -Algorithm SHA1).Hash)/$((Get-Item $x).BaseName)$((Get-Item $x).extension).bfswd" | Out-file -Append $pwd\Prefetch.txt
    Write-Output "sha256=$((Get-FileHash -Path $x -Algorithm SHA256).Hash)" | Out-file -Append $pwd\Prefetch.txt
    Write-Output "end prefetch block" | Out-file -Append $pwd\Prefetch.txt
}
