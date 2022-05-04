unit Biblioteca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DB, DBClient, Menus, StdCtrls, ExtCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, ComCtrls, Buttons, DBCtrls, Mask,inifiles,Strutils,DateUtils,VO,
  Atributos,Rtti;

   procedure ConfiguraCDSFromVO(pCDS: TClientDataSet; pVOClass: TClassVO);
   procedure ConfiguraGridFromVO(pGrid: TJvDBUltimGrid; pVOClass: TClassVO);
   procedure AtualizaCaptionGrid(pGrid: TJvDBUltimGrid; pFieldName, pCaption: string);
   procedure ConfiguraTamanhoColunaGrid(pGrid: TJvDBUltimGrid; pFieldName: string; pTamanho: integer; pCaption: String);
   procedure RemoveDiretorio(Dir: String);

implementation

uses UDataModuleNfe;

procedure RemoveDiretorio(Dir: String);
var
  Result: TSearchRec; Found: Boolean;
begin
  Found := False;
  if FindFirst(Dir + '\*', faAnyFile, Result) = 0 then
  while not Found do
  begin
    if (Result.Attr and faDirectory = faDirectory) AND (Result.Name <> '.') AND
    (Result.Name <> '..') then RemoveDiretorio(Dir + '\' + Result.Name)
    else if (Result.Attr and faAnyFile <> faDirectory) then DeleteFile(Dir + '\' + Result.Name);
    Found := FindNext(Result) <> 0;
  end;
  FindClose(Result); RemoveDir(Dir);
end;

procedure ConfiguraCDSFromVO(pCDS: TClientDataSet; pVOClass: TClassVO);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
  NomeTipo: string;

  function LengthAtributo(pColumn: Atributos.TColumn): integer; overload;
  begin
    if pColumn.Length > 0 then
      Result := pColumn.Length
    else
      Result := 50;
  end;

function LengthAtributo(pColumn: Atributos.TColumnDisplay): integer; overload;

begin
  if pColumn.Length > 0 then
    Result := pColumn.Length
  else
  Result := 50;
end;

begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pVOClass);

    // Configura ClientDataset
    pCDS.Close;
    pCDS.FieldDefs.Clear;
    pCDS.IndexDefs.Clear;

    // Preenche os nomes dos campos do CDS
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TId then
        begin
          pCDS.FieldDefs.add('ID', ftInteger);
        end

        else if Atributo is Atributos.TColumn then
        begin
          if Propriedade.PropertyType.TypeKind in [tkString, tkUString] then
          begin
            pCDS.FieldDefs.add((Atributo as Atributos.TColumn).Name, ftString, LengthAtributo(Atributo as Atributos.TColumn));
          end
          else if Propriedade.PropertyType.TypeKind in [tkFloat] then
          begin
            NomeTipo := LowerCase(Propriedade.PropertyType.Name);
            if NomeTipo = 'tdatetime' then
              pCDS.FieldDefs.add((Atributo as Atributos.TColumn).Name, ftDateTime)
            else
              pCDS.FieldDefs.add((Atributo as Atributos.TColumn).Name, ftFloat);
          end
          else if Propriedade.PropertyType.TypeKind in [tkInt64, tkInteger] then
          begin
            pCDS.FieldDefs.add((Atributo as Atributos.TColumn).Name, ftInteger);
          end
          else if Propriedade.PropertyType.TypeKind in [tkEnumeration] then
          begin
            pCDS.FieldDefs.add((Atributo as TColumn).Name, ftBoolean);
          end;
        end;

      end;
    end;

   //if pCDS.Name <> 'CdsNfeFormaPagamento'  then
   pCDS.CreateDataSet;

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin

        if Atributo is TColumn then
          NomeTipo := (Atributo as TColumn).Name;
        if Atributo is TId then
          NomeTipo := (Atributo as TId).NameField;

        if Atributo is TFormatter then
        begin
          // Máscaras
          if Propriedade.PropertyType.TypeKind in [tkInt64, tkInteger] then
            TNumericField(pCDS.FieldByName(NomeTipo)).DisplayFormat := (Atributo as Atributos.TFormatter).Formatter;
          if Propriedade.PropertyType.TypeKind in [tkFloat] then
            TNumericField(pCDS.FieldByName(NomeTipo)).DisplayFormat := (Atributo as Atributos.TFormatter).Formatter;
          if Propriedade.PropertyType.TypeKind in [tkString, tkUString] then
            TStringField(pCDS.FieldByName(NomeTipo)).EditMask := (Atributo as Atributos.TFormatter).Formatter;
          // Alinhamento
          TStringField(pCDS.FieldByName(NomeTipo)).Alignment := (Atributo as TFormatter).Alignment;
        end;
      end;
    end;

  finally
    Contexto.Free;
  end;
end;

procedure ConfiguraGridFromVO(pGrid: TJvDBUltimGrid; pVOClass: TClassVO);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(pVOClass);

    // Configura a Grid
    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin

        if Atributo is TId then
        begin
          if (Atributo as TId).LocalDisplayContainsOneTheseItems([ldGrid, ldLookup]) then
          begin
            AtualizaCaptionGrid(pGrid, (Atributo as TId).NameField, 'ID');
          end
          else
          begin
            ConfiguraTamanhoColunaGrid(pGrid, (Atributo as TId).NameField, -1, 'ID');
          end;
        end

        else if Atributo is TColumn then
        begin
          if (Atributo as TColumn).LocalDisplayContainsOneTheseItems([ldGrid, ldLookup]) then
          begin
            AtualizaCaptionGrid(pGrid, (Atributo as TColumn).Name, (Atributo as TColumn).Caption);

            if (Atributo as TColumn).Length > 0 then
            begin
              ConfiguraTamanhoColunaGrid(pGrid, (Atributo as TColumn).Name, (Atributo as TColumn).Length, (Atributo as TColumn).Caption);
            end;
          end
          else
          begin
            ConfiguraTamanhoColunaGrid(pGrid, (Atributo as TColumn).Name, -1, (Atributo as TColumn).Caption);
          end;
        end;

      end;
    end;
  finally
    Contexto.Free;
  end;
end;

procedure AtualizaCaptionGrid(pGrid: TJvDBUltimGrid; pFieldName, pCaption: string);
var
  i: integer;
begin
  for i := 0 to pGrid.Columns.Count - 1 do
  begin
    if pGrid.Columns[i].FieldName = pFieldName then
    begin
      pGrid.Columns[i].Title.Caption := pCaption;
      pGrid.Columns[i].Title.Alignment := taCenter;
      pGrid.Columns[i].Title.Font.Color := clBlack;
      pGrid.Columns[i].Title.Font.Style := [fsbold];
      Break;
    end;
  end;
end;

procedure ConfiguraTamanhoColunaGrid(pGrid: TJvDBUltimGrid; pFieldName: string; pTamanho: integer; pCaption: String);
var
  i: integer;
begin
  for i := 0 to pGrid.Columns.Count - 1 do
  begin
    if pGrid.Columns[i].FieldName = pFieldName then
    begin
      if pTamanho <= 0 then
      begin
        pGrid.Columns[i].Visible := False;
      end
      else
      begin
        if pTamanho < (Length(pCaption) * 8) then
          pTamanho := (Length(pCaption) * 6);
        pGrid.Columns[i].Visible := True;
        pGrid.Columns[i].Width := pTamanho;
      end;
      Break;
    end;
  end;
end;

end.
