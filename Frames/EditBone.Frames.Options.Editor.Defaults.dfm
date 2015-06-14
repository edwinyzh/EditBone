inherited OptionsEditorDefaultsFrame: TOptionsEditorDefaultsFrame
  Width = 190
  Height = 171
  Visible = False
  ExplicitWidth = 190
  ExplicitHeight = 171
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 186
    Height = 171
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object ComboBoxDefaultColor: TBCComboBox
      Left = 0
      Top = 17
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Color'
      BoundLabel.Indent = 4
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 0
    end
    object ComboBoxDefaultEncoding: TBCComboBox
      Left = 0
      Top = 61
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Encoding'
      BoundLabel.Indent = 4
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 1
      Items.Strings = (
        'ASCII'
        'ANSI'
        'Big Endian Unicode'
        'Unicode '
        'UTF-7'
        'UTF-8'
        'UTF-8 Without BOM')
    end
    object ComboBoxDefaultHighlighter: TBCComboBox
      Left = 0
      Top = 105
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'Highlighter '
      BoundLabel.Indent = 4
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 2
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
    end
    object ComboBoxDefaultSQLHighlighter: TBCComboBox
      Left = 0
      Top = 149
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Alignment = taLeftJustify
      BoundLabel.Active = True
      BoundLabel.Caption = 'SQL Highlighter '
      BoundLabel.Indent = 4
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      DropDownCount = 9
      SkinData.SkinSection = 'COMBOBOX'
      VerticalAlignment = taAlignTop
      Style = csOwnerDrawFixed
      ItemIndex = -1
      TabOrder = 3
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
    end
  end
  inherited FrameAdapter: TsFrameAdapter
    Left = 142
    Top = 30
  end
end
