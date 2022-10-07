inherited ReportCliente: TReportCliente
  inherited Report: TRLReport
    inherited BandeCabecalho: TRLBand
      object lblCodigo: TRLLabel
        Left = 5
        Top = 0
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lblNome: TRLLabel
        Left = 70
        Top = 0
        Width = 41
        Height = 16
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lblSobrenome: TRLLabel
        Left = 230
        Top = 0
        Width = 78
        Height = 16
        Caption = 'Sobrenome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lblEmail: TRLLabel
        Left = 390
        Top = 0
        Width = 40
        Height = 16
        Caption = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object lblTelefone: TRLLabel
        Left = 615
        Top = 0
        Width = 60
        Height = 16
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    inherited BandDetail: TRLBand
      object txtCodigo: TRLDBText
        Left = 9
        Top = -4
        Width = 49
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'id'
        DataSource = dsReport
        Layout = tlCenter
        Text = ''
      end
      object txtNome: TRLDBText
        Left = 74
        Top = -4
        Width = 150
        Height = 16
        AutoSize = False
        DataField = 'nome'
        DataSource = dsReport
        Layout = tlCenter
        Text = ''
      end
      object txtSobrenome: TRLDBText
        Left = 234
        Top = -4
        Width = 150
        Height = 16
        AutoSize = False
        DataField = 'sobrenome'
        DataSource = dsReport
        Layout = tlCenter
        Text = ''
      end
      object txtEmail: TRLDBText
        Left = 394
        Top = -4
        Width = 219
        Height = 16
        AutoSize = False
        DataField = 'email'
        DataSource = dsReport
        Layout = tlCenter
        Text = ''
      end
      object txtTelefone: TRLDBText
        Left = 619
        Top = -4
        Width = 95
        Height = 16
        AutoSize = False
        DataField = 'telefone'
        DataSource = dsReport
        Layout = tlCenter
        Text = ''
      end
    end
  end
end
