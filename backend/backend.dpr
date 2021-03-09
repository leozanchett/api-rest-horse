program backend;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Horse, Horse.Jhonson, Horse.Commons ,  System.JSON;

var
  Users : TJSONArray;
  APP : THorse;

begin
  Users := TJSONArray.Create;
  APP := THorse.Create(9000); // porta do servidor
  try
    APP.Use(Jhonson());

    APP.Get('/users',
      // req = requisi��o | res = response.
      procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
      begin
        Res.Send<TJSONArray>(Users);
      end
    );

    APP.Post('/users',
      // req = requisi��o | res = response.
      procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
      var
        User : TJSONObject;
      begin
        User := Req.Body<TJSONObject>.Clone as TJSONObject;
        Users.AddElement(User);
        Res.Send<TJSONAncestor>(User.Clone).Status(THTTPStatus.created); // 201 = created. Por default estava retornando 200.
      end
    );

    APP.Delete('/users/:id',
      procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
      var
        id: Integer;
      begin
        id := Req.Params.Items['id'].ToInteger;
        Users.Remove(id - 1).Free;
        Res.Send<TJSONAncestor>(Users.Clone).Status(THTTPStatus.NoContent);
      end
    );

    APP.Start;
  finally
    // FreeAndNil(Users); n�o � necess�rio limpar mem�ria pois o Jhonson cuida disso.
  end;
end.
