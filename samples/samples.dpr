program samples;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, DataSet.Serialize,
  Horse,
  Horse.Paginate,
  Horse.Jhonson,
  System.JSON,
  Datasnap.DBClient,
  Services.bairro in 'src\services\Services.bairro.pas' {ServiceBairro: TDataModule};

var
  AHorse: THorse;

begin
  AHorse := THorse.Create(9000);
  AHorse
    .Use(Paginate)
    .Use(Jhonson);

  AHorse.Get('/bairros',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LService: TServiceBairro;
    begin
      LService := TServiceBairro.Create(nil);
      try
        Res.Send<TJSONArray>(LService.ListarBairros.ToJSONArray());
      finally
        FreeAndNil(LService);
      end;
    end);

  AHorse.Listen(9000);
end.
