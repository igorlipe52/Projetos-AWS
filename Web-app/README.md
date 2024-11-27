# Calculadora de Potência Web-app

Web-app na AWS: usamos o AWS Amplify para hospedar a aplicação(Calculadora de Potência). Para realizar a operação matemática, utilizamos o AWS Lambda, invocado por uma REST API no API Gateway. O resultado da operação é armazenado em uma tabela no DynamoDB, com as permissões adequadas configuradas no IAM.

1) Usaremos o Amplify para hostear a nossa aplicação "index".

![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/e428688b-6909-4c6d-aacc-c7075c538d2c)

* Zipe o arquivo index antes de anexá-lo (você voltará aqui no último passo).

![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/2b121e5d-6854-471f-9556-397d3c51dd3d)

2) Utilizaremos o Lambda para criar a função que irá realizar a nossa operação matemática.

![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/3b11dd88-a295-4780-baef-f7ab5181f4bd)

   - Dentro da função, substitua a origem do código, pela "Função-Lambda" (escrita em python).
    
     * Se quiser, configure um evento de teste para verificar a função Lambda, e não se esqueça de dar deploy na função.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/983eaa85-a4a7-4749-843e-4c13fabe5084)


 3) Criaremos uma REST API dentro do API Gateway para invocar a função Lambda.

 ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/24648a5f-659a-4ee9-9733-ace45ea7a76a)

    - Dentro da REST API desenvolvida, criaremos um método POST.
    
      * Ao lado da região escolhida, seleciona a função lambda.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/16923e26-0e7f-48a8-a022-6a6eb5c3a866)

    - Depois do método criado, é hora de habilitar o CORS. Selecione o caminho "/" e clique em "Habilitar CORS".

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/c1205b42-642d-4ecd-b5f2-362f4009e1a1)

    - Em seguida, implante a API, criando um estágio.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/a80f9c86-ecc7-446d-9f30-6e0c8371b7b8)

    - Em detalhes do estágio, copie a URL para invocar a API (anote em um notepad).

   4) Agora, criaremos uma tabela no DynamoDB para armazenar o resultado da nossa calculadora.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/fd5edef4-224f-48b2-ad04-ac57bf79e703)
   * Deixe o resto como está e crie a tabela.

     - Dentro da tabela, copie o ARN (Nome do recurso da Amazon) e novamente, anote em um notepad.
    
   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/f9be41e2-98ae-4805-8d32-4d18a7576180)

   - De volta para aba da função Lambda, clique no nome da função, para criarmos no IAM, o permissionamento necessário para o DynamoDB ter acesso a função.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/ef23eb94-a974-4a54-87e0-92bd22d1cd58)

   - Clique em política de linha

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/f039f85e-7415-4b0b-afa5-a6595b707841)

   - Em seguida, substitua o editor de políticas com o "Policy-JSON" e cole o ARN onde está o retângulo vermelho.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/1a8d2890-c22d-4aeb-bdf1-38d6060a400b)

   - Clique em próximo, dê um nome para a policy e clique em criar.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/c1fa1b8d-900b-485a-add1-d2fcf96d2c2b)

   5) Na função Lambda, não esqueça de substituir o nome da sua tabela no retângulo vermelho.

   ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/fa9587e3-f1ee-43cc-b012-3253c4e64833)

   6) Por fim, volte ao arquivo anexado no amplify, edite o index e substitua o url copiado em seu notepad para invocar a API em "URL para invocar a API", zipe o arquivo novamente e dê deploy.

      MEU EXEMPLO:

      ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/d264417d-921c-46a3-932d-65ed8be6065d)


   7) Demonstração do funcionamento da aplicação e o armazenamento do resultado no DynamoDB.

      ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/9fdbd31f-fec7-409a-8d7d-06648e9c9898)

      ![image](https://github.com/igorlipe52/Projetos-AWS/assets/140567532/df66c927-8c04-4694-9ab4-db1a1d583c89)

 



   











 


  


