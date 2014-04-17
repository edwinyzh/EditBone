inherited OptionsEditorOtherFrame: TOptionsEditorOtherFrame
  Width = 190
  Height = 256
  AutoSize = True
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 186
    Height = 256
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object CPASHighlighterLabel: TLabel
      Left = 2
      Top = 131
      Width = 170
      Height = 16
      Caption = 'Default C / Pascal Highlighter '
    end
    object SQLDialectLabel: TLabel
      Left = 2
      Top = 87
      Width = 69
      Height = 16
      Caption = 'SQL Dialect '
    end
    object CSSVersionLabel: TLabel
      Left = 2
      Top = 0
      Width = 71
      Height = 16
      Caption = 'CSS Version'
    end
    object PHPVersionLabel: TLabel
      Left = 2
      Top = 44
      Width = 69
      Height = 16
      Caption = 'PHP Version'
    end
    object DefaultEncodingLabel: TLabel
      Left = 2
      Top = 175
      Width = 95
      Height = 16
      Caption = 'Default Encoding'
    end
    object DefaultHighlighterLabel: TLabel
      Left = 2
      Top = 219
      Width = 109
      Height = 16
      Caption = 'Default Highlighter '
    end
    object CPASHighlighterComboBox: TBCComboBox
      Left = 0
      Top = 146
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 0
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object SQLDialectComboBox: TBCComboBox
      Left = 0
      Top = 103
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object CSSVersionComboBox: TBCComboBox
      Left = 0
      Top = 16
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 2
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object PHPVersionComboBox: TBCComboBox
      Left = 0
      Top = 59
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 3
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object DefaultEncodingComboBox: TBCComboBox
      Left = 0
      Top = 190
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 4
      Items.Strings = (
        'ASCII'
        'ANSI'
        'Big Endian Unicode'
        'Unicode '
        'UTF-7'
        'UTF-8'
        'UTF-8 Without BOM')
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object DefaultHighlighterComboBox: TBCComboBox
      Left = 0
      Top = 234
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      DropDownCount = 9
      TabOrder = 5
      Items.Strings = (
        '68HC11 Assembler'
        'AWK Scripts'
        'Baan 4GL'
        'C# (classic)'
        'C# (default)'
        'C# (twilight)'
        'C/C++ (classic)'
        'C/C++ (default)'
        'C/C++ (twilight)'
        'CA-Clipper'
        'Cache'
        'Cascading Stylesheets'
        'COBOL'
        'CORBA IDL'
        'CPM Reports'
        'DOT Graph Drawing'
        'DSP'
        'DWScript'
        'Eiffel'
        'Fortran'
        'Foxpro'
        'Galaxy'
        'GEMBASE'
        'GW-TEL'
        'Haskell'
        'HP48'
        'HTML & PHP'
        'INI'
        'Inno Setup Scripts'
        'Java'
        'Javascript'
        'Kixtart Scripts'
        'LEGO LDraw'
        'LLVM'
        'Modelica'
        'Modula-3'
        'Msg'
        'MS-DOS Batch'
        'Pascal (classic)'
        'Pascal (default)'
        'Pascal (twilight)'
        'Perl'
        'Progress'
        'Python'
        'Resource'
        'Ruby'
        'Semanta DD'
        'SQL'
        'Standard ML'
        'Structured Text'
        'Tcl/Tk'
        'TeX'
        'Text'
        'UNIX Shell'
        'Visual Basic'
        'VBScript'
        'Vrml97/X3D World'
        'Web IDL'
        'x86 Assembly'
        'XML'
        'YAML')
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
