# PowerShell-MakePrefetch

<b>Details:</b>  
Creates a prefetch block statement that you can copy and paste into an IBM BigFix task or fixlet.

<b>Usage:</b>  
When you run the script you should get an input box where you enter the full path to your file name (without quotes) and the script will output a file named "prefetch.txt" to the directory that you ran the script from.

<b>Text File Output Example:</b>  
File Path: C:\Con_Worksheet.pdf
SHA1: 5ECA3E18ABC9EF67E00D1868B330D497482A6650 
SHA256: 6017D552AF20FAD7311123887B6E06B73A47263E267FD515CA7F395AFD79F3C1
Size: 14233

################################### Prefetch Statement Below ###############################################################*

begin prefetch block add prefetch item name=5ECA3E18ABC9EF67E00D1868B330D497482A6650 sha1=5ECA3E18ABC9EF67E00D1868B330D497482A6650 Size=14233 url=SWDProtocol://127.0.0.1:52311/Uploads/5ECA3E18ABC9EF67E00D1868B330D497482A6650/Con_Worksheet.pdf.bfswd 
sha256=6017D552AF20FAD7311123887B6E06B73A47263E267FD515CA7F395AFD79F3C1
end prefetch block
