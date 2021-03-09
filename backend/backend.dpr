program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse;

begin
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong nhonhom');
    end);

  THorse.Listen(9000);  // porta do servidor
end.
