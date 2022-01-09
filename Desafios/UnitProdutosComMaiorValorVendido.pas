unit UnitProdutosComMaiorValorVendido;

interface

uses
  Generics.Collections, System.SysUtils, System.StrUtils;

function ProdutosComMaiorValorVendido (Produtos: TObjectList<TProduto>): string;

implementation

function ProdutosComMaiorValorVendido (Produtos: TObjectList<TProduto>): string;
var
  vProduto: TProduto;
  vDict: TDictionary<Integer, currency>;
  vItem: TPair<integer, currency>;
  I, J: integer;
  vArray, vResultArray: TArray<currency>;
  vPairs, vResultPairs: array of TPair<integer, currency>;
begin
  if (Produtos = nil) or (Produtos.Count < 1) then
    begin
      Result:= 'Lista vazia';
      Exit;
    end;
  vDict:= TDictionary<Integer, currency>.Create;
  Result:= '';
  try
    SetLength(vArray, 0);
    for vProduto in Produtos do
      vDict.AddOrSetValue(vProduto.Codigo, 0);
    for vItem in vDict do
      begin
        SetLength(vArray, Length(vArray) +1);
        for vProduto in Produtos do
          begin
            if vProduto.Codigo = vItem.Key then
              vArray[High(vArray)]:= vArray[High(vArray)] + vProduto.Qtde * vProduto.Valor;
          end;
        SetLength(vPairs, Length(vPairs) +1);
        vPairs[High(vPairs)]:= vItem;
        vPairs[High(vPairs)].Value:= vArray[High(vArray)];
      end;
    TArray.Sort<currency>(vArray);
    J:= 0;
    I:= High(vArray);
    while (I>=0) and (J<3) do
      begin
        SetLength(vResultArray, Length(vResultArray) +1);
        vResultArray[J]:= vArray[I];
        Inc(J, 1);
        Inc(I, -1);
      end;
    SetLength(vArray, 0);
    for I := Low(vResultArray) to High(vResultArray) do
      begin
        for J:= Low(vPairs) to High(vPairs) do
          begin
            if vPairs[J].Value = vResultArray[I] then
              begin
                SetLength(vResultPairs, Length(vResultPairs) +1);
                vResultPairs[I]:= vPairs[J];
                break;
              end;
          end;
      end;
      for I:= Low(vResultPairs) to High(vResultPairs) do
        Result:= Result + Format('%d:%.2f', [vResultPairs[I].Key, vResultPairs[I].Value]) + IfThen(I<>High(vResultPairs),';','');
  finally
    vDict.Free;
    SetLength(vResultArray, 0);
  end;
end;

end.