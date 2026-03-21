# Intro

O projeto mostra uma infraestrutura básica criada utilizando o Terraform (IAC), onde temos uma instância ec2 sendo anexada a uma das subnets públicas dentro de uma VPC.

# Recursos criados com o Terraform.

🌐 Rede

 -  VPC customizada.
 -  Subnets públicas e privadas. Internet Gateway.
 -  NAT Gateway com Elastic IP.
 -  Tabelas de rotas (pública e privada).

🖥️ Computação

 - Instância EC2
 - Security Group com regras configuráveis.
 - Elastic IP associado.

# Colaboração

🔐 Backend Remoto (S3)

- Backend remoto com S3 para armazenamento do estado.

- O projeto utiliza um bucket S3 como backend para o estado do Terraform:

📦 Benefícios:

- Persistência do estado
- Trabalho em equipe
- Evita conflitos de execução
- Segurança e versionamento

# Utilização futura.
 
A infraestrutura pode ser completamente modificada para um outro tipo de arquitetura envolvendo por exemplo, a presença de uma instância RDS na subnet privada se comunicando com uma instância
ec2 na subnet pública através de um NATGW.
