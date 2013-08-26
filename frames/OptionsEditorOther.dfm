object EditorOtherFrame: TEditorOtherFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object CPASHighlighterLabel: TLabel
      Left = 11
      Top = 136
      Width = 142
      Height = 13
      Caption = 'Default C / Pascal Highlighter '
    end
    object SQLDialectLabel: TLabel
      Left = 11
      Top = 92
      Width = 57
      Height = 13
      Caption = 'SQL Dialect '
    end
    object CSSVersionLabel: TLabel
      Left = 11
      Top = 5
      Width = 57
      Height = 13
      Caption = 'CSS Version'
    end
    object PHPVersionLabel: TLabel
      Left = 11
      Top = 49
      Width = 57
      Height = 13
      Caption = 'PHP Version'
    end
    object DefaultEncodingLabel: TLabel
      Left = 11
      Top = 180
      Width = 81
      Height = 13
      Caption = 'Default Encoding'
    end
    object DefaultHighlighterLabel: TLabel
      Left = 11
      Top = 224
      Width = 92
      Height = 13
      Caption = 'Default Highlighter '
    end
    object CPASHighlighterComboBox: TBCComboBox
      Left = 9
      Top = 151
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 0
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object SQLDialectComboBox: TBCComboBox
      Left = 9
      Top = 108
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object CSSVersionComboBox: TBCComboBox
      Left = 9
      Top = 21
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 2
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object PHPVersionComboBox: TBCComboBox
      Left = 9
      Top = 64
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 3
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object DefaultEncodingComboBox: TBCComboBox
      Left = 9
      Top = 195
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
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
      Left = 9
      Top = 239
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
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
