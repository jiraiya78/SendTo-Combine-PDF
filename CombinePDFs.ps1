param(
    [Parameter(Mandatory=$true, ValueFromRemainingArguments=$true)]
    [string[]]$inputFiles
)

Write-Host "Received files count: $($inputFiles.Count)" -ForegroundColor Cyan
Write-Host "Files:"
$inputFiles | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }

Add-Type -AssemblyName System.Windows.Forms
Add-Type -Path "$PSScriptRoot\PdfSharp.dll"

$pdfs = $inputFiles | Where-Object { $_.ToLower().EndsWith(".pdf") } | Sort-Object

if ($pdfs.Count -lt 2) {
    [System.Windows.Forms.MessageBox]::Show("Please select at least two PDF files.", "Error")
    exit
}

# Show files info before processing
<# Write-Host "Number of PDF files selected: $($pdfs.Count)"
Write-Host "Files to be processed:"
$pdfs | ForEach-Object { Write-Host " - $_" } #>

$outputFolder = Split-Path -Parent $pdfs[0]
$outputFile = Join-Path $outputFolder ("Combined_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".pdf")

$outputDoc = New-Object PdfSharp.Pdf.PdfDocument

for ($index = 0; $index -lt $pdfs.Count; $index++) {
    $file = $pdfs[$index]
	Write-Host ("-" * 60) -ForegroundColor DarkGray
    Write-Host "Processing file $($index + 1) of $($pdfs.Count): $file"

    $inputDoc = [PdfSharp.Pdf.IO.PdfReader]::Open($file, [PdfSharp.Pdf.IO.PdfDocumentOpenMode]::Import)

    for ($pageIndex = 0; $pageIndex -lt $inputDoc.PageCount; $pageIndex++) {
        Write-Host " Adding page $($pageIndex + 1) of $($inputDoc.PageCount)"
        $page = $inputDoc.Pages[$pageIndex]
        $outputDoc.AddPage($page) | Out-Null
    }
}

$outputDoc.Save($outputFile)

#[System.Windows.Forms.MessageBox]::Show("Combined PDF saved to:`n$outputFile", "Success")

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show("Combined PDF saved to:`n$outputFile", "Done", 'OK', 'Information')
