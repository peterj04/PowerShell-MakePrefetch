######## ADD-TYPES
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Enable Rich Visual Styles in PowerShell Console Mode:
[System.Windows.Forms.Application]::EnableVisualStyles()
$ErrorActionPreference = "SilentlyContinue"

#______ BEGIN FORM LAYOUT ______ #
 ## FORM DESIGN
    $form = New-Object Windows.Forms.Form
    $form.Size = New-Object Drawing.Size @(595,485)
    $form.StartPosition = "CenterScreen"
    $form.CancelButton
    $form.Text = "Make Prefetch Version 2.0"
    $form.BackColor = "#e5f6ff"
    $form.SizeGripStyle = "hide"
    $form.ControlBox = $true
    $Font = New-Object System.Drawing.Font("Arial",9,[System.Drawing.FontStyle]::Regular)
    # Font styles are: Regular, Bold, Italic, Underline, Strikeout
    $Form.Font = $Font
    $form.AutoSize = $True
    #$form.AutoSizeMode = "GrowAndShrink"
    
## BUTTONS

    #Button: Make Prefetch
    $button1 = New-Object System.Windows.Forms.Button
    $System_Drawing_Point = New-Object System.Drawing.Point
    $button1.Size = New-Object System.Drawing.Size(100,23)
    $button1.Location = New-Object System.Drawing.Point(175,385)
    $button1.UseVisualStyleBackColor = $True
    $button1.Text = "Make Prefetch"
    $button1.add_click({$label2.text= "File: $((Get-Item $textbox.text).BaseName)$((Get-Item $textbox.text).Extension)"})
    $button1.add_click({$label3.text= "Path: $((Get-Item $textbox.text).FullName)"})
    $button1.add_click({$label4.text= "SHA1: $((Get-FileHash -Path $textbox.Text -Algorithm SHA1).Hash)"})
    $button1.add_click({$label5.text= "SHA256: $((Get-FileHash -Path $textbox.text -Algorithm SHA256).Hash)"})
    $button1.add_click({$label6.text= "Size: $((Get-Item $textbox.text).length)"})
    $button1.add_click({$richtextbox.Text = Write-Output "begin prefetch block" "add prefetch item name=$((Get-FileHash -Path $textbox.text -Algorithm SHA1).Hash) sha1=$((Get-FileHash -Path $textbox.text -Algorithm SHA1).Hash) Size=$((Get-Item $textbox.text).length)" "url=SWDProtocol://127.0.0.1:52311/Uploads/$((Get-FileHash -Path $textbox.text -Algorithm SHA1).Hash)/$((Get-Item $textbox.text).BaseName)$((Get-Item $textbox.text).extension).bfswd" "sha256=$((Get-FileHash -Path $textbox.text -Algorithm SHA256).Hash)" "end prefetch block"| Out-String})
    $form.Controls.Add($button1)

    
    #Button: Clear
    $button2 = New-Object System.Windows.Forms.Button
    $System_Drawing_Point = New-Object System.Drawing.Point
    $button2.Size = New-Object System.Drawing.Size(95,23)
    $button2.Location = New-Object System.Drawing.Point(280,385)
    $button2.UseVisualStyleBackColor = $True
    $button2.Text = "Reset"
    $button2.add_click({$label2.text= "File:"})
    $button2.add_click({$label3.text= "Path:"})
    $button2.add_click({$label4.text= "SHA1:"})
    $button2.add_click({$label5.text= "SHA256:"})
    $button2.add_click({$label6.text= "Size:"})
    $button2.add_click({$textbox.text= ""})
    $button2.add_click({$richtextbox.Text = ""})
    $form.Controls.Add($button2)

    <#
    # Button: Close
    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Size = New-Object System.Drawing.Size(75,23)
    $CancelButton.Location = New-Object System.Drawing.Point(492,38)
    $CancelButton.UseVisualStyleBackColor = $True
    $CancelButton.Text = "Close"
    $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.CancelButton = $CancelButton
    $form.Controls.Add($CancelButton)
    #>
    
    # Button: BROWSE
    $browse = New-Object System.Windows.Forms.Button
    $System_Drawing_Point = New-Object System.Drawing.Point
    $browse.Size = New-Object System.Drawing.Size(75,23)
    $browse.Location = New-Object System.Drawing.Point(285,38)
    $browse.UseVisualStyleBackColor = $True
    $browse.Text = "Browse"
    $form.Controls.Add($browse)
   
