inherited ServiceBaseCliente: TServiceBaseCliente
  inherited Connection: TFDConnection
    Connected = True
  end
  inherited qRecord: TFDQuery
    SQL.Strings = (
      'select id, nome, sobrenome, email, telefone'
      'from cliente')
    object qRecordid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qRecordnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 60
    end
    object qRecordsobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Required = True
      Size = 60
    end
    object qRecordemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 60
    end
    object qRecordtelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 60
    end
  end
end
