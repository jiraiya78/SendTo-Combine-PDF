# Combine PDF Tool

A lightweight PowerShell-based utility to **merge multiple PDF files** via the **Windows "Send To" menu**.

This tool lets you:
- Merge PDFs using a simple PowerShell script.
- Add a right-click **"Send To → Combine PDFs"** context shortcut.
- See color-coded logs and status while merging.
- Automatically close PowerShell after running.

---

## 📦 Features

- 🧩 Merge multiple PDF files into one
- 🎨 Color-coded console output (success, errors, progress)
- 📁 Output file saved in the same folder with timestamp
- 🖱️ "Send To" integration via shortcut
- 🧼 Auto-closing PowerShell (optional popup at end)

---

## 🚀 Getting Started

### 1. Requirements

- Windows with PowerShell
- [.NET Framework 4.x](https://dotnet.microsoft.com/en-us/download/dotnet-framework)
- [`PdfSharp.dll`](https://github.com/empira/PDFsharp) in the script folder

---

### 2. Setup

#### 🔧 Step-by-step

1. **Download or clone this repo**
2. Ensure the following files are in the same folder:
    - `CombinePDFs.ps1`
    - `CombinePDFs.bat`
    - `PdfSharp.dll`
3. **Run** `Installer - Create SendTo.bat` to create the shortcut in your `SendTo` folder
4. You're ready to use it!

---

## 🖱️ How to Use

1. Select multiple PDF files in File Explorer
2. Right-click → **Send To → Combine PDFs**
3. The tool will:
    - Open a PowerShell window
    - Display progress in color
    - Save merged file as `Combined_YYYYMMDD_HHMMSS.pdf`
    - Optionally show a message box when done

---

## 📄 Output File

- Merged PDF saved in the **same folder** as the first selected file.
- Filename: `Combined_YYYYMMDD_HHMMSS.pdf`

---

## 💡 Notes

- If you see **"file not found"** errors, make sure the selected PDFs exist and are accessible.
- PowerShell must be allowed to run scripts:  
  You may need to run:  
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