### LABELS ###
    
    ## Label: TITLE
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(15,20) 
    $label.Size = New-Object System.Drawing.Size(250,20) 
    $label.Text = "Enter File Path or Click Browse:"
    $form.Controls.Add($label) 

    # Label: FILE
    $label2 = New-Object System.Windows.Forms.Label
    $label2.AutoSize = $true
    #$label2.Size = New-Object System.Drawing.Size(280,20)
    $label2.Location = New-Object System.Drawing.Point(15,70) 
    $label2.Text = "File:"
    #$label2.Text = "File: $((Get-Item $textbox.text).BaseName)$((Get-Item $textbox.text).Extension)"
    $form.Controls.Add($label2)

    # Label: PATH
    $label3 = New-Object System.Windows.Forms.Label
    $label3.AutoSize = $true
    #$label3.Size = New-Object System.Drawing.Size(280,20)
    $label3.Location = New-Object System.Drawing.Point(15,92) 
    $label3.Text = "Path:"
    $form.Controls.Add($label3)

    # Label: SHA1
    $label4 = New-Object System.Windows.Forms.Label
    #$label4.Size = New-Object System.Drawing.Size(125,35)
    $label4.AutoSize = $true
    $label4.Location = New-Object System.Drawing.Point(15,113)
    $label4.Text = "SHA1:"
    $form.Controls.Add($label4) 

    # Label: SHA256
    $label5 = New-Object System.Windows.Forms.Label
    #$label5.Size = New-Object System.Drawing.Size(125,35)
    $label5.AutoSize = $true
    $label5.Location = New-Object System.Drawing.Point(15,134)
    $label5.Text = "SHA256:"
    $form.Controls.Add($label5) 
     
    ## LABEL: SIZE
    $label6 = New-Object System.Windows.Forms.Label
    $label6.AutoSize = $true
    $label6.Location = New-Object System.Drawing.Point(15,155)
    $label6.Text = "Size:"
    $form.Controls.Add($label6) 

### TEXTBOXES ###

## TextBox: INPUT
$textBox = New-Object System.Windows.Forms.TextBox 
$textBox.Location = New-Object System.Drawing.Point(15,40) 
$textBox.Size = New-Object System.Drawing.Size(260,20) 
$form.Controls.Add($textBox) 

## R.Text Box: Prefetch Statement
$richtextbox = New-Object System.Windows.Forms.RichTextBox
$richtextbox.Size = New-Object System.Drawing.Point(550,175)
$richtextbox.Location = New-Object System.Drawing.Point(15,205)
$richtextbox.Font = "Lucida Console" 
$form.Controls.Add($richtextbox)
    
#__________ END FORM LAYOUT __________#


## FUNCTIONS
    # Browse Button
    Function Get-FileName($initialDirectory)
    {   
     [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
     Out-Null

     $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
     $OpenFileDialog.initialDirectory = $initialDirectory
     $OpenFileDialog.filter = "All files (*.*)| *.*"
     $OpenFileDialog.ShowDialog() | Out-Null
     $OpenFileDialog.filename
     $OpenFileDialog.ShowHelp = $true
     } #end function Get-FileName

    $browse.add_click({$textbox.text = Get-FileName -initialDirectory "c:\"})
# -- END: Browse for file function


##     
$form.Topmost = $True
$form.Add_Shown({$textBox.Select()})

#DISPLAY FORM
$form.ShowDialog()
