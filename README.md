# API-REST-HORSE

Para esse projeto foi utilizado o Boss como gerenciador de pacotes 
https://github.com/HashLoad/boss

Para instalar os pacotes basta apenas abrir o Power Shell no diretório aonde se encontra o projeto <br> 
e executar: boss install <link do repositório github>
 
Também foi utilizado o Horse como servidor local e os Middlewares Jhonson, Basic, Authentication, Horse-Compression, Handle-Exception, Horse-Octet-Stream, Horse-logger, Horse-Paginate e Horse-ETag.
- https://github.com/HashLoad/horse  / Reponsável por gerênciar a api, servidor local.
- https://github.com/HashLoad/jhonson / Serialize e Deserialize de json.
- https://github.com/HashLoad/horse-basic-auth / Autenticação de valores, utilizando a criptográfia basic auth.
- https://github.com/HashLoad/horse-compression  / Responsável por efetuar o encoding (comprimir o código/json enviado) diminuindo bem considerávelmente os bytes trafegados por requisições.
- https://github.com/HashLoad/handle-exception / Responsável por tratar as exceções da API.
- https://github.com/HashLoad/horse-octet-stream / Manipular arquivos e streams.
- https://github.com/HashLoad/horse-logger / Acessar e gerar logs.
- https://github.com/bittencourtthulio/Horse-Paginate / Paginação de Dados JSON.
- https://github.com/viniciussanchez/dataset-serialize / Serialização de JSON para Dataset e vice-versa.
- https://github.com/bittencourtthulio/Horse-ETag / Controle de requisições baseadas em uma tag/hash.
